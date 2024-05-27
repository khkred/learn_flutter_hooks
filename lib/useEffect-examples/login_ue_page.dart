import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class LoginUEPage extends HookWidget {
  const LoginUEPage({super.key});

  @override
  Widget build(BuildContext context) {
    final _formKey = useMemoized(() => GlobalKey<FormState>());
    final _emailController = useTextEditingController();

    useEffect(() {
      print('Email: ${_emailController.text}');
      return null; // No Cleanup needed
    }, [_emailController.text]);

    void _signIn() {
      if (_formKey.currentState!.validate()) {
        final email = _emailController.text;
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Email: $email')),
        );
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Login useEffect Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(labelText: 'Email'),
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
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _signIn,
                child: Text('Sign In'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
