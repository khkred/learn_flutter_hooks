import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:http/http.dart' as http;

final userDataProvider = FutureProvider<Map<String, dynamic>>((ref) async {
  final apiResponse =
      await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users/1'));

  if (apiResponse.statusCode == 200) {
    return jsonDecode(apiResponse.body);
  } else {
    throw Exception('Failed to load user');
  }
});

class FutureProviderHooksPage extends HookConsumerWidget {
  const FutureProviderHooksPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final userAsyncData = ref.watch(userDataProvider);

    final animationController = useState(useAnimationController(duration: const Duration(milliseconds: 500)));

    useEffect((){
      userAsyncData.whenData((data){
        animationController.value.forward();
      }
      );
      return null;
    },[userAsyncData]);
    return Scaffold(
      appBar: AppBar(title: const Text('Getting the User'),
      ),
      body: Center(child: userAsyncData.when(data: (jsonUser) => ScaleTransition(
        scale: animationController.value,
        child: ListTile(title:  Text('${jsonUser['name']}'),
        subtitle: Text('${jsonUser['email']}'),),
      ), error: (error, stackTrace) => Text('Error : ${error.toString()}'), loading: () => const CircularProgressIndicator()),),
    );
  }
}
