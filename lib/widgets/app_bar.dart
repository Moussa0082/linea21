import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:linea21/constants/constantes.dart';
import 'package:linea21/screens/notification.dart';

class CustomAppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  final int notificationCount;
  final String userName;
  final String userImageUrl;

  const CustomAppBarWidget({
    Key? key,
    required this.notificationCount,
    required this.userName,
    required this.userImageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: gris,
      // padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // User information
          Row(
            children: [
              CircleAvatar(
                backgroundImage: AssetImage(userImageUrl),
                radius: 25,
              ),
              const SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Bienvenue 👋',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  Text(
                    userName,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ],
          ),
          // Notification icon with badge
          GestureDetector(
            onTap: (){
              Get.to(transition: Transition.downToUp, NotificationsScreen());
            },
            child: Stack(
              alignment: Alignment.topRight,
              children: [
                Icon(
                  Icons.notifications,
                  color: Colors.white,
                  size: 30,
                ),
                if (notificationCount > 0)
                  Positioned(
                    right: 0,
                    child: Container(
                      padding: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        color: Colors.red,
                        shape: BoxShape.circle,
                      ),
                      child: Text(
                        '$notificationCount',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(80);
}
