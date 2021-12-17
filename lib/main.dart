import 'package:bytebankk/database/app_database.dart';
import 'package:bytebankk/http/webclient.dart';
import 'package:bytebankk/models/transaction.dart';
import 'package:flutter/material.dart';

import '../screens/dashboard.dart';
import '../screens/contacts_form.dart';

import 'models/contact.dart';

void main() {
  runApp(BytebankApp());
  //save(Transaction(200.0, Contact(1, 'Alex', 2000))).then((transaction) => print(' salvou $transaction'));
  //findAll().then((transactions) => print('new transactions ${transactions}'));
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
