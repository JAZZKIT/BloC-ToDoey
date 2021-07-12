import 'package:flutter/material.dart';
import 'package:to_do/logic/cubit/cubit_navigator_task.dart';
import 'package:to_do/logic/cubit/cubit_tasks.dart';
import 'package:to_do/logic/cubit/task_navigator_state.dart';
import 'package:to_do/logic/cubit/task_state.dart';
import 'package:to_do/presentation/screens/add_task_screen.dart';
import 'package:to_do/presentation/screens/task_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: MultiBlocProvider(
          providers: [
            BlocProvider<TaskCubit>(
              create: (context) => TaskCubit(),
            ),
            BlocProvider<TaskNavigator>(
              create: (context) => TaskNavigator(),
            ),
          ],
          child: BlocListener<TaskNavigator, TaskNavigatorState>(
            listener: (context, state) async {
              if (state is AddNewTaskNavigationState) {
                final result = await showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  builder: (context) => SingleChildScrollView(
                    child: Container(
                      padding: EdgeInsets.only(
                          bottom: MediaQuery.of(context).viewInsets.bottom),
                      child: AddTaskScreen(),
                    ),
                  ),
                );
                if (result != null) {
                  context.read<TaskCubit>().addTask(result);
                }
              }
            },
            child: TasksScreen(),
          ),
        ));
  }
}
