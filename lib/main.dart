import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import '../screens/dashboard.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  FirebaseCrashlytics.instance.setUserIdentifier('alura123');
  FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;

  runApp(BytebankApp());
}

class BytebankApp extends StatelessWidget {
  // This widget is the root of your application.
  @override 
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          primaryColor: Colors.green[900],
          accentColor: Colors.blueAccent[700],
          buttonTheme: ButtonThemeData(
            buttonColor: Colors.blueAccent[700],
            textTheme: ButtonTextTheme.primary,
          )),
      home: Dashboard(),
    );
  }
}
