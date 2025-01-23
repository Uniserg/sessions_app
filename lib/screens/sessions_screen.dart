import 'package:flutter/material.dart';
import 'package:sessions_app/screens/login_screen.dart';
import 'package:sessions_app/widgets/device_info.dart';
import 'package:sessions_app/constants/sessions.dart';

class SessionScreen extends StatefulWidget {
  final String accessToken;

  const SessionScreen({super.key, required this.accessToken});

  @override
  State<SessionScreen> createState() => _SessionScreenState();
}

class _SessionScreenState extends State<SessionScreen> {
  List sessions = [];
  Future<void> fetchSessions() async {
    sessions = getSessions();
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
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const LoginScreen()),
                    (route) => false);
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
                        fontWeight: FontWeight.bold, color: Colors.green[700]),
                  )),
              DeviceInfoWidget(
                sessionInfo: getCurrentSessionInfo(),
                onDelete: () {
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LoginScreen()),
                      (route) => false);
                },
              ),
              const Divider(),
              ListView.builder(
                shrinkWrap: true,
                itemCount: sessions.length,
                itemBuilder: (context, index) {
                  return DeviceInfoWidget(
                    sessionInfo: getSessionInfo(),
                    onDelete: () {
                      setState(() {
                        sessions.removeAt(index);
                      });
                    },
                  );
                },
              )
            ],
          ),
        ));
  }
}
