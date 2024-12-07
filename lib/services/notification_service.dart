import 'package:ez_reminder/components/custom_notification.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest_all.dart' as tz;
import 'package:flutter_native_timezone/flutter_native_timezone.dart';

class NotificationService {
  late FlutterLocalNotificationsPlugin localNotificationsPlugin;
  late AndroidNotificationDetails androidDetails;

  NotificationService() {
    localNotificationsPlugin = FlutterLocalNotificationsPlugin();
    _setupNotifications();
  }

  _setupNotifications() async {
    await _setupTimezone();
    await _initializeNotifications();
  }

  Future<void> _setupTimezone() async {
    tz.initializeTimeZones();
    final String? timeZoneName = await FlutterNativeTimezone.getLocalTimezone();
    tz.setLocalLocation(tz.getLocation(timeZoneName!));
  }

  _initializeNotifications() async {
    const android = AndroidInitializationSettings('@mipmap/ic_launcher');
    await localNotificationsPlugin
        .initialize(const InitializationSettings(android: android));
  }

  showNotification(CustomNotification notification) {
    androidDetails = const AndroidNotificationDetails(
        'lembretes_notification', 'Lembretes',
        channelDescription: "Canal de notificação dos lembretes",
        importance: Importance.max,
        priority: Priority.max,
        enableVibration: true);

    localNotificationsPlugin.zonedSchedule(
        notification.id,
        notification.title,
        notification.body,
        tz.TZDateTime.from(notification.date!, tz.local),
        NotificationDetails(android: androidDetails),
        payload: notification.payload,
        androidAllowWhileIdle: true,
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.absoluteTime);
  }

  checkForNotifications() async {
    final details =
        await localNotificationsPlugin.getNotificationAppLaunchDetails();

    if (details != null && details.didNotificationLaunchApp) {}
  }
}
