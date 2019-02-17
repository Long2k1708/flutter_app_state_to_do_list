import 'dart:collection';
import 'package:scoped_model/scoped_model.dart';

import 'package:app_state_to_do_list/app_state/datas/TaskData.dart';

class TaskModel extends Model {
  final List<TaskData> _tasks = [];
  UnmodifiableListView<TaskData> get tasks => UnmodifiableListView(_tasks);

  void addTask(TaskData task) {
    _tasks.add(task);
    notifyListeners();
  }

  void toggleTask(TaskData task) {
    int indexOfCurrentTask = _tasks.indexOf(task, 0);
    TaskData taskDataTmp = task;
    taskDataTmp.completed = !taskDataTmp.completed;
    _tasks.removeAt(indexOfCurrentTask);
    _tasks.insert(indexOfCurrentTask, taskDataTmp);
    notifyListeners();
  }

  void removeTask(TaskData task) {
    _tasks.remove(task);
    notifyListeners();
  }
}