import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:linea21/constants/constantes.dart';

class VisualisationIndicateur extends StatefulWidget {
  const VisualisationIndicateur({super.key});

  @override
  State<VisualisationIndicateur> createState() => _VisualisationIndicateurState();
}

class _VisualisationIndicateurState extends State<VisualisationIndicateur> {
  // Exemple de liste d'indicateurs
  List<Map<String, dynamic>> indicateurs = [
    {
      "name": "Performance de projet",
      "description": "Suivi de la performance du projet.",
      "current_value": 75.5,
      "target_value": 100.0,
    },
    {
      "name": "Bénéfice annuel",
      "description": "Indicateur des bénéfices de l'année.",
      "current_value": 55.0,
      "target_value": 80.0,
    },
    {
      "name": "Satisfaction client",
      "description": "Taux de satisfaction des clients.",
      "current_value": 85.0,
      "target_value": 90.0,
    },
  ];

  // Indicateur sélectionné pour afficher le graphique
  Map<String, dynamic>? selectedIndicateur;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      backgroundColor: gris,
        title: const Text('Visualisation des Indicateurs'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Table avec la liste des indicateurs
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal, // Permet de défiler horizontalement
                      child: DataTable(
                        columns: const [
                          DataColumn(label: Text('Nom de l\'indicateur')),
                          DataColumn(label: Text('Description')),
                          DataColumn(label: Text('Valeur actuelle')),
                          DataColumn(label: Text('Valeur cible')),
                        ],
                        rows: indicateurs.map((indicateur) {
                          return DataRow(cells: [
                            DataCell(Text(indicateur['name'])),
                            DataCell(Text(indicateur['description'])),
                            DataCell(Text(indicateur['current_value'].toString())),
                            DataCell(Text(indicateur['target_value'].toString())),
                          ]);
                        }).toList(),
                      ),
                    ),
                    // Sélecteur d'indicateur
                    const SizedBox(height: 16),
                    DropdownButton<Map<String, dynamic>>(
                      hint: const Text("Sélectionner un indicateur"),
                      value: selectedIndicateur,
                      onChanged: (Map<String, dynamic>? newValue) {
                        setState(() {
                          selectedIndicateur = newValue;
                        });
                      },
                      items: indicateurs.map((indicateur) {
                        return DropdownMenuItem<Map<String, dynamic>>(
                          value: indicateur,
                          child: Text(indicateur['name']),
                        );
                      }).toList(),
                    ),
                    const SizedBox(height: 16),
                    // Affichage du graphique en fonction de l'indicateur sélectionné
                    if (selectedIndicateur != null)
                      SizedBox(
                        width: 250,
                        height: 250,
                        child: PieChart(
                          PieChartData(
                            sections: [
                              PieChartSectionData(
                                color: (selectedIndicateur!['current_value'] /
                                        selectedIndicateur!['target_value'] >=
                                    1.0)
                                    ? Colors.green
                                    : Colors.red,
                                value: (selectedIndicateur!['current_value'] /
                                        selectedIndicateur!['target_value']) *
                                    100,
                                title: '${(selectedIndicateur!['current_value'] /
                                        selectedIndicateur!['target_value'] *
                                        100)
                                    .toStringAsFixed(1)}%',
                                radius: 40,
                                titleStyle: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              PieChartSectionData(
                                color: Colors.grey[300]!,
                                value: (1 -
                                        (selectedIndicateur!['current_value'] /
                                            selectedIndicateur!['target_value'])) *
                                    100,
                                radius: 40,
                              ),
                            ],
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
