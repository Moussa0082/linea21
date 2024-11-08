
import 'package:flutter/material.dart';
import 'package:linea21/constants/constantes.dart';
import 'package:linea21/models/Notification.dart';

 class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({super.key});

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {

  final List<NotificationItem> notifications = [
    NotificationItem(
        "Mise à jour du projet A", "Le statut du projet a changé.", DateTime.now().subtract(Duration(minutes: 30))),
    NotificationItem(
        "Nouveau commentaire", "Alice a commenté sur le projet B.", DateTime.now().subtract(Duration(hours: 2))),
  ];

  String _formatHeure(DateTime dateTime) {
    final heures = dateTime.hour.toString().padLeft(2, '0');
    final minutes = dateTime.minute.toString().padLeft(2, '0');
    return "$heures:$minutes";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Notifications" , style: TextStyle(color: blanc),),
        backgroundColor: gris,
      ),
      body: ListView.builder(
        itemCount: notifications.length,
        itemBuilder: (context, index) {
          final notification = notifications[index];
          return ListTile(
            leading: Icon(Icons.notifications, color: Colors.red),
            title: Text(notification.titre, style: TextStyle(fontWeight: FontWeight.bold)),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(notification.description),
                SizedBox(height: 4),
                Text(
                  _formatHeure(notification.date),
                  style: TextStyle(color: Colors.grey[600], fontSize: 12),
                ),
              ],
            ),
            isThreeLine: true,
          );
        },
      ),
    );
  }
}



 
 