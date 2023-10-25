import 'package:flutter/material.dart';
import 'package:todo_app/models/todo_item.dart';
import 'package:todo_app/presentation/widgets/custom_button.dart';
import 'package:todo_app/utils/consts.dart';

class AddTodoPage extends StatefulWidget {
  final Function(String, String) onAddTodo;
  const AddTodoPage({Key? key, required this.onAddTodo}) : super(key: key);

  @override
  _AddTodoPageState createState() => _AddTodoPageState();
}

class _AddTodoPageState extends State<AddTodoPage> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController deadlineController = TextEditingController();
  //TodoItem todo = TodoItem(title, deadlineController);
  List<TodoItem> items = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Add Todo Item',
          style: TextStyle(color: Colors.greenAccent),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: titleController,
              decoration: const InputDecoration(
                  labelStyle: TextStyle(color: AppConstants.primaryColor),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.greenAccent)),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.greenAccent)),
                  labelText: 'Title'),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20, bottom: 20),
              child: TextField(
                controller: deadlineController,
                decoration: const InputDecoration(
                    labelStyle: TextStyle(color: AppConstants.primaryColor),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.greenAccent)),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.greenAccent)),
                    labelText: 'Deadline'),
              ),
            ),
            CustomButton(buttonText: 'Add Todo',onPressed: () {
                final title = titleController.text;
                final deadline = deadlineController.text;
                if (title.isNotEmpty && deadline.isNotEmpty) {
                  widget.onAddTodo(title, deadline); // Callback to add todo
                  Navigator.pop(context); // Navigate back to HomePage
                }
              },)
          ],
        ),
      ),
    );
  }
}
