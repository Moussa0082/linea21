import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:linea21/constants/constantes.dart'; // Pour formater la date

class Evaluation {
  final String indicatorName;
  final DateTime evaluationDate;
  final double value;
  final String comment;

  Evaluation({required this.indicatorName, required this.evaluationDate, required this.value, required this.comment});
}

class PerformanceIndicatorsPage extends StatefulWidget {
  const PerformanceIndicatorsPage({Key? key}) : super(key: key);

  @override
  _PerformanceIndicatorsPageState createState() => _PerformanceIndicatorsPageState();
}

class _PerformanceIndicatorsPageState extends State<PerformanceIndicatorsPage> {
  // Liste simulée d'évaluations
  List<Evaluation> evaluations = [
    Evaluation(indicatorName: "Indicateur A", evaluationDate: DateTime(2024, 10, 1), value: 75.0, comment: "Bon progrès"),
    Evaluation(indicatorName: "Indicateur B", evaluationDate: DateTime(2024, 10, 10), value: 85.5, comment: "Amélioration continue"),
  ];

  // Contrôleurs pour le formulaire
  final TextEditingController _indicatorController = TextEditingController();
  final TextEditingController _valueController = TextEditingController();
  final TextEditingController _commentController = TextEditingController();
  DateTime? _selectedDate;

  // Format de date
  String formatDate(DateTime date) {
    return DateFormat('yyyy-MM-dd').format(date);
  }

  // Méthode pour ajouter une évaluation
  void _addEvaluation() {
    final String indicatorName = _indicatorController.text;
    final double value = double.tryParse(_valueController.text) ?? 0.0;
    final String comment = _commentController.text;

    if (indicatorName.isNotEmpty && value > 0 && _selectedDate != null) {
      setState(() {
        evaluations.add(Evaluation(indicatorName: indicatorName, evaluationDate: _selectedDate!, value: value, comment: comment));
        // Réinitialisation des contrôleurs après ajout
        _indicatorController.clear();
        _valueController.clear();
        _commentController.clear();
        _selectedDate = null;
      });
    }
  }

  // Sélectionner la date
  Future<void> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2101),
    ) ?? DateTime.now();
    
    setState(() {
      _selectedDate = picked;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Indicateurs de Performance'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // // Formulaire pour ajouter une nouvelle évaluation
            // Padding(
            //   padding: const EdgeInsets.symmetric(vertical: 16.0),
            //   child: Text(
            //     'Ajouter une évaluation',
            //     style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            //   ),
            // ),
            // TextField(
            //   controller: _indicatorController,
            //   decoration: InputDecoration(labelText: 'Nom de l\'indicateur'),
            // ),
            // TextField(
            //   controller: _valueController,
            //   keyboardType: TextInputType.number,
            //   decoration: InputDecoration(labelText: 'Valeur'),
            // ),
            // TextField(
            //   controller: _commentController,
            //   decoration: InputDecoration(labelText: 'Commentaire'),
            // ),
            // Row(
            //   children: [
            //     Text(_selectedDate == null
            //         ? 'Aucune date sélectionnée'
            //         : 'Date: ${formatDate(_selectedDate!)}'),
            //     IconButton(
            //       icon: Icon(Icons.calendar_today),
            //       onPressed: () => _selectDate(context),
            //     ),
            //   ],
            // ),
            // ElevatedButton(
            //   onPressed: _addEvaluation,
            //   child: Text('Ajouter l\'évaluation'),
            // ),
            SizedBox(height: 24),

            // Liste des évaluations
            Text(
              'Évaluations existantes',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            ListView.builder(
              shrinkWrap: true,
              itemCount: evaluations.length,
              itemBuilder: (context, index) {
                final evaluation = evaluations[index];
                return Card(
                  color: blanc,
                  margin: const EdgeInsets.symmetric(vertical: 8.0),
                  child: ListTile(
                    title: Text(evaluation.indicatorName),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Date: ${formatDate(evaluation.evaluationDate)}'),
                        Text('Valeur: ${evaluation.value}'),
                        Text('Commentaire: ${evaluation.comment}'),
                      ],
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
