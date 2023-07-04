import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:push_notification/Screens/notificarion_screen.dart';
import 'package:push_notification/main.dart';

Future<void> handleBackgroundMessaging(RemoteMessage message) async {
  print('Title: ${message.notification?.title}');
  print('Body: ${message.notification?.body}');
  print('Payload: ${message.data}');
}

class FirebaseApi {
  final _firebaseMessaging = FirebaseMessaging.instance;

  void handleMessage(RemoteMessage? message) {
    if (message == null) return;
    navigatorKey.currentState
        ?.pushNamed(NotificationScreen.route, arguments: message);
  }

  Future initPushNotifications() async {
    await FirebaseMessaging.instance
        .setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );
    FirebaseMessaging.instance.getInitialMessage().then(handleMessage);
    FirebaseMessaging.onMessageOpenedApp.listen(handleMessage);
    FirebaseMessaging.onBackgroundMessage(handleBackgroundMessaging);

  }

  Future<void> initNotifications() async {
    await _firebaseMessaging.requestPermission();
    final fCMToken = await _firebaseMessaging.getToken();
    print('Token: $fCMToken');
    initPushNotifications();

  }
}

// import '../Screens/notification_screen.dart';
//
// Future<void> handleBackgroundMessaging(RemoteMessage message)async{
//   print('Title: ${message.notification?.title}');
//   print('Body: ${message.notification?.body }');
//   print('Payload: ${ message.data}');
// }
// class FirebaseApi{
//   final _firebaseMessaging=FirebaseMessaging.instance;//
//   void handleMessage(RemoteMessage?message){
//     if(message ==null)return;
//     // navigatorKey.currentState?.pushNamed(
//     //     NotificationScreen.route,
//     // arguments: message,
//     // );
//   }
//   Future initPushNotifications() async{
//     await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
//       alert: true,
//       badge: true,
//       sound: true,
//     );
//     FirebaseMessaging.instance.getInitialMessage().then(handleMessage);
//     FirebaseMessaging.onMessageOpenedApp.listen(handleMessage);
//   }
//
// Future<void> initNotifications() async{
//   await _firebaseMessaging.requestPermission();
//   final fCMToken = await _firebaseMessaging.getToken();
//   print('Token: $fCMToken');
//   initPushNotifications();
//   FirebaseMessaging.onBackgroundMessage(handleBackgroundMessaging);
//
// }
//
// }
