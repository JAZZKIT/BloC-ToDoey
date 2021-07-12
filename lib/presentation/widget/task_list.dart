import 'package:flutter/material.dart';
import 'package:to_do/logic/cubit/cubit_tasks.dart';
import 'package:to_do/presentation/widget/task_tile.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TaskList extends StatelessWidget {
  const TaskList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) {
        final cubitTasks = context.read<TaskCubit>();
        final task = cubitTasks.cubitListTask.tasks[index];
        return TaskTile(
          isChecked: task.isDone,
          title: task.name,
          checkboxCallback: () => cubitTasks.updateTask(task),
          removeTask: () => cubitTasks.removeTask(task),
        );
      },
      itemCount: BlocProvider.of<TaskCubit>(context).cubitListTask.taskCount,
    );
  }
}
