import 'dart:async';
import 'dart:developer';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NoticeService {
  static final FlutterLocalNotificationsPlugin _notificationPlugin =
      FlutterLocalNotificationsPlugin();

  bool _isInitialized = false;

  bool get isInitialized => _isInitialized;

  Future<void> initNotification() async {
    if (_isInitialized) return;
    const AndroidInitializationSettings initSettingAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');

    const initSettingIOS = DarwinInitializationSettings(
      requestAlertPermission: true,
      requestBadgePermission: true,
      requestSoundPermission: true,
    );

    const initSetting = InitializationSettings(
      android: initSettingAndroid,
      iOS: initSettingIOS,
    );

    await _notificationPlugin.initialize(initSetting);
  }

  static NotificationDetails notificationDetails() {
    return const NotificationDetails(
        android: AndroidNotificationDetails(
            'daily_channel_id', 'Dailiy Notification'),
        iOS: DarwinNotificationDetails());
  }

  static Future<void> showNotification(
      {int id = 0, String? title, String? body}) async {
    log("Notfications");
    await _notificationPlugin.show(id, "Reminder",
        "It's time to check your tasks!", notificationDetails());
  }

  static void startPeriodicNotifications() {
    Timer.periodic(Duration(seconds: 10), (timer) async {
      await showNotification();
    });
  }
}
