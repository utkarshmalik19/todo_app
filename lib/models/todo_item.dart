import 'package:flutter/material.dart';

class TodoItem {
  final String title;
  final String deadline;
  final Color priority;

  TodoItem(
      {required this.title, required this.deadline, required this.priority});
  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'deadline': deadline,
      'priority': priority.value, // Store color as an int
    };
  }

  factory TodoItem.fromJson(Map<String, dynamic> json) {
    return TodoItem(
      title: json['title'],
      deadline: json['deadline'],
      priority: Color(json['priority']), // Retrieve color from int
    );
  }
}
