import 'package:flutter/material.dart';
import 'package:todo_app/models/todo_item.dart';
import 'package:todo_app/presentation/widgets/custom_button.dart';
import 'package:todo_app/utils/consts.dart';

class AddTodoPage extends StatefulWidget {
  final Function(String, TimeOfDay, Color) onAddTodo;
  const AddTodoPage({Key? key, required this.onAddTodo}) : super(key: key);

  @override
  _AddTodoPageState createState() => _AddTodoPageState();
}

class _AddTodoPageState extends State<AddTodoPage> {
  final TextEditingController titleController = TextEditingController();
  TimeOfDay? selectedTime;
  List<TodoItem> items = [];
  String selectedPriority = 'Medium'; // Default priority
  List<String> priorities = ['Critical', 'Medium', 'Least'];
  Color flagColor = Colors.blue;
  void setFlagColor() {
    if (selectedPriority == 'Critical') {
      setState(() {
        flagColor = Colors.red;
      });
    } else if (selectedPriority == 'Medium') {
      flagColor = Colors.orange;
    } else {
      flagColor = Colors.blue;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Add Todo Item',
          style: TextStyle(color: Colors.greenAccent),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //Set title
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
          // Set deadline
            Padding(
              padding: const EdgeInsets.only(top: 20, bottom: 20),
              child: GestureDetector(
                onTap: () {
                  showTimePicker(
                    context: context,
                    initialTime: TimeOfDay.now(),
                  ).then((pickedTime) {
                    if (pickedTime != null) {
                      setState(() {
                        selectedTime = pickedTime;
                      });
                    }
                  });
                },
                child: Text(
                  selectedTime != null
                      ? 'Deadline : ${selectedTime!.format(context)}'
                      : 'Select Time',
                  style: TextStyle(
                    fontSize: 16,
                    color: selectedTime != null
                        ? AppConstants.primaryColor
                        : Colors.white,
                  ),
                ),
              ),
            ),
            DropdownButton<String>(
              style: const TextStyle(color: AppConstants.primaryColor, fontSize: 15),
              borderRadius: BorderRadius.circular(15),
              value: selectedPriority,
              items: priorities.map((String priority) {
                return DropdownMenuItem<String>(
                  value: priority,
                  child: Text(priority),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  selectedPriority = newValue ?? 'Medium';
                });
              },
            ),
            CustomButton(
              buttonText: 'Add Todo',
              onPressed: () {
                final title = titleController.text;
                if (title.isNotEmpty && selectedTime != null) {
                  setFlagColor();
                  widget.onAddTodo(
                      title, selectedTime!, flagColor); // Callback to add todo
                  Navigator.pop(context); // Navigate back to HomePage
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
