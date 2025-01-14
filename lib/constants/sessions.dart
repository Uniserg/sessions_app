import 'dart:math';

import 'package:sessions_app/data/session_info.dart';

final mockedSessions = [
  {
    "id": "053b74ad-0ee5-4b53-b8d4-8c39da10b4ce",
    "username": "admin",
    "userId": "0c30222b-b593-4cb4-9ece-67d34e6b88b5",
    "ipAddress": "172.24.0.1",
    "start": 1736210053000,
    "lastAccess": 1736210053000,
    "rememberMe": false,
    "clients": {"b5ed37c6-d06d-4f43-994e-3534a5aab997": "account"}
  },
  {
    "id": "d46cb3b2-85dc-4780-a023-4d2e07802b62",
    "username": "admin",
    "userId": "0c30222b-b593-4cb4-9ece-67d34e6b88b5",
    "ipAddress": "172.24.0.1",
    "start": 1736210055000,
    "lastAccess": 1736210055000,
    "rememberMe": false,
    "clients": {"330ca688-3084-464c-8c1a-8f80b82b89aa": "sessions-microservice"}
  },
  {
    "id": "8bcaa17a-51a3-4f54-bcf4-83b6b8795a75",
    "username": "admin",
    "userId": "0c30222b-b593-4cb4-9ece-67d34e6b88b5",
    "ipAddress": "172.24.0.1",
    "start": 1736210738000,
    "lastAccess": 1736210738000,
    "rememberMe": false,
    "clients": {"330ca688-3084-464c-8c1a-8f80b82b89aa": "sessions-microservice"}
  },
  {
    "id": "76a715c0-578e-4e9d-b81e-3b4c0559116b",
    "username": "admin",
    "userId": "0c30222b-b593-4cb4-9ece-67d34e6b88b5",
    "ipAddress": "172.24.0.1",
    "start": 1736210142000,
    "lastAccess": 1736210142000,
    "rememberMe": false,
    "clients": {"b5ed37c6-d06d-4f43-994e-3534a5aab997": "account"}
  },
  {
    "id": "f5be74b7-a8e6-4850-9073-f8c45836bf85",
    "username": "admin",
    "userId": "0c30222b-b593-4cb4-9ece-67d34e6b88b5",
    "ipAddress": "172.24.0.1",
    "start": 1736210717000,
    "lastAccess": 1736210717000,
    "rememberMe": false,
    "clients": {"b5ed37c6-d06d-4f43-994e-3534a5aab997": "account"}
  }
];

const appName = "Account Security App";
const appVersion = "0.0.1";

const devices = ["MateBook D14", "Pixel 6A"];

final random = Random();

final deviceTypes = [
  'android',
  "ios",
  'chrome',
  'edge',
  'firefox',
  'linux',
  'mac',
  'windows'
];

List getSessions() {
  return mockedSessions;
}

String getRandomDeviceType() {
  return deviceTypes[random.nextInt(deviceTypes.length)];
}

String getRandomDevice(String deviceType) {
  if (deviceType == 'windows' || deviceType == 'linux') {
    return "MateBook D14";
  }
  if ('mac' == deviceType) {
    return "MacBook Air 13 (2023)";
  }
  if ('android' == deviceType) {
    return "Pixel 6A";
  }

  if ('ios' == deviceType) {
    return "iPhone 15 Pro Max";
  }

  return devices[random.nextInt(devices.length)];
}

String getAppNameAndVersion() {
  return "$appName $appVersion";
}

SessionInfo getSessionInfo() {
  String deviceType = getRandomDeviceType();
  String device = getRandomDevice(deviceType);
  DateTime start = DateTime.now().add(Duration(
      days: random.nextInt(2),
      hours: random.nextInt(4),
      minutes: random.nextInt(60)));

  DateTime lastAccess = start.add(Duration(
      days: random.nextInt(2),
      hours: random.nextInt(4),
      minutes: random.nextInt(60)));

  return SessionInfo(
      start: start,
      lastAccess: lastAccess,
      ipAddress: "172.24.0.1",
      deviceName: device,
      appVersion: getAppNameAndVersion(),
      deviceType: deviceType,
      location: "Россия/Москва");
}

SessionInfo getCurrentSessionInfo() {
  return SessionInfo(
      start: DateTime.now(),
      lastAccess: DateTime.now(),
      ipAddress: "172.24.0.1",
      deviceName: "MateBook D14",
      appVersion: getAppNameAndVersion(),
      deviceType: "chrome",
      location: "Россия/Москва");
}
