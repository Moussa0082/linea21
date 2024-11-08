import 'package:flutter/material.dart';
import 'package:linea21/constants/constantes.dart';
import 'package:linea21/models/Commentaire.dart';

class CommentairesScreen extends StatefulWidget {
  @override
  _CommentairesScreenState createState() => _CommentairesScreenState();
}

class _CommentairesScreenState extends State<CommentairesScreen> {
  List<Commentaire> commentaires = [
    Commentaire("Alice", "J'adore le progrès sur ce projet!", "il y a 2h", false),
    Commentaire("Bob Martin", "Des défis à anticiper?", "il y a 3h", false),
  ];
  final TextEditingController _commentController = TextEditingController();

  void _ajouterCommentaire(String contenu) {
    setState(() {
      commentaires.add(Commentaire("Vous", contenu, "À l'instant", true));
      _commentController.clear();
    });
  }

  String _getInitials(String name) {
    List<String> names = name.split(" ");
    String initials = "";
    for (var part in names) {
      if (part.isNotEmpty) initials += part[0];
    }
    return initials.toUpperCase();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Commentaires", style: TextStyle(color: blanc),),
        backgroundColor: gris,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: commentaires.length,
                itemBuilder: (context, index) {
                  final commentaire = commentaires[index];
                  final estUtilisateur = commentaire.estUtilisateur;
        
                  return Align(
                    alignment: estUtilisateur ? Alignment.centerRight : Alignment.centerLeft,
                    child: Row(
                      mainAxisAlignment: estUtilisateur
                          ? MainAxisAlignment.end
                          : MainAxisAlignment.start,
                      children: [
                        if (!estUtilisateur)
                          CircleAvatar(
                            backgroundColor: Colors.blueGrey,
                            child: Text(
                              _getInitials(commentaire.auteur),
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                          padding: EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: estUtilisateur ? bleu : Colors.green,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Column(
                            crossAxisAlignment: estUtilisateur
                                ? CrossAxisAlignment.end
                                : CrossAxisAlignment.start,
                            children: [
                              Text(
                                commentaire.auteur,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: blanc,
                                ),
                              ),
                              SizedBox(height: 4),
                              Text(
                                commentaire.contenu,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: blanc,
                                ),
                              ),
                              SizedBox(height: 4),
                              Text(
                                commentaire.temps,
                                style: TextStyle(color: blanc, fontSize: 12),
                              ),
                            ],
                          ),
                        ),
                        if (estUtilisateur)
                          CircleAvatar(
                            backgroundColor: Colors.blueGrey,
                            child: Text(
                              _getInitials(commentaire.auteur),
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                      ],
                    ),
                  );
                },
              ),
            ),
            Divider(),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _commentController,
                      decoration: InputDecoration(
                        hintText: "Ajouter un commentaire...",
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.send, color: Colors.red),
                    onPressed: () {
                      if (_commentController.text.isNotEmpty) {
                        _ajouterCommentaire(_commentController.text);
                      }
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
