import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sessions_app/data/session_info.dart';

class DeviceInfoWidget extends StatelessWidget {
  final SessionInfo sessionInfo;
  final DateFormat dateFormat = DateFormat("dd.MM.yyyy HH:mm");

  final Map<String, Image> icons = {};

  Image mapDeviceTypeToIcon(String deviceType) {
    Image? icon = icons[deviceType];

    if (icon != null) {
      return icon;
    }
    icon = Image.asset("assets/$deviceType.png");
    icons[deviceType] = icon;

    return icon;
  }

  DeviceInfoWidget({
    super.key,
    required this.sessionInfo,
  });

  void _showConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: const Text(
              'Вы действительно хотите удалить сессию, тем самым выйти из этого устройства?'),
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
                'Удалить',
                style: TextStyle(color: Colors.red[700]),
              ),
              onPressed: () {
                // Действие при подтверждении удаления
                print('Сессия удалена');
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
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          // CircleAvatar(
          //   radius: 40,
          //   foregroundImage: deviceIcon.image
          // ),
          SizedBox(
              width: 40, child: mapDeviceTypeToIcon(sessionInfo.deviceType)),
          const SizedBox(width: 16.0),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  sessionInfo.deviceName,
                  style: const TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  sessionInfo.appVersion,
                  style: const TextStyle(
                    fontSize: 14.0,
                  ),
                ),
                Text(
                  "Ip-адрес: ${sessionInfo.ipAddress}",
                  style: const TextStyle(
                    fontSize: 14.0,
                  ),
                ),
                Text(
                  "Дата входа: ${dateFormat.format(sessionInfo.start)}",
                  style: const TextStyle(
                    fontSize: 14.0,
                  ),
                ),
                Text(
                  "Последняя активность: ${dateFormat.format(sessionInfo.lastAccess)}",
                  style: const TextStyle(
                    fontSize: 14.0,
                  ),
                ),
                Text(
                  sessionInfo.location,
                  style: const TextStyle(
                    fontSize: 14.0,
                  ),
                ),
              ],
            ),
          ),

          IconButton(
            icon: Icon(
              Icons.delete,
              color: Colors.red[700],
            ),
            onPressed: () {
              _showConfirmationDialog(context);
            },
          )
        ],
      ),
    );
  }
}
