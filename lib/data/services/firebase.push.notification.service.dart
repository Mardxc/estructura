import 'dart:async';
import 'dart:convert';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class FirebasePushNotificationService {
  static FirebaseMessaging messaging = FirebaseMessaging.instance;
// FLUTTER NOTIFICATIONS
  final channel = const AndroidNotificationChannel(
    '5', // id
    'High Importance Notifications', // title
    description:
        'This channel is used for important notifications.', // description
    importance: Importance.max,
  );
  // initialise the plugin of flutterlocalnotifications.
  FlutterLocalNotificationsPlugin flip = FlutterLocalNotificationsPlugin();
  // app_icon needs to be a added as a drawable
  // resource to the Android head project.
  final android = const AndroidInitializationSettings('@mipmap/ic_launcher');
  final iOs = const DarwinInitializationSettings();
  // final iOs = const settgingsIOS();
//
  static String? deviceToken;

  // ABRIR NUEVA SOLICITUD DE DATOS PERSONALES
  static final StreamController<Map<String, dynamic>> _personalesStream =
      StreamController.broadcast();
  static Stream<Map<String, dynamic>> get personalesStream =>
      _personalesStream.stream;
  static set setPersonalesStream(msg) => _personalesStream.add(msg);

//ABRIR NUEVA SOLICITUD DE INFORMACION
  static final StreamController<Map<String, dynamic>> _solicitudesStream =
      StreamController.broadcast();
  static Stream<Map<String, dynamic>> get solicitudesStream =>
      _solicitudesStream.stream;

  static set setSolicitudesStream(msg) => _solicitudesStream.add(msg);

// FINALIZAR SOLICITUD DE INFORMACION
  static final StreamController<Map<String, dynamic>> _solicitudesFinalStream =
      StreamController.broadcast();
  static Stream<Map<String, dynamic>> get solicitudesFinalStream =>
      _solicitudesFinalStream.stream;
  static set setSolicitudesFinalStream(msg) => _solicitudesFinalStream.add(msg);

// RECURRENTE SOLICITUD DE INFORMACION
  static final StreamController<Map<String, dynamic>> _recurrenteStream =
      StreamController.broadcast();
  static Stream<Map<String, dynamic>> get recurrenteStream =>
      _recurrenteStream.stream;
  static set setRecurrenteStream(msg) => _recurrenteStream.add(msg);

// AVISOS PNT
  static final StreamController<Map<String, dynamic>> _avisosStream =
      StreamController.broadcast();
  static Stream<Map<String, dynamic>> get avisosStream => _avisosStream.stream;
  static set avisosStream(msg) => _avisosStream.add(msg);

// QUEJAS PNT
  static final StreamController<Map<String, dynamic>> _quejasStream =
      StreamController.broadcast();
  static Stream<Map<String, dynamic>> get quejasStream => _quejasStream.stream;
  static set quejasStream(msg) => _quejasStream.add(msg);

  Future<String?> getFcmToken() async {
    return await FirebaseMessaging.instance.getToken();
  }

  static Future _backgroundHandler(RemoteMessage msg) async {}

  Future _onMessageHandler(RemoteMessage message) async {
    RemoteNotification? notification = message.notification;

    // initialise settings for both Android and iOS device.
    final settings = InitializationSettings(android: android, iOS: iOs);

    await flip.initialize(settings,
        onDidReceiveNotificationResponse: onSelectNotification);

    flip.show(
        notification.hashCode,
        notification!.title,
        notification.body,
        NotificationDetails(
          android: AndroidNotificationDetails(
            channel.id,
            channel.name,
            channelDescription: channel.description,
          ),
          iOS: const DarwinNotificationDetails(
            presentAlert: true,
            presentBadge: true,
            presentSound: true,
          ),
        ),
        payload: jsonEncode(message.data));
  }

  Future<dynamic> onSelectNotification(payload) async {
    final msg = jsonDecode(payload);
    selectNotification(msg);
  }

  static Future _onMessageOpenApp(RemoteMessage msg) async {
    selectNotification(msg.data);
  }

  static void selectNotification(Map<String, dynamic> data) async {}

  Future<void> initializeApp() async {
    await Firebase.initializeApp(
        //options: DefaultFirebaseOptions.currentPlatform,
        );
    FirebaseMessaging messaging = FirebaseMessaging.instance;

    await messaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );
    FirebaseMessaging.onBackgroundMessage(_backgroundHandler);
    FirebaseMessaging.onMessage.listen(_onMessageHandler);
    FirebaseMessaging.onMessageOpenedApp.listen(_onMessageOpenApp);
  }
}
