import 'package:flutter/material.dart';

/// Demo 2: ListView.builder.
///
/// Items are built lazily, only when they are about to scroll onto the
/// screen. Watch the debug console while scrolling: only a handful of
/// "Building item X" lines appear at a time, even though there are 1,000 items.
///
/// This screen is Stateful only because it owns a ScrollController
/// (which must be disposed). The ListView itself is still stateless.
class BuilderListScreen extends StatefulWidget {
  const BuilderListScreen({super.key});

  @override
  State<BuilderListScreen> createState() => _BuilderListScreenState();
}

class _BuilderListScreenState extends State<BuilderListScreen> {
  final _controller = ScrollController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _scrollToTop() {
    _controller.animateTo(
      0,
      duration: const Duration(milliseconds: 600),
      curve: Curves.easeOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('ListView.builder')),
      body: ListView.builder(
        controller: _controller,
        itemCount: 1000,
        itemBuilder: (context, index) {
          debugPrint('Building item $index');
          return ListTile(
            leading: CircleAvatar(child: Text('${index + 1}')),
            title: Text('Item ${index + 1}'),
            subtitle: const Text('Created only when needed'),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _scrollToTop,
        tooltip: 'Scroll to top',
        child: const Icon(Icons.arrow_upward),
      ),
    );
  }
}
