import 'package:ez_reminder/components/custom_notification.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest_all.dart' as tz;
import 'package:flutter_timezone/flutter_timezone.dart';

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
    final String? timeZoneName = await FlutterTimezone.getLocalTimezone();
    tz.setLocalLocation(tz.getLocation("America/Sao_Paulo"));
  }

  _initializeNotifications() async {
    const android = AndroidInitializationSettings('@mipmap/ic_launcher');
    await localNotificationsPlugin
        .initialize(const InitializationSettings(android: android));
  }

  showNotification(CustomNotification notification) async {
    androidDetails = const AndroidNotificationDetails(
        'lembretes_notification', 'Lembretes',
        channelDescription: "Canal de notificação dos lembretes",
        importance: Importance.max,
        priority: Priority.max,
        enableVibration: true);

    // if (notification.date.isAfter(DateTime.now())) {
    localNotificationsPlugin.zonedSchedule(
        notification.id,
        notification.title,
        notification.body,
        tz.TZDateTime.from(notification.date, tz.local),
        NotificationDetails(android: androidDetails),
        androidScheduleMode: AndroidScheduleMode.exact,
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.absoluteTime);
    // }
  }

  showNotificationExample(CustomNotification notification) {
    androidDetails = const AndroidNotificationDetails(
        'lembretes_notification', 'Lembretes',
        channelDescription: "Canal de notificação dos lembretes",
        importance: Importance.max,
        priority: Priority.max,
        enableVibration: true);

    localNotificationsPlugin.show(
      notification.id,
      notification.title,
      notification.body,
      NotificationDetails(android: androidDetails),
      payload: notification.payload,
    );
  }

  checkForNotifications() async {
    final details =
        await localNotificationsPlugin.getNotificationAppLaunchDetails();

    if (details != null && details.didNotificationLaunchApp) {}
  }
}
