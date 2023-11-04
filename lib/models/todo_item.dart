import 'package:flutter/material.dart';

class TodoItem {
  final String title;
  final TimeOfDay deadline;
  final Color priority;

  TodoItem(
      {required this.title, required this.deadline, required this.priority});
  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'deadlineHour': deadline.hour, // Store the hour
      'deadlineMinute': deadline.minute, // Store the minute
      'priority': priority.value, // Store color as an int
    };
  }

  factory TodoItem.fromJson(Map<String, dynamic> json) {
  int? deadlineHour = json['deadlineHour'];
  int? deadlineMinute = json['deadlineMinute'];

  if (deadlineHour != null && deadlineMinute != null) {
    return TodoItem(
      title: json['title'],
      deadline: TimeOfDay(hour: deadlineHour, minute: deadlineMinute),
      priority: Color(json['priority']),
    );
  } else {
    // Handle the case where 'deadlineHour' or 'deadlineMinute' is not present in the JSON data.
    // You can provide default values or take appropriate action here.
    return TodoItem(
      title: json['title'],
      deadline: TimeOfDay.now(), // Default value
      priority: Color(json['priority']),
    );
  }
}
}
