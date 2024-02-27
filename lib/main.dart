import 'package:flutter/material.dart';
import 'package:supabase_campos_sergi/pages/account_screen.dart';
import 'package:supabase_campos_sergi/pages/login_screen.dart';
import 'package:supabase_campos_sergi/pages/signup_screen.dart';
import 'package:supabase_campos_sergi/pages/splash_screen.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:supabase_campos_sergi/pages/search_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  const supabaseUrl = 'https://ydhqtiuvqixanaknhbqi.supabase.co';
  const supabaseKey = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InlkaHF0aXV2cWl4YW5ha25oYnFpIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MDg5NTg2NTYsImV4cCI6MjAyNDUzNDY1Nn0.r2ziJ3ZZRQUdOVeXLhwVInNceECltOT6JOFcm3irQuU';
  await Supabase.initialize(url: supabaseUrl, anonKey: supabaseKey);

  runApp(MyApp());
}

final supabase = Supabase.instance.client;

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Supabase Flutter',
      theme: ThemeData.dark().copyWith(
        primaryColor: Colors.white,
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            foregroundColor: Colors.purple,
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.white,
            backgroundColor: Colors.purple,
          ),
        ),
      ),
      initialRoute: '/',
      routes: <String, WidgetBuilder>{
        '/': (_) => const SplashPage(),
        '/login': (_) => const LoginPage(),
        '/signup': (_) => SignUpScreen(),
        '/account': (_) => const AccountPage(),
        '/search': (_) => const SearchPage(),

      },
    );
  }
}
