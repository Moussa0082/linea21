import 'package:flutter/material.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

class RapportPdfScreen extends StatefulWidget {

    final String? pdfPath;
   RapportPdfScreen({super.key, this.pdfPath});

  @override
  State<RapportPdfScreen> createState() => _RapportPdfScreenState();
}

class _RapportPdfScreenState extends State<RapportPdfScreen> {
 
  
  void _generatePdfReport(BuildContext context) async {
    final pdf = pw.Document();

    pdf.addPage(
      pw.Page(
        build: (pw.Context context) => pw.Column(
          children: [
            pw.Text("Rapport de Projet", style: pw.TextStyle(fontSize: 24, fontWeight: pw.FontWeight.bold)),
            pw.SizedBox(height: 16),
            pw.Text("Voici les détails du rapport de projet.", style: pw.TextStyle(fontSize: 18)),
            pw.SizedBox(height: 16),
            pw.Table.fromTextArray(
              context: context,
              data: <List<String>>[
                <String>['Étape', 'Statut', 'Progrès'],
                ['Phase 1', 'Complétée', '100%'],
                ['Phase 2', 'En cours', '50%'],
                ['Phase 3', 'À venir', '0%'],
              ],
            ),
          ],
        ),
      ),
    );

    // Display the PDF in a viewer
    await Printing.layoutPdf(
      onLayout: (PdfPageFormat format) async => pdf.save(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Rapport PDF"),
        backgroundColor: Colors.grey[800],
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () => _generatePdfReport(context),
          child: Text("Générer et afficher le rapport PDF"),
        ),
      ),
    );
  }

}