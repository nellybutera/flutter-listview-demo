import 'package:flutter/material.dart';

/// Demo 1: the default ListView constructor.
///
/// All children are created up front, so this is best for a small,
/// fixed number of items (settings pages, menus, etc.).
class BasicListScreen extends StatelessWidget {
  const BasicListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Basic ListView')),
      body: ListView(
        padding: const EdgeInsets.all(8),
        children: const [
          ListTile(
            leading: Icon(Icons.wifi),
            title: Text('Wi-Fi'),
            subtitle: Text('Connected'),
          ),
          ListTile(
            leading: Icon(Icons.bluetooth),
            title: Text('Bluetooth'),
            subtitle: Text('Off'),
          ),
          ListTile(
            leading: Icon(Icons.battery_full),
            title: Text('Battery'),
            subtitle: Text('87%'),
          ),
          ListTile(
            leading: Icon(Icons.notifications),
            title: Text('Notifications'),
          ),
          ListTile(
            leading: Icon(Icons.lock),
            title: Text('Privacy'),
          ),
          // Any widget can be a child, not just ListTiles.
          Card(
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Text(
                'Children can be any widget: ListTile, Card, Container, '
                'Image, Row...',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
