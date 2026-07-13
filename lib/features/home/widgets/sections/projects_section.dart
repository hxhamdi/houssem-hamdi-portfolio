import 'package:flutter/material.dart';
import 'package:portfolio_website/shared/responsive/responsive_layout.dart';
import 'package:portfolio_website/shared/animations/fade_in_animation.dart';
import 'package:portfolio_website/features/projects/project_card.dart';
import 'package:portfolio_website/core/constants/app_constants.dart';

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({super.key});

  final List<Map<String, dynamic>> projects = const [
    {
      'title': 'Smart Parking App',
      'description': 'Solution complète de parking intelligent couvrant le firmware embarqué (ESP32 / SIM7600) et l’application mobile Flutter.',
      'details': [
        'Affichage en temps réel de la disponibilité des places avec latence < 2 secondes',
        'Architecture Firebase (Firestore) + Google Cloud Functions',
        'Intégration ESP-CAM pour lecture de QR codes comme mécanisme d’authentification',
      ],
      'url': 'https://github.com/hxhamdi/ESP32-Camera-QR-Decode',
      'techStack': ['Flutter', 'ESP32', 'Firebase', 'C/C++'],
      'image': 'assets/images/smart_parking.jpg',
    },
    {
      'title': 'Système d’authentification vocale (ESP32)',
      'description': 'Système d’authentification vocale de bout en bout intégrant ESP32, AssemblyAI, ThingSpeak et Firebase.',
      'details': [
        'Taux de reconnaissance correct > 90%',
        'Implémentation complète sous ESP-IDF / FreeRTOS',
        'Communication HTTP vers APIs cloud et retour visuel sur afficheur LCD 16x2',
      ],
      'url': 'https://github.com/hxhamdi/speech-auth',
      'techStack': ['ESP32', 'FreeRTOS', 'AssemblyAI', 'Firebase'],
      'image': 'assets/images/voice_auth.jpg',
    },
    {
      'title': 'Prédiction des précipitations en Australie',
      'description': 'Pipeline ML complet pour la prédiction des précipitations à partir de 142,193 observations météorologiques.',
      'details': [
        'Prétraitement, sélection de variables et rééchantillonnage pour traiter le déséquilibre des classes',
        'Random Forest comme meilleur classificateur avec ROC-AUC de 0.80',
        'Rappel de 93% sur la classe majoritaire et 45% sur les jours de pluie',
      ],
      'url': 'https://drive.google.com/file/d/1Tg2m_nWeunxjzOVvIv6D_lKAPd-I-wrp/view?usp=sharing',
      'techStack': ['Python', 'Scikit-learn', 'Pandas', 'Machine Learning'],
      'image': 'assets/images/rain_prediction.jpg',
    },
    {
      'title': 'Plateforme éducative Erudaxis',
      'description': 'Application multi-rôles desservant 4 profils utilisateurs distincts (étudiants, responsables, instructeurs, collaborateurs).',
      'details': [
        'Développement de fonctionnalités clés (suivi des présences, gestion des plannings)',
        'Résolution de problèmes UI/UX de navigation (Provider)',
        'Mises à jour temps réel pour l’accès aux documents',
        'Optimisation des performances réduisant le temps de chargement de ~30%',
      ],
      'url': '',
      'techStack': ['Flutter', 'Provider', 'Firebase'],
      'image': 'assets/images/education_platform.jpg',
    },
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return ResponsiveLayout(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FadeInAnimation(
              delay: 0.2,
              child: Text(
                'PROJETS',
                style: theme.textTheme.displayMedium?.copyWith(
                  color: theme.colorScheme.primary,
                ),
              ),
            ),
            const SizedBox(height: 30),
            Text(
              'Voici quelques-uns de mes projets récents qui démontrent mes compétences en Flutter, IoT et développement backend.',
              style: theme.textTheme.bodyLarge,
            ),
            const SizedBox(height: 40),
            Wrap(
              spacing: 20,
              runSpacing: 20,
              alignment: WrapAlignment.center,
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
    );
  }
}