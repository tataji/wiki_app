import 'package:flutter/material.dart';
import 'package:wiki_app/ui/WikiListPage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false,
      title: 'Employee Details',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: WikiListPage(),
    );
  }
}