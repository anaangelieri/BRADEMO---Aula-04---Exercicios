import 'package:flutter/material.dart';
import 'pages/task_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App de Notas de Tarefas',
      home: TaskPage(),
    );
  }
}
