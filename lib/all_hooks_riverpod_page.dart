import 'package:flutter/material.dart';
import 'package:learn_flutter_hooks/riverpod_hooks/eg1_counter_hook_page.dart';
import 'package:learn_flutter_hooks/riverpod_hooks/eg2_favorite_animation_hook_page.dart';

class AllHooksRiverpodPage extends StatelessWidget {
  const AllHooksRiverpodPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('All Hooks Pages'),),

      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => const CounterHookPage()));
            }, child: const Text('Example 1: Counter Provider')),

            const SizedBox(height: 20,),
            ElevatedButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => const AnimationHooksPage()));
            }, child: const Text('Example 2: Animation Hooks Page')),

          ],
        ),
      ),
    );
  }
}
