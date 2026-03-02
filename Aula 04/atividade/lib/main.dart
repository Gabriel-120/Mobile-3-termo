import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: TodoPage());
  }
}

class TodoPage extends StatefulWidget {
  const TodoPage({super.key});

  @override
  State<TodoPage> createState() => _TodoPageState();
}

class _TodoPageState extends State<TodoPage> {
  final List<String> Tarefas = [];
  final TextEditingController controller = TextEditingController();

  void adicionarTarefa(String tarefa) {
    setState(() {
      if (controller.text.isEmpty) return;
      Tarefas.add(controller.text);
      controller.clear();
    });
  }

  void removerTarefa(int index) {
    setState(() {
      Tarefas.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Todo Page - Tarefas: ${Tarefas.length}")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: controller,
              onSubmitted: (value) => adicionarTarefa(value),
              textInputAction: TextInputAction.send,
            ),
            ElevatedButton(
              onPressed: () {
                adicionarTarefa(controller.text);
              },
              child: const Text("Adicionar"),
            ),
            Expanded(
              child: Tarefas.isEmpty
                  ? const Center(child: Text("Nenhuma tarefa adicionada."))
                  : ListView.builder(
                      itemCount: Tarefas.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(Tarefas[index]),
                          trailing: IconButton(
                            icon: const Icon(Icons.delete),
                            onPressed: () {
                              removerTarefa(index);
                            },
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
