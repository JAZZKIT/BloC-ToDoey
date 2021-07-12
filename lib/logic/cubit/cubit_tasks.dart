import 'package:bloc/bloc.dart';
import 'package:to_do/logic/cubit/task_state.dart';
import 'package:to_do/model/task.dart';
import 'package:to_do/model/task_data.dart';

class TaskCubit extends Cubit<TaskListState> {
  final cubitListTask = TaskData();

  List<Object> get props => [cubitListTask];

  TaskCubit() : super(ShowTasksState());

  void giveTask() => emit(ShowTasksState());

  void addTask(String newTask) {
    cubitListTask.addTask(newTask);
    emit(ShowTasksState(tasks: cubitListTask.tasks));
  }

  void updateTask(Task task) {
    cubitListTask.updateTask(task);
    emit(ShowTasksState(tasks: cubitListTask.tasks));
  }

  void removeTask(Task task) {
    cubitListTask.removeTask(task);
    emit(ShowTasksState(tasks: cubitListTask.tasks));
  }
}
