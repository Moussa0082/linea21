import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:linea21/constants/constantes.dart';

class Project {
  final String name;
  final List<FlSpot> progressData;

  Project(this.name, this.progressData);
}

class VisualisationDataScreen extends StatefulWidget {
  const VisualisationDataScreen({super.key});

  @override
  State<VisualisationDataScreen> createState() => _VisualisationDataScreenState();
}

class _VisualisationDataScreenState extends State<VisualisationDataScreen> {
  List<Project> projects = [
    Project("Projet A", [FlSpot(0, 1), FlSpot(1, 3), FlSpot(2, 2), FlSpot(3, 4), FlSpot(4, 3)]),
    Project("Projet B", [FlSpot(0, 2), FlSpot(1, 2.5), FlSpot(2, 3.5), FlSpot(3, 3), FlSpot(4, 4)]),
    Project("Projet C", [FlSpot(0, 3), FlSpot(1, 4), FlSpot(2, 2), FlSpot(3, 2.5), FlSpot(4, 3.5)]),
  ];

  Project? selectedProject;

  @override
  void initState() {
    super.initState();
    selectedProject = projects[0]; // Default to the first project
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Tableau de bord des projets", style: TextStyle(color: Colors.white),),
        backgroundColor: gris,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Title
            const  Text(
                "Progrès des projets",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.black),
              ),
            const  SizedBox(height: 20),

              // Dropdown button for project selection
              DropdownButton<Project>(
                value: selectedProject,
                onChanged: (Project? newProject) {
                  setState(() {
                    selectedProject = newProject!;
                  });
                },
                items: projects.map((Project project) {
                  return DropdownMenuItem<Project>(
                    value: project,
                    child: Text(
                      project.name,
                      style: const TextStyle(fontSize: 18, color: Colors.black),
                    ),
                  );
                }).toList(),
                isExpanded: true, // Expand to fill available space
              ),

             const SizedBox(height: 30),

              // Bar chart for the selected project
              Container(
                height: MediaQuery.of(context).size.height * 0.5, // Adjust height dynamically
                padding: const EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(color: Colors.grey.withOpacity(0.3), blurRadius: 5, spreadRadius: 2),
                  ],
                ),
                child: BarChart(
                  BarChartData(
                    alignment: BarChartAlignment.spaceAround,
                    barGroups: selectedProject!.progressData
                        .map(
                          (spot) => BarChartGroupData(
                            x: spot.x.toInt(),
                            barRods: [
                              BarChartRodData(
                                toY: spot.y,
                                color: Colors.blue,
                                width: 16,
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ],
                          ),
                        )
                        .toList(),
                    borderData: FlBorderData(
                      show: true,
                      border: const Border.symmetric(
                        horizontal: BorderSide(color: Colors.grey, width: 1),
                        vertical: BorderSide(color: Colors.grey, width: 1),
                      ),
                    ),
                    titlesData: const FlTitlesData(
                      leftTitles: AxisTitles(
                        sideTitles: SideTitles(showTitles: true, reservedSize: 40),
                      ),
                      bottomTitles: AxisTitles(
                        sideTitles: SideTitles(showTitles: true, reservedSize: 40),
                      ),
                      rightTitles: AxisTitles(
                        sideTitles: SideTitles(showTitles: false),
                      ),
                      topTitles: AxisTitles(
                        sideTitles: SideTitles(showTitles: false),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
