import 'package:flutter/material.dart';
import 'package:linea21/constants/constantes.dart';
import 'package:linea21/models/Projet.dart';

class ProjetDetailScreen extends StatefulWidget {
  final Projet projet;

  ProjetDetailScreen({required this.projet});

  @override
  _ProjetDetailScreenState createState() => _ProjetDetailScreenState();
}

class _ProjetDetailScreenState extends State<ProjetDetailScreen> {
  void _mettreAJourStatut(String nouveauStatut) {
    setState(() {
      widget.projet.statut = nouveauStatut;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.projet.nom ,style: TextStyle(color: blanc),),
        backgroundColor:gris,
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Statut : ${widget.projet.statut}",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            DropdownButton<String>(
              value: widget.projet.statut,
              items: ['Non commencé', 'En cours', 'Terminé']
                  .map((statut) => DropdownMenuItem(
                        child: Text(statut),
                        value: statut,
                      ))
                  .toList(),
              onChanged: (nouveauStatut) {
                if (nouveauStatut != null) {
                  _mettreAJourStatut(nouveauStatut);
                }
              },
            ),
            SizedBox(height: 32),
            Text(
              "Indicateurs de Performance",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: widget.projet.indicateurs.length,
                itemBuilder: (context, index) {
                  final indicateur = widget.projet.indicateurs[index];
                  return Card(
                    margin: EdgeInsets.symmetric(vertical: 8),
                    color: Colors.grey[300],
                    child: ListTile(
                      title: Text(indicateur.nom),
                      subtitle: LinearProgressIndicator(
                        value: indicateur.progression(),
                        color: Colors.green,
                        backgroundColor: Colors.grey,
                      ),
                      trailing: Text(
                        "${indicateur.valeurActuelle}/${indicateur.objectif}",
                        style: TextStyle(color: Colors.grey[800]),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
