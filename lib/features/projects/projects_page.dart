import 'package:flutter/material.dart';
import 'package:portfolio_website/features/projects/project_card.dart';
import '../../shared/responsive/responsive_layout.dart';
import '../../shared/animations/fade_in_animation.dart';

class ProjectsPage extends StatelessWidget {
  const ProjectsPage({super.key});

  final List<Map<String, dynamic>> projects = const [
    {
      'title': 'Smart Parking App',
      'description':
          'Solution complète de parking intelligent couvrant le firmware embarqué (ESP32 / SIM7600) et l’application mobile Flutter.',
      'details': [
        'Affichage en temps réel de la disponibilité des places avec latence < 2 secondes',
        'Architecture Firebase (Firestore) + Google Cloud Functions',
        'Intégration ESP-CAM pour lecture de QR codes comme mécanisme d’authentification',
      ],
      'url': 'https://github.com/hxhamdi/ESP32-Camera-QR-Decode',
      'techStack': ['Flutter', 'ESP32', 'Firebase', 'C/C++'],
    },
    {
      'title': 'Système d’authentification vocale (ESP32)',
      'description':
          'Système d’authentification vocale de bout en bout intégrant ESP32, AssemblyAI, ThingSpeak et Firebase.',
      'details': [
        'Taux de reconnaissance correct > 90%',
        'Implémentation complète sous ESP-IDF / FreeRTOS',
        'Communication HTTP vers APIs cloud et retour visuel sur afficheur LCD 16x2',
      ],
      'url': 'https://github.com/hxhamdi/speech-auth',
      'techStack': ['ESP32', 'FreeRTOS', 'AssemblyAI', 'Firebase'],
    },
    {
      'title': 'Prédiction des précipitations en Australie',
      'description':
          'Pipeline ML complet pour la prédiction des précipitations à partir de 142,193 observations météorologiques.',
      'details': [
        'Prétraitement, sélection de variables et rééchantillonnage pour traiter le déséquilibre des classes',
        'Random Forest comme meilleur classificateur avec ROC-AUC de 0.80',
        'Rappel de 93% sur la classe majoritaire et 45% sur les jours de pluie',
      ],
      'url':
          'https://drive.google.com/file/d/1Tg2m_nWeunxjzOVvIv6D_lKAPd-I-wrp/view?usp=sharing',
      'techStack': ['Python', 'Scikit-learn', 'Pandas', 'Machine Learning'],
    },
    {
      'title': 'Plateforme éducative Erudaxis',
      'description':
          'Application multi-rôles desservant 4 profils utilisateurs distincts (étudiants, responsables, instructeurs, collaborateurs).',
      'details': [
        'Développement de fonctionnalités clés (suivi des présences, gestion des plannings)',
        'Résolution de problèmes UI/UX de navigation (Provider)',
        'Mises à jour temps réel pour l’accès aux documents',
        'Optimisation des performances réduisant le temps de chargement de ~30%',
      ],
      'url': '',
      'techStack': ['Flutter', 'Provider', 'Firebase'],
    },
    {
      'title': 'Système de pilotage d’enseignement à distance',
      'description':
          'Système full stack pour le pilotage temps réel d’un dispositif d’enseignement à distance.',
      'details': [
        'Backend Node.js avec Express et WebSockets',
        'Streaming vidéo via caméra serveur et FFmpeg',
        'Frontend migré de Handlebars.js vers Angular',
      ],
      'url': '',
      'techStack': ['Node.js', 'Angular', 'WebSockets', 'Express'],
    },
    {
      'title': 'Applications académiques Java',
      'description':
          'Projets académiques développés en Java avec JavaFX et Swing.',
      'details': [
        'Application de gestion des absences pour 300+ étudiants sur 100+ classes',
        'Jeu Puissance 4 multijoueur local avec interface graphique complète',
      ],
      'url': '',
      'techStack': ['Java', 'JavaFX', 'Swing'],
    },
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return ResponsiveLayout(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FadeInAnimation(
                delay: 0.3,
                child: Text(
                  'PROJETS',
                  style: theme.textTheme.displaySmall?.copyWith(
                    color: theme.colorScheme.primary,
                  ),
                ),
              ),
              const SizedBox(height: 30),
              Wrap(
                spacing: 20,
                runSpacing: 20,
                children: projects.map((project) {
                  return SizedBox(
                    width: 400,
                    child: ProjectCard(project: project),
                  );
                }).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
