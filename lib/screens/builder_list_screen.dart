import 'package:flutter/material.dart';

// Demo 2: ListView.builder with 1,000 items.
// it only builds the items you can see, so it stays fast.
// it's a StatefulWidget because the ScrollController has to be disposed
class BuilderListScreen extends StatefulWidget {
  const BuilderListScreen({super.key});

  @override
  State<BuilderListScreen> createState() => _BuilderListScreenState();
}

class _BuilderListScreenState extends State<BuilderListScreen> {
  // controller: lets my code move the list (default is null)
  final _controller = ScrollController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('ListView.builder')),
      body: ListView.builder(
        controller: _controller,
        itemCount: 1000,
        itemBuilder: (context, index) {
          // check the console: only the visible items get printed
          debugPrint('Building item $index');
          return ListTile(
            leading: CircleAvatar(child: Text('${index + 1}')),
            title: Text('Item ${index + 1}'),
          );
        },
      ),
      // jump back to the top using the controller
      floatingActionButton: FloatingActionButton(
        onPressed: () => _controller.animateTo(
          0,
          duration: const Duration(milliseconds: 600),
          curve: Curves.easeOut,
        ),
        tooltip: 'Scroll to top',
        child: const Icon(Icons.arrow_upward),
      ),
    );
  }
}
