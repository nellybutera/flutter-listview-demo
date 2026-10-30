import 'package:flutter/material.dart';

import 'screens/basic_list_screen.dart';
import 'screens/builder_list_screen.dart';
import 'screens/separated_list_screen.dart';
import 'screens/horizontal_list_screen.dart';
import 'screens/todo_list_screen.dart';

void main() {
  runApp(const ListViewDemoApp());
}

class ListViewDemoApp extends StatelessWidget {
  const ListViewDemoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ListView Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
      ),
      home: const HomeScreen(),
    );
  }
}

/// A single demo shown on the home screen.
class Demo {
  final String title;
  final String subtitle;
  final IconData icon;
  final Widget screen;

  const Demo(this.title, this.subtitle, this.icon, this.screen);
}

const demos = [
  Demo('1. Basic ListView', 'ListView(children: [...])', Icons.list,
      BasicListScreen()),
  Demo('2. ListView.builder', '1,000 items built lazily', Icons.bolt,
      BuilderListScreen()),
  Demo('3. ListView.separated', 'Items with dividers between them',
      Icons.horizontal_rule, SeparatedListScreen()),
  Demo('4. Horizontal ListView', 'scrollDirection: Axis.horizontal',
      Icons.swap_horiz, HorizontalListScreen()),
  Demo('5. Dynamic list (Stateful)', 'Add, tap and swipe to delete',
      Icons.edit_note, TodoListScreen()),
];

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('ListView Widget Demo')),
      // The menu itself is a ListView too!
      body: ListView.builder(
        itemCount: demos.length,
        itemBuilder: (context, index) {
          final demo = demos[index];
          return ListTile(
            leading: Icon(demo.icon),
            title: Text(demo.title),
            subtitle: Text(demo.subtitle),
            trailing: const Icon(Icons.chevron_right),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => demo.screen),
            ),
          );
        },
      ),
    );
  }
}
