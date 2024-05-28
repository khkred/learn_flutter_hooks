import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class DataFetchPage extends HookWidget {
  const DataFetchPage({super.key});

  Future<String> fetchData() async {
    await Future.delayed(const Duration(seconds: 2));
    return 'Fetched data from the server';
  }

  @override
  Widget build(BuildContext context) {
    final future = useMemoized(() => fetchData());
    final snapshot = useFuture(future);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Data Fetch using Hooks'),
      ),
      body: snapshot.connectionState == ConnectionState.waiting
          ? const CircularProgressIndicator()
          : snapshot.hasError
              ? Text('Error: ${snapshot.error}')
              : Text('Data : ${snapshot.data}'),
    );
  }
}
