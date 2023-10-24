import 'package:flutter/material.dart';

class TodoTile extends StatefulWidget {
  final int index;
  const TodoTile({super.key, required this.index});

  @override
  State<TodoTile> createState() => _TodoTileState();
}

class _TodoTileState extends State<TodoTile> {
  bool isDone = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10,right: 200,top: 10),
      child: Card(
        child: ListTile(
          leading: Radio(value: true, groupValue: isDone, onChanged: (isDone){
            setState(() {
              isDone= true;
            });
          }),
          title: Text('Do Homework'),
          subtitle: Text('Till 5pm'),
          trailing: Icon(Icons.delete),
        ),
      ),
    );
  }
}
