import 'package:equatable/equatable.dart';
import 'package:to_do/model/task.dart';

class TaskData extends Equatable {
  List<Task> _tasks = [
    Task(name: 'Learn BloC pattern'),
    Task(name: 'Watch Angela Yu'),
    Task(name: 'Code ToDo with BloC')
  ];

  int get taskCount => _tasks.length;

  List<Task> get tasks => _tasks;

  void addTask(String newTaskTitle) => _tasks.add(Task(name: newTaskTitle));

  @override
  List<Object?> get props => [];
}
