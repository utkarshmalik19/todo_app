import 'package:flutter/material.dart';
import 'package:todo_app/models/todo_item.dart';

class TodoTile extends StatefulWidget {
  final int index;
  final TodoItem items;
  const TodoTile({super.key, required this.index, required this.items});

  @override
  State<TodoTile> createState() => _TodoTileState();
}

class _TodoTileState extends State<TodoTile> {
  bool isDone = false;
  List<bool> isDoneList =
      List.filled(5, false); // Initialize a list for tracking selection state
  List<Color> tileColors = [
    Colors.greenAccent,
    Color(0xffffdc6c),
    Color(0xff20ccbc),
    Color(0xffff4c4c),
    Color(0xff688cfc)
  ];

  
  @override
  Widget build(BuildContext context) {
    int colorIndex = widget.index % tileColors.length;
    return Dismissible(
      key: Key('todo-${widget.index}'),
      onDismissed: (direction) {},
      background: Padding(
        padding: const EdgeInsets.only(top: 10, bottom: 10),
        child: Container(
          padding: const EdgeInsets.only(left: 16),
          decoration: BoxDecoration(
              color: Colors.green, borderRadius: BorderRadius.circular(15)),
          child: const Align(
            alignment: Alignment.centerLeft,
              child: Text('Done',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold))),
        ),
      ),
      secondaryBackground: Padding(
        padding: const EdgeInsets.only(top: 10, bottom: 10),
        child: Container(
          padding: const EdgeInsets.only(right: 16),
          decoration: BoxDecoration(
              color: Colors.red, borderRadius: BorderRadius.circular(15)),
          child: const Align(
            alignment: Alignment.centerRight,
            child: Text(
              'Delete',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(right: 10, top: 10),
        child: Card(
          child: ListTile(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            tileColor: tileColors[colorIndex],
            leading: Checkbox(
              activeColor: tileColors[colorIndex],
              overlayColor: MaterialStateProperty.all(Colors.black),
              onChanged: (bool? value) {
                setState(() {
                  isDone = value ?? false;
                });
              },
              value: isDone,
            ),
            title: Text(
              widget.items.title,
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            ),
            subtitle: Text(widget.items.deadline,
                style: TextStyle(color: Colors.black)),
            trailing: Icon(
              Icons.flag,
              color: widget.items.priority,
            ),
          ),
        ),
      ),
    );
  }
}
