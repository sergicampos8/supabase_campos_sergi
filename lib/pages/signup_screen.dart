import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign Up'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _emailController,
              style: const TextStyle(color: Colors.white), // Cambiar color de texto
              decoration: const InputDecoration(
                labelText: 'Email',
                labelStyle: TextStyle(color: Colors.white), // Cambiar color del label
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.purple), // Cambiar color del borde
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.purple), // Cambiar color del borde cuando está enfocado
                ),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _passwordController,
              obscureText: true,
              style: const TextStyle(color: Colors.white), // Cambiar color de texto
              decoration: const InputDecoration(
                labelText: 'Password',
                labelStyle: TextStyle(color: Colors.white), // Cambiar color del label
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.purple), // Cambiar color del borde
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.purple), // Cambiar color del borde cuando está enfocado
                ),
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () async {
                // Initialize Supabase client
                final supabase = Supabase.instance.client;

                // Get email and password from controllers
                final email = _emailController.text.trim();
                final password = _passwordController.text.trim();

                final sm = ScaffoldMessenger.of(context);
                // Sign up user
                final response = await supabase.auth
                    .signUp(password: password, email: email);
                sm.showSnackBar(SnackBar(
                    content: Text("Logged In: ${response.user!.email!}")));
                    // ignore: use_build_context_synchronously
                    Navigator.of(context).pushReplacementNamed('/account');

              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.purple), // Cambiar color del botón
              ),
              child: const Text('Sign Up'),
            ),
            const SizedBox(height: 16),
            _buildLogInUpButton(),
          ],
        ),
      ),
      backgroundColor: Colors.purple, // Cambiar color de fondo de la pantalla
    );
  }

  Widget _buildLogInUpButton() {
    return TextButton(
      onPressed: () {
        Navigator.of(context).pushReplacementNamed('/login');
      },
      style: ButtonStyle(
        foregroundColor: MaterialStateProperty.all<Color>(Colors.white), // Cambiar color del texto del botón
      ),
      child: const Text('Already have an account? Sign In'),
    );
  }
}
