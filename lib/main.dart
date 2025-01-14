import 'package:flutter/material.dart';
import 'package:sessions_app/screens/login_screen.dart';
import 'package:sessions_app/screens/sessions_screen.dart';

void main() {
  runApp(const AccountSecurityApp());
}

class AccountSecurityApp extends StatelessWidget {
  const AccountSecurityApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SessionScreen(accessToken: ""),
    );
  }
}
