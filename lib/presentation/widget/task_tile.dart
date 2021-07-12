import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  final bool isChecked;
  final String? title;
  final Function checkboxCallback;
  final void Function() removeTask;

  const TaskTile(
      {Key? key,
      required this.isChecked,
      this.title,
      required this.checkboxCallback,
      required this.removeTask})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        title ?? "",
        style: TextStyle(
          decoration: isChecked ? TextDecoration.lineThrough : null,
        ),
      ),
      trailing: Checkbox(
        value: isChecked,
        onChanged: (value) => checkboxCallback(),
      ),
      onLongPress: removeTask,
    );
  }
}
