import 'package:to_do/logic/cubit/task_navigator_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TaskNavigator extends Cubit<TaskNavigatorState> {
  TaskNavigator() : super(TaskNavigatorInitialState());

  void onAddNewTask() => emit(AddNewTaskNavigationState());
}
