import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  final bool? isChecked;
  final String? titile;

  const TaskTile({Key? key, this.isChecked, this.titile}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        'Create list',
        //style: TextStyle(decoration:  isChecked ? TextDecoration.lineThrough : null,),
      ),
      trailing: Checkbox(
        value: true,
        onChanged: (bool? value) {},
      ),
    );
  }
}
