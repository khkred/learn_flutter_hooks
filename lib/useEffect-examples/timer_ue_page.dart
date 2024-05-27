import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class TimerUEPage extends HookWidget {
  const TimerUEPage({super.key});

  @override
  Widget build(BuildContext context) {
    final time = useState(0);

    //Using useEffect to start a timer and clean it up when the component is unmounted

    useEffect(() {
      final timer = Timer.periodic(const Duration(seconds: 1), (timer) {
        time.value++;
      });

      return () => timer.cancel(); // Cleanup function to cancel the timer
    });
    return Scaffold(
      appBar: AppBar(
        title: const Text('useEffect Example with Cleanup'),
      ),
      body: Center(
        child: Text(
          'Time: ${time.value} seconds',
          style: const TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
