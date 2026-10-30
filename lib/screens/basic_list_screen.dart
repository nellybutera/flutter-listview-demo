import 'package:flutter/material.dart';

// Demo 1: plain ListView with a few fixed items, like a settings page.
// all the children get built at once, so this is only good for short lists
class BasicListScreen extends StatelessWidget {
  const BasicListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Basic ListView')),
      body: ListView(
        // padding: keeps the items away from the screen edges (default is none)
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
          ListTile(leading: Icon(Icons.lock), title: Text('Privacy')),
          // a child doesn't have to be a ListTile, any widget works
          Card(
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Text('Children can be any widget: Card, Image, Row...'),
            ),
          ),
        ],
      ),
    );
  }
}
