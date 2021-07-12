import 'package:flutter/material.dart';
import 'package:to_do/logic/cubit/cubit_tasks.dart';
import 'package:to_do/presentation/screens/task_screen.dart';
//import 'package:flutter_bloc/flutter_bloc.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: TasksScreen(),
    );
  }
}
