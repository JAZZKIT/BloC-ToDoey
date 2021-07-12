import 'package:flutter/material.dart';
import 'package:to_do/logic/cubit/cubit_navigator_task.dart';
import 'package:to_do/logic/cubit/task_state.dart';
import 'package:to_do/presentation/widget/task_list.dart';
import 'package:to_do/shared/constants.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do/logic/cubit/cubit_tasks.dart';

class TasksScreen extends StatelessWidget {
  const TasksScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blueAccent,
        onPressed: context.read<TaskNavigator>().onAddNewTask,
        child: Icon(Icons.add),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.only(top: 60, left: 30, right: 30, bottom: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  child: Icon(
                    Icons.list,
                  ),
                  backgroundColor: Colors.white,
                  radius: 30,
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Todoey',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 50,
                      fontWeight: FontWeight.w700),
                ),
                Text(
                  '${BlocProvider.of<TaskCubit>(context).cubitListTask.taskCount} task(s) left',
                  //'7 task(s) left',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                )
              ],
            ),
          ),
          Expanded(
            child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                decoration: roundContainerDecoration,
                child: BlocBuilder<TaskCubit, TaskListState>(
                  builder: (context, state) {
                    if (state is ShowTasksState) {
                      context.read<TaskCubit>().giveTask();
                      return TaskList();
                    } else {
                      return CircularProgressIndicator();
                    }
                  },
                )
                //TaskList(),
                ),
          ),
        ],
      ),
    );
  }
}
