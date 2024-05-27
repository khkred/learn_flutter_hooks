import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class ExampleScreen extends HookWidget {
  const ExampleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //Using useEffect to log a message on render
    useEffect(() {
      print('ExampleScreen rendered');
      return null; // No cleanup needed
    }, []);

    return Scaffold(
      appBar: AppBar(
        title: const Text('useEffect Example'),
      ),
      body: const Center(
        child: Text('Check the console for messages'),
      ),
    );
  }
}
