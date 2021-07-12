import 'package:flutter/material.dart';
import 'package:to_do/shared/constants.dart';

class AddTaskScreen extends StatelessWidget {
  const AddTaskScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String? newTaskTitle;
    return Container(
      color: Color(0xff757575),
      child: Container(
        padding: EdgeInsets.all(60),
        decoration: roundContainerDecoration,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              height: 20,
            ),
            Text(
              'Add Task',
              textAlign: TextAlign.center,
              style: addTaskTextStyle,
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              decoration: kTextFieldDecoration.copyWith(hintText: 'Enter task'),
              validator: (value) =>
                  value!.isEmpty ? 'Please, enter your task' : null,
              onChanged: (newTask) {
                newTaskTitle = newTask;
              },
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              child: Text(
                'Add',
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () {
                print(newTaskTitle);
                Navigator.pop(context, newTaskTitle);
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.blueAccent,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
