import 'package:flutter/material.dart';
import 'package:stellantis/pages/home_page.dart';
import 'package:stellantis/pages/login_page.dart';
import 'package:stellantis/pages/team_page.dart';
import 'package:stellantis/theme/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: appTheme,
      routes: {
        '/': (context) => LoginPage(),
        '/home': (context) => HomePage(),
        '/team': (context) => TeamPage(),
      },
      initialRoute: '/',
    );
  }
}