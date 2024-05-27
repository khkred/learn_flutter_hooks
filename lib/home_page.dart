import 'package:flutter/material.dart';
import 'package:learn_flutter_hooks/counter_page.dart';

import 'login_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Demo Home Page'),
      ),
      body: Center(
        child: Column(
          children: [
            const Text(
              'Home Page',
            ),
            const SizedBox(height: 20),
            ElevatedButton(
                onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const CounterPage(),
                      ),
                    ),
                child: const Text('Go to Counter Page')),

            const SizedBox(height: 20),
            //This button takes us to a login page that just uses StatefulWidget
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const LoginPage(),
                  ),
                );
              },
              child: const Text('Go to Login Page'),
            ),
          ],
        ),
      ),
    );
  }
}