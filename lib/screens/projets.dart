
 import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:linea21/constants/constantes.dart';
import 'package:linea21/models/Indicateur.dart';
import 'package:linea21/models/Projet.dart';
import 'package:linea21/screens/commentaire.dart';
import 'package:linea21/screens/detail_projet.dart';
import 'package:linea21/screens/visualisation_data.dart';

class ProjetListScreen extends StatefulWidget {
     bool? goToCommentPage;
     ProjetListScreen({super.key, this.goToCommentPage});


  @override
  _ProjetListScreenState createState() => _ProjetListScreenState();
}


class _ProjetListScreenState extends State<ProjetListScreen> {
  List<Projet> projets = [
    Projet('Projet 1', 'Non commencé', [
      Indicateur('Réduction d\'émissions', 20, 100),
      Indicateur('Énergie renouvelable', 50, 100),
    ]),
    Projet('Projet 2', 'En cours', [
      Indicateur('Qualité de l\'eau', 70, 100),
      Indicateur('Biodiversité', 40, 100),
    ]),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Gestion des Projets", style: TextStyle(color: blanc),),
        centerTitle: true,
        backgroundColor: gris,
      ),
      body: ListView.builder(
        itemCount: projets.length,
        itemBuilder: (context, index) {
          final projet = projets[index];
          return Card(
            margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            color: Colors.grey[200],
            child: ListTile(
              title: Text(projet.nom),
              subtitle: Text("Statut : ${projet.statut}"),
              trailing: Icon(!widget.goToCommentPage! ? Icons.arrow_forward : Icons.comment, color: Colors.grey[800]),
              onTap: () {
                !widget.goToCommentPage! ?
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProjetDetailScreen(projet: projet),
                  ),
                ) : Get.to(transition: Transition.leftToRightWithFade, CommentairesScreen()) ;
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Logique pour ajouter un nouveau projet
        },
        backgroundColor: Colors.red,
        child: Icon(Icons.add),
      ),
    );
  }
}
