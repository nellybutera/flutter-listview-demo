import 'package:flutter/material.dart';

/// Demo 5: a list whose data changes.
///
/// ListView is a StatelessWidget, so it cannot change its own items.
/// The *data* (the _tasks list) lives in this StatefulWidget. When we call
/// setState(), build() runs again and a new ListView is created with the
/// updated data.
class TodoListScreen extends StatefulWidget {
  const TodoListScreen({super.key});

  @override
  State<TodoListScreen> createState() => _TodoListScreenState();
}

class Task {
  final int id;
  final String title;
  bool done;

  Task(this.id, this.title, {this.done = false});
}

class _TodoListScreenState extends State<TodoListScreen> {
  final _textController = TextEditingController();
  int _nextId = 4;
  final List<Task> _tasks = [
    Task(1, 'Prepare ListView slides'),
    Task(2, 'Practice the demo'),
    Task(3, 'Answer questions'),
  ];

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  void _addTask() {
    final text = _textController.text.trim();
    if (text.isEmpty) return;
    setState(() {
      _tasks.add(Task(_nextId++, text));
    });
    _textController.clear();
  }

  void _toggleTask(Task task) {
    setState(() => task.done = !task.done);
  }

  void _removeTask(Task task) {
    setState(() => _tasks.remove(task));
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
                const SizedBox(width: 8),
                IconButton.filled(
                  onPressed: _addTask,
                  icon: const Icon(Icons.add),
                ),
              ],
            ),
          ),
          // A ListView inside a Column must be wrapped in Expanded,
          // otherwise it gets unbounded height and throws an error.
          Expanded(
            child: _tasks.isEmpty
                ? const Center(child: Text('No tasks. Add one above!'))
                : ListView.builder(
                    itemCount: _tasks.length,
                    itemBuilder: (context, index) {
                      final task = _tasks[index];
                      // A unique Key tells Flutter which item is which,
                      // so the right one is removed when swiped.
                      return Dismissible(
                        key: ValueKey(task.id),
                        direction: DismissDirection.endToStart,
                        background: Container(
                          color: Colors.red,
                          alignment: Alignment.centerRight,
                          padding: const EdgeInsets.only(right: 20),
                          child: const Icon(Icons.delete, color: Colors.white),
                        ),
                        onDismissed: (_) => _removeTask(task),
                        child: CheckboxListTile(
                          value: task.done,
                          onChanged: (_) => _toggleTask(task),
                          title: Text(
                            task.title,
                            style: TextStyle(
                              decoration: task.done
                                  ? TextDecoration.lineThrough
                                  : null,
                            ),
                          ),
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
