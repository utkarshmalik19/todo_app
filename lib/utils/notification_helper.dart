// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// import 'package:timezone/timezone.dart' as tz;
// import 'package:flutter/services.dart'; // Import for checking exact alarm permissions

// class NotificationHelper {
//   FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
//       FlutterLocalNotificationsPlugin();

//   void initialize() {
//     // Initialize the plugin
//     const AndroidInitializationSettings initializationSettingsAndroid =
//         AndroidInitializationSettings('app_icon');
//     final InitializationSettings initializationSettings =
//         InitializationSettings(android: initializationSettingsAndroid);

//     flutterLocalNotificationsPlugin.initialize(initializationSettings);
//   }

//   Future<void> scheduleNotification(
//       int id, String title, String body, DateTime scheduledTime) async {
//     final now = DateTime.now();
//     if (scheduledTime.isBefore(now)) {
//       // If the scheduled time is in the past, add a day to it
//       scheduledTime = scheduledTime.add(Duration(days: 1));
//     }

//     // Check if exact alarms are permitted on the device
//     final platform = MethodChannel('dexterx.dev/flutter_local_notifications');
    

//     final androidPlatformChannelSpecifics = AndroidNotificationDetails(
//       'your channel id',
//       'your channel name',
//       channelDescription: 'your channel description',
//       importance: Importance.max,
//       priority: Priority.high,
      
//     );

//     final NotificationDetails platformChannelSpecifics =
//         NotificationDetails(android: androidPlatformChannelSpecifics, );

//     await flutterLocalNotificationsPlugin.zonedSchedule(
//       id,
//       title,
//       body,
//       tz.TZDateTime.from(scheduledTime, tz.local),
//       platformChannelSpecifics,
//       uiLocalNotificationDateInterpretation:
//           UILocalNotificationDateInterpretation.absoluteTime,
      
//     );
//   }
// }
