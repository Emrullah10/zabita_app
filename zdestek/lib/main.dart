import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:zdestek/firebase_options.dart';
import 'package:zdestek/home_screen.dart';
import 'package:zdestek/pages/documents.dart';
import 'package:zdestek/pages/inspections.dart';
import 'package:zdestek/pages/kabahatlar.dart';
import 'package:zdestek/pages/login_screen.dart';
import 'package:zdestek/pages/reset_password.dart';
import 'package:zdestek/pages/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Zabıta Uygulaması',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => SplashScreen(),
        '/login': (context) => LoginScreen(),
        '/home': (context) => HomeScreen(),
        '/reset_password': (context) => ResetPasswordScreen(),
        '/kabahatlar': (context) => Kabahatlar(),
        '/documents': (context) => Documents(),
        '/inspections': (context) => InspectionPage(),
      },
    );
  }
}
