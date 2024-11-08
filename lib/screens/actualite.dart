import 'package:flutter/material.dart';
import 'package:linea21/constants/constantes.dart';
import 'package:shimmer/shimmer.dart'; // Assurez-vous d'importer le package shimmer

class ActualiteScreen extends StatefulWidget {
  const ActualiteScreen({super.key});

  @override
  State<ActualiteScreen> createState() => _ActualiteScreenState();
}

class _ActualiteScreenState extends State<ActualiteScreen> {
  bool isLoading = true;

  // Liste d'actualités simulées avec la date ajoutée
  List<Map<String, dynamic>> actualites = [
    {
      'title': 'Nouvelle technologie dans l\'IA',
      'image': 'assets/images/images2.jpeg',
      'description': 'Une avancée majeure dans l\'intelligence artificielle...',
      'date': '2024-11-06',
    },
    {
      'title': 'Découverte scientifique',
      'image': 'assets/images/images2.jpeg',
      'description': 'Les scientifiques ont récemment découvert...',
      'date': '2024-11-05',
    },
    {
      'title': 'Événement sportif international',
      'image': 'assets/images/images1.jpeg',
      'description': 'Le tournoi mondial commence...',
      'date': '2024-11-04',
    },
      {
      'title': 'Nouvelle technologie dans l\'IA',
      'image': 'assets/images/images1.jpeg',
      'description': 'Une avancée majeure dans l\'intelligence artificielle...',
      'date': '2024-11-06',
    },
     {
      'title': 'Événement sportif international',
      'image': 'assets/images/images1.jpeg',
      'description': 'Le tournoi mondial commence...',
      'date': '2024-11-04',
    },

  ];

  @override
  void initState() {
    super.initState();
    // Simuler un chargement de 3 secondes avec l'effet shimmer
    Future.delayed(const Duration(seconds: 3), () {
      setState(() {
        isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Actualités', style: TextStyle(color: blanc),),
        backgroundColor: gris,
      ),
      body: isLoading
          ? _buildShimmerEffect() // Affiche l'effet shimmer si en cours de chargement
          : _buildActualitesList(), // Sinon affiche la liste d'actualités
    );
  }

  Widget _buildShimmerEffect() {
    return ListView.builder(
      itemCount: 8,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Shimmer.fromColors(
                baseColor: Colors.grey[300]!,
                highlightColor: Colors.grey[100]!,
                child: Container(
                  width: 100,
                  height: 100,
                  color: Colors.white,
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Shimmer.fromColors(
                      baseColor: Colors.grey[300]!,
                      highlightColor: Colors.grey[100]!,
                      child: Container(
                        width: double.infinity,
                        height: 20,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Shimmer.fromColors(
                      baseColor: Colors.grey[300]!,
                      highlightColor: Colors.grey[100]!,
                      child: Container(
                        width: 150,
                        height: 14,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Shimmer.fromColors(
                      baseColor: Colors.grey[300]!,
                      highlightColor: Colors.grey[100]!,
                      child: Container(
                        width: double.infinity,
                        height: 14,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

 Widget _buildActualitesList() {
  return ListView.builder(
    itemCount: actualites.length,
    itemBuilder: (context, index) {
      final actualite = actualites[index];
      return Column(
        children: [
          GestureDetector(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DetailActualiteScreen(
                  title: actualite['title'],
                  image: actualite['image'],
                  description: actualite['description'],
                  date: actualite['date'],
                ),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(2.0),
              child: Card(
                color: Colors.transparent, // Rend la carte transparente
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                elevation: 0, // Supprime l'ombre pour renforcer l'effet de transparence
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        children: [
                          Image.asset(
                            actualite['image'],
                            width: 100,
                            height: 80,
                            fit: BoxFit.cover,
                          ),
                          const SizedBox(height: 5),
                          Text(
                            'Date: ${actualite['date']}',
                            style: const TextStyle(
                              fontSize: 13,
                              color: Colors.black87,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              actualite['title'],
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.black87,
                              ),
                            ),
                            const SizedBox(height: 5),
                            Text(
                              actualite['description'],
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                fontSize: 14,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          const Divider(
            color: gris,
            indent: 15,
            endIndent: 15,
          ), // Séparateur entre les cartes
        ],
      );
    },
  );
}

}

class DetailActualiteScreen extends StatelessWidget {
  final String title;
  final String image;
  final String description;
  final String date;

  const DetailActualiteScreen({
    super.key,
    required this.title,
    required this.image,
    required this.description,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Détail de l\'actualité', style: TextStyle(color: blanc),),
        backgroundColor: gris,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(image, width: double.infinity, fit: BoxFit.cover),
            const SizedBox(height: 10),
            Text(
              title,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              'Publié le $date',
              style: const TextStyle(
                fontSize: 14,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              description,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.black87,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
