import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class CombinedHooksForm extends HookWidget {
  const CombinedHooksForm({super.key});

  @override
  Widget build(BuildContext context) {
    final _formKey = useMemoized(() => GlobalKey<FormState>());
    final _emailController = useTextEditingController();
    final _passwordController = useTextEditingController();
    final _isSubmitting = useState(false);

    useEffect(() {
      if (_isSubmitting.value) {
        // Let's do a Mock API call

        Future.delayed(const Duration(seconds: 2)).then((_) {
          _isSubmitting.value = false;
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Form Submitted'),
            ),
          );
        });
      }
    }, [_isSubmitting.value]);

    void _submitForm() {
      if (_formKey.currentState!.validate()) {
        _isSubmitting.value = true;
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Combined Hooks Form'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _emailController,
                decoration: const InputDecoration(labelText: 'Email'),
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
              TextFormField(
                controller: _passwordController,
                decoration: const InputDecoration(labelText: 'Password'),
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your password';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              _isSubmitting.value
                  ? const CircularProgressIndicator()
                  : ElevatedButton(
                      onPressed: _submitForm,
                      child: const Text('Submit'),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
