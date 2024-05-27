import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class LoginHooksPage extends HookWidget {
  const LoginHooksPage({super.key});

  @override
  Widget build(BuildContext context) {
    final _formKey = useMemoized(() => GlobalKey<FormState>());
    final _emailController = useTextEditingController();

    void _signIn() {
      if (_formKey.currentState!.validate()) {
        final email = _emailController.text;

        // Show the email in a SnackBar
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Email: $email'),
          ),
        );
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Hooks Login Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: TextFormField(
            controller: _emailController,
            decoration: InputDecoration(
              labelText: 'Email',
              suffixIcon: IconButton(
                onPressed: _signIn,
                icon: const Icon(Icons.arrow_forward),
              ),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your email';
              }
              if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                return 'Please enter a valid email address';
              }
              return null;
            },
          ),
        ),
      ),
    );
  }
}
