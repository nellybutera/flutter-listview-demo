import 'package:flutter/material.dart';

// Demo 3: ListView.separated, a contacts list with a line between each person
class SeparatedListScreen extends StatelessWidget {
  const SeparatedListScreen({super.key});

  static const contacts = [
    'Alice',
    'Brian',
    'Chloe',
    'David',
    'Esther',
    'Frank',
    'Grace',
    'Henry',
    'Irene',
    'James',
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
            onTap: () =>
                ScaffoldMessenger.of(context)
                    .showSnackBar(SnackBar(content: Text('Calling $name...'))),
          );
        },
        // the divider only goes between items, not after the last one
        separatorBuilder: (context, index) => const Divider(height: 1),
      ),
    );
  }
}
