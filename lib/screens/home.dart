import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:linea21/constants/constantes.dart';
import 'package:linea21/screens/actualite.dart';
import 'package:linea21/screens/projets.dart';
import 'package:linea21/screens/visualisation_data.dart';
import 'package:linea21/screens/visualisation_indicateur.dart';
import 'package:linea21/widgets/app_bar.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int unreadNotifications = 3; // Example for badge count

  @override
  Widget build(BuildContext context) {
    return Scaffold(
         appBar: AppBar(
        backgroundColor: gris,
        title:Container(
    height: 80,
    width: double.infinity,
          child: CustomAppBarWidget(
            notificationCount: 3,
            userName: "Moussa BANE",
            userImageUrl: "assets/images/logo-homepage.png",
          ),
        ),
        // Row(
        //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //   children: [
        //     Column(
        //       crossAxisAlignment: CrossAxisAlignment.start,
        //       children: [
        //         Text(
        //           "Bienvenue 👋",
        //           style: TextStyle(color: blanc, fontSize: 22),
        //         ),
        //         Text(
        //           "Moussa BANE",
        //           style: TextStyle(color: blanc, fontSize: 18),
        //         ),
        //       ],
        //     ),
        //     Stack(
        //       alignment: Alignment.center,
        //       children: [
        //         Icon(Icons.notifications, size: 36, color: Colors.white),
        //         if (unreadNotifications > 0)
        //           Positioned(
        //             right: 0,
        //             child: GestureDetector(
        //               onTap: (){
        //            Get.to(NotificationsScreen(), transition: Transition.leftToRight);

        //               },
        //               child: Container(
        //                 padding: EdgeInsets.all(4),
        //                 decoration: BoxDecoration(
        //                   color: Colors.red,
        //                   shape: BoxShape.circle,
        //                 ),
        //                 child: Text(
        //                   '$unreadNotifications',
        //                   style: TextStyle(color: Colors.white, fontSize: 15),
        //                 ),
        //               ),
        //             ),
        //           ),
        //       ],
        //     ),
        //   ],
        // ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          childAspectRatio: 1, // Adjust for square cards
          children: [
            _buildCard(
              title: "Suivi de l'avancement",
              icon: Icons.timeline,
              color: Colors.teal,
              onTap: () {
                // Navigate to Project Tracking page
                Get.to(ProjetListScreen(goToCommentPage: false,), transition: Transition.leftToRight);
              },
            ),
            _buildCard(
              title: "Actualité",
              icon: Icons.article,
              color: Colors.deepPurple,
              onTap: () {
                Get.to(ActualiteScreen(), transition: Transition.leftToRight);
                // Navigate to Performance Indicators page
        
              },
            ),
            _buildCard(
              title: "Discussions",
              icon: Icons.comment,
              color: Colors.orange,
              onTap: () {
                // Navigate to Comments page
             Get.to(ProjetListScreen(goToCommentPage: true,), transition: Transition.leftToRight);
        
              },
            ),
            _buildCard(
              title: "Visualisation des projets",
              icon: Icons.notifications,
              color: Colors.blue,
              onTap: () {
                // Navigate to Notifications page
             Get.to(VisualisationDataScreen(), transition: Transition.leftToRight);
              },
            ),
            _buildCard(
              title: "Rapports PDF",
              icon: Icons.picture_as_pdf,
              color: Colors.red,
              onTap: () {
                // Navigate to Reports page
              },
            ),
            _buildCard(
              title: "Visualisation des indicateurs",
              icon: Icons.bar_chart,
              color: Colors.green,
              onTap: () {
                // Navigate to Data Visualization page
             Get.to(VisualisationIndicateur(), transition: Transition.leftToRight);
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCard({
    required String title,
    required IconData icon,
    required Color color,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        color: Colors.white,
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 40, color: color),
              SizedBox(height: 10),
              Text(
                title,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
