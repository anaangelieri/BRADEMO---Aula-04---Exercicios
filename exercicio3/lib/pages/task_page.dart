import 'package:flutter/material.dart';
import '../models/task_model.dart';
import '../widgets/task_card.dart';

class TaskPage extends StatefulWidget {
  const TaskPage({super.key});

  @override
  State<TaskPage> createState() => _TaskPageState();
}

class _TaskPageState extends State<TaskPage> {
  List<Task> tasks = List.generate(5, (index) {
    DateTime agora = DateTime.now();
    return Task(title: 'Tarefa $agora');
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AlgumSite.com'),
        backgroundColor: Colors.blue,
      ),
      body: Column(
        children: [
          SizedBox(height: 20),

          ElevatedButton(
            onPressed: () {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text('Você clicou no botão!')));
            },
            child: const Text(
              'Ver Tarefas Completas',
              style: TextStyle(color: Colors.white),
            ),
            style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
          ),
          SizedBox(height: 20),
          Center(
            child: Text(
              'Você tem ${tasks.where((t) => !t.completed).length} tarefas incompletas',
            ),
          ),
          SizedBox(height: 20),
          Expanded(
            child: ListView.builder(
              itemCount: tasks.length,
              itemBuilder: (context, index) {
                return TaskCard(
                  task: tasks[index],
                  onChanged: (value) {
                    setState(() {
                      tasks[index].completed = value ?? false;
                    });
                  },
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          showDialog(
            context: context,
            builder:
                (_) => AlertDialog(
                  title: const Text('Mensagem'),
                  content: const Text('Você está no App de Notas de Tarefas'),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text('Fechar'),
                    ),
                  ],
                ),
          );
        },
      ),
    );
  }
}
