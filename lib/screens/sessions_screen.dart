import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:sessions_app/constants/app_constants.dart';
import 'package:sessions_app/data/session_info.dart';
import 'package:sessions_app/widgets/device_info.dart';
import 'package:http/http.dart' as http;
import 'package:sessions_app/mock/sessions.dart';

class SessionScreen extends StatefulWidget {
  final String accessToken;

  SessionScreen({required this.accessToken});

  @override
  _SessionScreenState createState() => _SessionScreenState();
}

class _SessionScreenState extends State<SessionScreen> {
  List sessions = [];
  Future<void> fetchSessions() async {
    // TODO: вернуть запрос
    sessions = mockedSessions;

    // final response = await http.get(
    //   Uri.parse("$apiServer/sessions"),
    //   headers: {
    //     'Authorization': 'Bearer ${widget.accessToken}',
    //     'Content-Type': 'application/json',
    //   },
    // );

    // if (response.statusCode == 200) {
    //   setState(() {
    //     sessions = json.decode(response.body);
    //   });
    // } else {
    //   ScaffoldMessenger.of(context).showSnackBar(
    //     SnackBar(content: Text('Failed to fetch sessions!')),
    //   );
    // }
  }

  void deleteSession(int index) {}

  @override
  void initState() {
    super.initState();
    fetchSessions();
  }

  void _showConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: const Text('Вы действительно хотите выйти из аккаунта?'),
          actions: <Widget>[
            TextButton(
              child: const Text(
                'Отмена',
                style: TextStyle(color: Colors.blue),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text(
                'Выйти',
                style: TextStyle(color: Colors.red[700]),
              ),
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Сессии аккаунта"),
          leading: IconButton(
            icon: const Icon(
              Icons.exit_to_app,
              color: Colors.grey,
            ),
            onPressed: () {
              _showConfirmationDialog(context);
            },
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                  padding: EdgeInsets.all(20),
                  child: Text(
                    "Текущая сессия",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.green[700]
                    ),
                  )),
              DeviceInfoWidget(sessionInfo: getCurrentSessionInfo()),
              Divider(),
              ListView.builder(
                shrinkWrap: true,
                itemCount: sessions.length,
                itemBuilder: (context, index) {
                  return DeviceInfoWidget(
                    sessionInfo: getRandomSessionInfo(),
                  );
                },
              )
            ],
          ),
        ));
  }
}
