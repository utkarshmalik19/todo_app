import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_app/models/todo_item.dart';
import 'package:todo_app/presentation/screens/add_page.dart';
import 'package:todo_app/presentation/widgets/app_drawer.dart';
import 'package:todo_app/presentation/widgets/day_bar.dart';
import 'package:todo_app/presentation/widgets/todo_tile.dart';
import 'package:todo_app/utils/consts.dart';
import 'package:todo_app/utils/notification_helper.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<TodoItem> todoItems = [];
//final NotificationHelper notificationHelper = NotificationHelper();

  List<String> days = ['Today', 'Tomorrow', '27 Oct', '28 Oct', '29 Oct'];
  void addTodoItem(String title, TimeOfDay deadline, Color priority) {
     final now = DateTime.now();
  final scheduledTime = DateTime(
    now.year,
    now.month,
    now.day,
    deadline.hour,
    deadline.minute,
  );
  // Schedule the notification
  // notificationHelper.scheduleNotification(
  //   todoItems.length, // Use a unique id for each notification
  //   'Todo Reminder',
  //   title,
  //   scheduledTime,
  // );
    setState(() {
      todoItems
          .add(TodoItem(deadline: deadline, title: title, priority: priority));
      saveTodoItems(); // Save the updated list to shared preferences
    });
  }

  Future<void> saveTodoItems() async {
    final prefs = await SharedPreferences.getInstance();
    final todoItemsJson = todoItems.map((item) => item.toJson()).toList();
    await prefs.setStringList(
        'todoItems', todoItemsJson.map((item) => json.encode(item)).toList());
  }

  Future<void> loadTodoItems() async {
    final prefs = await SharedPreferences.getInstance();
    final todoItemsJson = prefs.getStringList('todoItems');
    if (todoItemsJson != null) {
      setState(() {
        todoItems = todoItemsJson
            .map((json) => TodoItem.fromJson(jsonDecode(json)))
            .toList();
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadTodoItems(); // Load saved todo items from shared preferences
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: AppDrawer(),
      appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.greenAccent),
          title: const Text(
            "To Do App",
            style: TextStyle(color: Colors.greenAccent),
          )),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Tasks',
                style: TextStyle(
                    fontSize: 24,
                    color: Colors.greenAccent,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 25,
              ),
              SizedBox(
                height: 50,
                child: ListView.builder(
                  itemBuilder: (context, index) =>
                      DayBar(index: index, day: days[index]),
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: 5,
                ),
              ),
              ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: todoItems.length,
                  itemBuilder: (context, index) => TodoTile(
                        index: index,
                        items: todoItems[index],
                        onDismissed: (index) {
                          setState(() {
                            todoItems.removeAt(
                                index); // Remove the item from the list
                            saveTodoItems(); // Save the updated list to shared preferences
                          });
                        },
                      ))
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.add,
          color: Colors.green,
        ),
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => AddTodoPage(onAddTodo: addTodoItem),
            ),
          );
        },
      ),
    );
  }
}
