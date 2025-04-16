import 'package:flutter/material.dart';
import 'pages/form_page.dart';

void main() {
  runApp(MyApp()); 
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Form Demo',
      home: FormPage(),
    );
  }
}