import 'package:flutter/material.dart';
import 'package:tezda/view/login_screen/login_screen.dart';
import 'package:tezda/view/login_screen/registration_screen/registration_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of the application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tezda',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
        initialRoute: '/',
       routes: {
        '/': (context) => LoginPage(),
        '/register': (context) => RegistrationScreen(),
      },
    );
  }
}

