class Indicateur {
  String nom;
  int valeurActuelle;
  int objectif;

  Indicateur(this.nom, this.valeurActuelle, this.objectif);

  double progression() {
    return valeurActuelle / objectif;
  }
}