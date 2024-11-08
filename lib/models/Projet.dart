import 'package:linea21/models/Indicateur.dart';

class Projet {
  String nom;
  String statut;
  List<Indicateur> indicateurs;

  Projet(this.nom, this.statut, this.indicateurs);
}