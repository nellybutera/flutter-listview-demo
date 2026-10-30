import 'package:flutter/material.dart';

/// Demo 3: ListView.separated.
///
/// Like ListView.builder, but also takes a separatorBuilder that is placed
/// *between* items (never before the first or after the last one).
class SeparatedListScreen extends StatelessWidget {
  const SeparatedListScreen({super.key});

  static const contacts = [
    'Alice', 'Brian', 'Chloe', 'David', 'Esther',
    'Frank', 'Grace', 'Henry', 'Irene', 'James',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('ListView.separated')),
      body: ListView.separated(
        itemCount: contacts.length,
        itemBuilder: (context, index) {
          final name = contacts[index];
          return ListTile(
            leading: CircleAvatar(child: Text(name[0])),
            title: Text(name),
            subtitle: const Text('Tap to call'),
            onTap: () => ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Calling $name...')),
            ),
          );
        },
        separatorBuilder: (context, index) => const Divider(height: 1),
      ),
    );
  }
}
