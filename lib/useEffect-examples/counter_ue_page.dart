import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class CounterUEPage extends HookWidget {
  const CounterUEPage({super.key});

  @override
  Widget build(BuildContext context) {
    final counter = useState(0);

    useEffect(() {
      print('Counter Value: ${counter.value}');
      return null;
    }, [counter.value]);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter using useEffect'),
      ),
      body: Center(
        child: Text(
          'Counter: ${counter.value}',
          style: const TextStyle(fontSize: 24),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => counter.value++,
        child: const Icon(Icons.add),
      ),
    );
  }
}
