import 'dart:async';
import 'dart:ui';

import 'package:expense_tracker_app/core/local_notification/local_notification.dart';
import 'package:expense_tracker_app/utils/constants/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_background_service/flutter_background_service.dart';
import 'package:flutter_background_service_android/flutter_background_service_android.dart';

class BackgroundService {
  BackgroundService._();

  static Future<void> initialize() async {
    await FlutterBackgroundService().configure(
      iosConfiguration: IosConfiguration(),
      androidConfiguration: AndroidConfiguration(
        onStart: _onStart,
        autoStart: true,
        isForegroundMode: true,
      ),
    );
  }

  static Future<void> _onStart(ServiceInstance service) async {
    DartPluginRegistrant.ensureInitialized();
    if (service is AndroidServiceInstance) {
      service.on('setAsForeground').listen((event) {
        service.setAsForegroundService();
      });

      service.on('setAsBackground').listen((event) {
        service.setAsBackgroundService();
      });
    }

    service.on('stopService').listen((event) {
      service.stopSelf();
    });
    Timer.periodic(
        Duration(
          hours: AppConstants.reminderHours,
          minutes: AppConstants.reminderMinutes,
          seconds: AppConstants.reminderSeconds,
        ), (timer) async {
      if (service is AndroidServiceInstance) {
        if (await service.isForegroundService()) {
          NotificationService().showNotification(
            title: AppConstants.reminderTitle,
            body: AppConstants.reminderContent,
          );
          service.setForegroundNotificationInfo(
            title: "Expense Tracker Notification Service",
            content: "Get Reminders to record expenses",
          );
        }
      }

      /// log
      debugPrint('FLUTTER BACKGROUND SERVICE: ${DateTime.now()}');

      service.invoke(
        'update',
        {
          "current_date": DateTime.now().toIso8601String(),
          "device": 'Android',
        },
      );
    });
  }
}
