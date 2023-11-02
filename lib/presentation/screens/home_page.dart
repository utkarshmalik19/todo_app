import 'package:flutter/material.dart';
import 'package:todo_app/models/todo_item.dart';
import 'package:todo_app/presentation/screens/add_page.dart';
import 'package:todo_app/presentation/widgets/app_drawer.dart';
import 'package:todo_app/presentation/widgets/day_bar.dart';
import 'package:todo_app/presentation/widgets/todo_tile.dart';
import 'package:todo_app/utils/consts.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<TodoItem> todoItems = [];

  List<String> days = ['Today', 'Tomorrow', '27 Oct', '28 Oct', '29 Oct'];
  void addTodoItem(String title, String deadline, Color priority) {
    setState(() {
      todoItems
          .add(TodoItem(deadline: deadline, title: title, priority: priority));
    });
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
