import 'dart:async';
import 'package:flutter/material.dart';
import 'package:supabase_campos_sergi/main.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _redirecting = false;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  late final StreamSubscription<AuthState> _authStateSubscription;

  @override
  void initState() {
    _authStateSubscription = supabase.auth.onAuthStateChange.listen((data) {
      if (_redirecting) return;
      final session = data.session;
      if (session != null) {
        _redirecting = true;
        Navigator.of(context).pushReplacementNamed('/search');
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    _authStateSubscription.cancel();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login Page'),
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _buildTextField(
              controller: _emailController,
              hintText: 'Email',
            ),
            const SizedBox(height: 16),
            _buildTextField(
              controller: _passwordController,
              hintText: 'Password',
              obscureText: true,
            ),
            const SizedBox(height: 16),
            _buildLoginButton(),
            const SizedBox(height: 16),
            _buildSignUpButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String hintText,
    bool obscureText = false,
  }) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: hintText,
      ),
      obscureText: obscureText,
    );
  }

  Widget _buildLoginButton() {
    return ElevatedButton(
      onPressed: () async {
        final supabase = Supabase.instance.client;
        final email = _emailController.text.trim();
        final password = _passwordController.text.trim();

        final sm = ScaffoldMessenger.of(context);
        // Sign in user
        final response = await supabase.auth
            .signInWithPassword(password: password, email: email);
        sm.showSnackBar(
            SnackBar(content: Text("Logged In: ${response.user!.email!}")));

        // ignore: use_build_context_synchronously
        Navigator.of(context).pushReplacementNamed('/search');
      },
      child: const Text('Login'),
    );
}

  Widget _buildSignUpButton() {
    return TextButton(
      onPressed: () {
        Navigator.of(context).pushReplacementNamed('/signup');
      },
      child: const Text('Don\'t have an account? Sign Up'),
    );
  }
}
