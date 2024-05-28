import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class TimerScreen extends HookWidget {
  const TimerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    int useTimer() {
      final time = useState(0);

      useEffect(() {
        final timer =
            Timer.periodic(const Duration(seconds: 1), (timer) => time.value++);
        return () => timer.cancel();
      }, []);

      return time.value;
    }

    final time = useTimer();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Timer using Custom Hook'),
      ),
      body: Center(
        child: Text('Timer: $time'),
      ),
    );
  }
}
