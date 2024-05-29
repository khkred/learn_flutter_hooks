import 'package:flutter/material.dart';
import 'package:learn_flutter_hooks/all_hooks_riverpod_page.dart';
import 'package:learn_flutter_hooks/combine-hooks/combined_hooks_form.dart';
import 'package:learn_flutter_hooks/counter_page.dart';
import 'package:learn_flutter_hooks/custom-hooks/timer_screen.dart';
import 'package:learn_flutter_hooks/login_hooks_page.dart';
import 'package:learn_flutter_hooks/paginated-list/paginated_list_screen.dart';
import 'package:learn_flutter_hooks/useEffect-examples/counter_ue_page.dart';
import 'package:learn_flutter_hooks/useEffect-examples/example_screen.dart';
import 'package:learn_flutter_hooks/useEffect-examples/login_ue_page.dart';
import 'package:learn_flutter_hooks/useEffect-examples/timer_ue_page.dart';
import 'package:learn_flutter_hooks/useFuture/data_fetch_page.dart';

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
        child: SingleChildScrollView(
          child: Column(
            children: [
              ElevatedButton(
                  onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const AllHooksRiverpodPage(),
                    ),
                  ),
                  child: const Text('Go to All Hooks Riverpod Page')),
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
              const SizedBox(height: 20),
              ElevatedButton(
                  onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const LoginHooksPage(),
                        ),
                      ),
                  child: const Text('Go to Hooks Login Page')),
              const SizedBox(height: 20),
              ElevatedButton(
                  onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ExampleScreen(),
                        ),
                      ),
                  child: const Text('Go to useEffect Example Page')),
              const SizedBox(height: 20),
              ElevatedButton(
                  onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const CounterUEPage(),
                        ),
                      ),
                  child: const Text('Go to useEffect Counter Page')),

              const SizedBox(height: 20),
              ElevatedButton(
                  onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const TimerUEPage(),
                        ),
                      ),
                  child: const Text('Go to useEffect Timer Page')),
              const SizedBox(height: 20),
              ElevatedButton(
                  onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const LoginUEPage(),
                        ),
                      ),
                  child: const Text('Go to useEffect Login Page')),
              const SizedBox(height: 20),
              ElevatedButton(
                  onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const DataFetchPage(),
                        ),
                      ),
                  child: const Text('Go to useFuture Data Fetch Page')),

              const SizedBox(height: 20),
              ElevatedButton(
                  onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const CombinedHooksForm(),
                        ),
                      ),
                  child: const Text('Go to Combine Hooks Form')),

              const SizedBox(height: 20),
              ElevatedButton(
                  onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const TimerScreen(),
                        ),
                      ),
                  child: const Text('Go to Custom Hooks Timer')),

              const SizedBox(height: 20),
              ElevatedButton(
                  onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const PaginatedListScreen(),
                        ),
                      ),
                  child: const Text('Go to Paginated List')),

              const SizedBox(height: 20),


            ],
          ),
        ),
      ),
    );
  }
}
