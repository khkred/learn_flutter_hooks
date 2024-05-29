import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// 1. Create a StateProvider to hold the counter value:
final localCounterProvider = StateProvider<int>((ref) => 0);

class CounterHookPage extends HookConsumerWidget {
  const CounterHookPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 2. Access and display the counter value
    final count = ref.watch(localCounterProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Hooks 1: CounterProvider'),
      ),
      body: Center(
        child: Text(
          'Count: $count',
          style: const TextStyle(fontSize: 24),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // 3. Update the Counter value
          ref.read(localCounterProvider.notifier).state++;
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
