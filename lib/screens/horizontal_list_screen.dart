import 'package:flutter/material.dart';

/// Demo 4: a horizontal ListView nested inside a vertical one.
///
/// A horizontal ListView needs a bounded height, so we wrap it in a
/// SizedBox. Without it Flutter doesn't know how tall to make it.
class HorizontalListScreen extends StatelessWidget {
  const HorizontalListScreen({super.key});

  static const colors = [
    Colors.red, Colors.orange, Colors.amber, Colors.green,
    Colors.teal, Colors.blue, Colors.indigo, Colors.purple,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Horizontal ListView')),
      body: ListView(
        children: [
          _sectionTitle('Trending'),
          _horizontalRow(),
          _sectionTitle('Recommended for you'),
          _horizontalRow(),
          _sectionTitle('Recently viewed'),
          _horizontalRow(),
        ],
      ),
    );
  }

  Widget _sectionTitle(String text) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 20, 16, 8),
      child: Text(
        text,
        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _horizontalRow() {
    return SizedBox(
      height: 120,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 12),
        itemCount: colors.length,
        itemBuilder: (context, index) {
          return Container(
            width: 100,
            margin: const EdgeInsets.symmetric(horizontal: 4),
            decoration: BoxDecoration(
              color: colors[index],
              borderRadius: BorderRadius.circular(12),
            ),
            alignment: Alignment.center,
            child: Text(
              'Card ${index + 1}',
              style: const TextStyle(color: Colors.white, fontSize: 16),
            ),
          );
        },
      ),
    );
  }
}
