import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:push_notification/Screens/home_screen.dart';
import 'package:push_notification/Screens/notificarion_screen.dart';

import 'api/firebase_api.dart';
 final navigatorKey=GlobalKey<NavigatorState>();
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await FirebaseApi().initNotifications();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      navigatorKey: navigatorKey,
      home: const HomeScreen(),
      routes: {NotificationScreen.route: (context)=> const NotificationScreen()},
    );
  }
}

