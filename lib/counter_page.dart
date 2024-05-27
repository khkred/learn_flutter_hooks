import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class CounterPage extends HookWidget {
  const CounterPage({super.key});

  @override
  Widget build(BuildContext context) {
    //Use a hook to manage CounterState
    final counter = useState(0);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter using Hooks'),
      ),
      body: Center(
        child: Text(
          'Counter: ${counter.value}',
          style: const TextStyle(fontSize: 24),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          counter.value++;
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
