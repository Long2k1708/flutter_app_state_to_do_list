import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

import 'package:app_state_to_do_list/app_state/datas/TaskData.dart';
import 'package:app_state_to_do_list/app_state/models/TaskModel.dart';

class MainScreen extends StatelessWidget {
  final TextEditingController edtController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    _buildAddNewTaskZone() {
      var id = 0;

      return new ScopedModelDescendant<TaskModel>(
        builder: (context, child, taskData) {
          return new Row(
            children: <Widget>[
              new Container(
                padding: const EdgeInsets.all(10),
                width: MediaQuery.of(context).size.width - 50,
                child: new TextField(
                  controller: edtController,
                  decoration: new InputDecoration(
                    hintText: 'Type here your task',
                  ),
                ),
              ),
              new Container(
                  child: new IconButton(
                onPressed: () {
                  TaskData data = new TaskData();
                  data.id = id++;
                  data.taskName = edtController.text;
                  data.completed = false;
                  taskData.addTask(data);
                  edtController.text = '';
                },
                icon: Icon(Icons.add, color: Colors.black),
              )),
            ],
          );
        },
      );
    }

    _buildTaskList() {
      return new ScopedModelDescendant<TaskModel>(
        builder: (context, child, taskdata) {
          List<ListTile> tiles = new List<ListTile>();
          tiles.add(
            new ListTile(
              leading: new Text("ID"),
              title: new Text("Task Name"),
              trailing: new Text("Completed?"),
            ),
          );
          for (var i = 0; i < taskdata.tasks.length; i++) {
            final tmpData = taskdata.tasks[i];
            final tintColor = i % 2 != 0 ? Colors.red : Colors.blue;
            tiles.add(
              new ListTile(
                onTap: () {
                  taskdata.toggleTask(tmpData);
                },
                leading: new Text(
                  tmpData.id.toString(),
                  style: TextStyle(color: tintColor),
                ),
                title: new Text(
                  tmpData.taskName,
                  style: TextStyle(
                    color: tintColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                trailing: tmpData.completed
                    ? Icon(Icons.check_box, color: tintColor)
                    : Icon(Icons.check_box_outline_blank, color: tintColor),
              ),
            );
          }

          return new Flexible(
            flex: 1,
            child: new ListView(
              children: tiles,
            ),
          );
        },
      );
    }

    return new MaterialApp(
      title: "To Do List",
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text("To Do List"),
        ),
        body: new Column(
          children: <Widget>[
            _buildAddNewTaskZone(),
            _buildTaskList(),
          ],
        ),
      ),
    );
  }
}
