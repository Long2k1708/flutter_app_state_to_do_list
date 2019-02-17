import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

import 'package:app_state_to_do_list/screens/MainScreen.dart';
import 'package:app_state_to_do_list/app_state/models/TaskModel.dart';

void main() => runApp(
  ScopedModel<TaskModel>(
    model: TaskModel(),
    child: MyApp(),
  )
);

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: MainScreen(),
    );
  }
}