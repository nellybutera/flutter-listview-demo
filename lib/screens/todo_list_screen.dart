import 'package:flutter/material.dart';

// Demo 5: a to-do list you can add to, tick off and swipe away.
// the list of tasks lives in this State, and setState() rebuilds the ListView
class TodoListScreen extends StatefulWidget {
  const TodoListScreen({super.key});

  @override
  State<TodoListScreen> createState() => _TodoListScreenState();
}

class Task {
  final String title;
  bool done = false;

  Task(this.title);
}

class _TodoListScreenState extends State<TodoListScreen> {
  final _textController = TextEditingController();
  final _tasks = [
    Task('Prepare ListView slides'),
    Task('Practice the demo'),
    Task('Answer questions'),
  ];

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  void _addTask() {
    final text = _textController.text.trim();
    if (text.isEmpty) return;
    setState(() => _tasks.add(Task(text)));
    _textController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Tasks (${_tasks.length})')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _textController,
                    decoration: const InputDecoration(
                      hintText: 'New task',
                      border: OutlineInputBorder(),
                    ),
                    onSubmitted: (_) => _addTask(),
                  ),
                ),
                IconButton(onPressed: _addTask, icon: const Icon(Icons.add)),
              ],
            ),
          ),
          // ListView inside a Column needs Expanded or you get a height error
          Expanded(
            child: ListView.builder(
              itemCount: _tasks.length,
              itemBuilder: (context, index) {
                final task = _tasks[index];
                return Dismissible(
                  // the key tells flutter which task got swiped
                  key: ObjectKey(task),
                  background: Container(color: Colors.red),
                  onDismissed: (_) => setState(() => _tasks.remove(task)),
                  child: CheckboxListTile(
                    title: Text(task.title),
                    value: task.done,
                    onChanged: (_) => setState(() => task.done = !task.done),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
