// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:sessions_app/mock/sessions.dart';

class SessionInfo {
  // Эти поля есть в keycloak
  final DateTime start;
  final DateTime lastAccess;
  final String ipAddress;
  // Этих полей нет :(
  final String deviceName;
  final String appVersion;
  final String deviceType;
  final String location;

  SessionInfo(
      {required this.start,
      required this.lastAccess,
      required this.ipAddress,
      required this.deviceName,
      required this.appVersion,
      required this.deviceType,
      required this.location});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'start': start.millisecondsSinceEpoch,
      'lastAccess': lastAccess.millisecondsSinceEpoch,
      'ipAddress': ipAddress,
    };
  }

  factory SessionInfo.fromMap(Map<String, dynamic> map) {
    return SessionInfo(
      start: DateTime.fromMillisecondsSinceEpoch(map['start']),
      lastAccess: DateTime.fromMillisecondsSinceEpoch(map['lastAccess']),
      ipAddress: map['ipAddress'],
      deviceName: map['deviceName'],
      appVersion: map['appVersion'] ?? getAppNameAndVersion(),
      deviceType: map['deviceType'] ?? getRandomDeviceType(),
      location: map['location'] ?? "Россия, Москва"
    );
  }

  String toJson() => json.encode(toMap());

  factory SessionInfo.fromJson(String source) =>
      SessionInfo.fromMap(json.decode(source) as Map<String, dynamic>);
}
