import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:sessions_app/constants/app_constants.dart';
import 'package:http/http.dart' as http;
import 'package:sessions_app/screens/sessions_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  String accessToken = "";
  String errorMessage = "";

  void loginMock() {
    String login = usernameController.text;
    String password = passwordController.text;

    if ((login == 'admin' || login == "admin@mail.ru") && password == 'admin') {
      Navigator.pop(context);
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => SessionScreen(accessToken: accessToken)),
      );
    } else {
      setState(() {
        errorMessage = "Неверный логин или пароль";
      }); 
    }
  }

  Future<void> login() async {
    final body = {
      'client_id': clientId,
      'grant_type': 'password',
      'username': usernameController.text,
      'password': passwordController.text
    };

    // Кодируем тело в строку
    final encodedBody =
        body.entries.map((e) => '${e.key}=${e.value}').join('&');

    final response = await http.post(
      Uri.parse(keycloakUrl),
      headers: {
        'Content-Length': encodedBody.length.toString(), // Указываем длину тела
        'Content-Type': 'application/x-www-form-urlencoded',
        'Accept': '*/*',
        // 'Host': keycloakHost,
      },
      body: body,
    );

    if (response.statusCode == 200) {
      final responseData = json.decode(response.body);
      setState(() {
        accessToken = responseData['access_token'];
      });
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => SessionScreen(accessToken: accessToken)),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Login failed! Please check your credentials.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Вход в аккаунт")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: usernameController,
              decoration: InputDecoration(labelText: "Логин"),
            ),
            TextField(
              controller: passwordController,
              decoration: InputDecoration(labelText: "Пароль"),
              obscureText: true,
            ),
            SizedBox(height: 16),
            Padding(
              padding: EdgeInsets.all(10),
              child: Text(
                errorMessage,
                style: TextStyle(color: Colors.red),
              ),
            ),
            ElevatedButton(
              onPressed: loginMock,
              child: Text("Логин"),
            ),
          ],
        ),
      ),
    );
  }
}
