import 'package:flutter/material.dart';
import 'package:supabase_campos_sergi/main.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    _redirect();
  }

  Future<void> _redirect() async {
    // Simulate a delay of 15 seconds
    await Future.delayed(const Duration(seconds: 10));

    if (!mounted) {
      return;
    }

    final session = supabase.auth.currentSession;
    if (session != null) {
      Navigator.of(context).pushReplacementNamed('/search');
    } else {
      Navigator.of(context).pushReplacementNamed('/login');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/handball.png',
              width: 200,
              height: 200,
            ),
            const SizedBox(
                height:
                    20), // Optional: Add some spacing between the image and CircularProgressIndicator
            CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }
}
