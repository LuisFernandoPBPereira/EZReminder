import 'package:EZReminder/screens/home.dart';
import 'package:EZReminder/screens/login.dart';
import 'package:EZReminder/services/notification_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MultiProvider(providers: [
    Provider<NotificationService>(create: (context) => NotificationService())
  ], child: const EzReminder()));
}

class EzReminder extends StatelessWidget {
  const EzReminder({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "EZReminder",
        home: RouterToHome());
  }
}

class RouterToHome extends StatelessWidget {
  const RouterToHome({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
        stream: FirebaseAuth.instance.userChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return const Home();
          } else {
            return const Login();
          }
        });
  }
}
