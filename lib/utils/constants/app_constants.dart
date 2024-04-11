import 'package:flutter/material.dart';

class AppConstants {
  static List<Map<String, dynamic>> allCategories = [
    {
      'name': 'Medical',
      'icon': const Icon(
        Icons.medical_services_outlined,
        size: 50,
        color: Colors.purpleAccent,
      )
    },
    {
      'name': 'Shopping',
      'icon': const Icon(
        Icons.shopping_bag_outlined,
        size: 50,
        color: Colors.redAccent,
      )
    },
    {
      'name': 'Food',
      'icon': const Icon(
        Icons.food_bank_outlined,
        size: 50,
        color: Colors.cyanAccent,
      )
    },
    {
      'name': 'Other',
      'icon': const Icon(
        Icons.event_note_sharp,
        size: 50,
        color: Colors.deepOrangeAccent,
      )
    },
  ];

  static List<String> orderBy = ['Weekly', 'Monthly'];

  static String reminderTitle = 'Daily Reminder';
  static String reminderContent = "Don't forget to record your daily expenses";
  static int reminderHours = 0;
  static int reminderMinutes = 0;
  static int reminderSeconds = 5;
}
