import 'package:flutter/material.dart';
import '../../shared/responsive/responsive_layout.dart';
import '../../shared/animations/fade_in_animation.dart';
import 'package:url_launcher/url_launcher.dart';

class ExperiencePage extends StatelessWidget {
  const ExperiencePage({super.key});

  final List<Map<String, dynamic>> experiences = const [
    {
      'title': 'Stagiaire Développeur Flutter',
      'company': 'ProServices Training Company',
      'period': '03/2026 - Présent',
      'description': 'Plateforme éducative Erudaxis',
      'details': [
        'Développement de fonctionnalités clés (suivi des présences, gestion des plannings) pour une application multi-rôles desservant 4 profils utilisateurs',
        'Résolution de problèmes UI/UX de navigation (Provider) éliminant les crashs de navigation',
        'Mise en place de mises à jour temps réel pour l’accès aux documents',
        'Optimisation des performances réduisant le temps de chargement des listes de ~30%',
      ],
      'techStack': ['Flutter', 'Provider'],
    },
    {
      'title': 'Développeur Flutter & Embarqué',
      'company': 'Projet freelance',
      'period': '03/2025 - 02/2026',
      'description': 'Smart Parking App',
      'details': [
        'Conception et développement complet d’une solution de parking intelligent couvrant le firmware embarqué (ESP32 / SIM7600) et l’application mobile Flutter',
        'Affichage en temps réel de la disponibilité des places avec latence < 2 secondes',
        'Architecture Firebase (Firestore) + Google Cloud Functions pour plusieurs capteurs simultanés',
        'Intégration ESP-CAM pour la lecture de QR codes comme mécanisme d’authentification',
      ],
      'techStack': ['Flutter', 'ESP32', 'Firebase', 'C/C++'],
      'url': 'https://github.com/hxhamdi/ESP32-Camera-QR-Decode',
    },
    {
      'title': 'Développeur Embarqué',
      'company': 'Projet personnel',
      'period': '09/2024 - 01/2025',
      'description': 'Système d’authentification vocale (ESP32)',
      'details': [
        'Développement d’un système d’authentification vocale de bout en bout avec taux de reconnaissance > 90%',
        'Implémentation complète sous ESP-IDF / FreeRTOS : gestion Wi-Fi, pipeline microphone KY-038',
        'Communication HTTP vers APIs cloud et retour visuel sur afficheur LCD 16x2',
      ],
      'techStack': ['ESP32', 'FreeRTOS', 'AssemblyAI', 'Firebase'],
      'url': 'https://github.com/hxhamdi/speech-auth',
    },
    {
      'title': 'Veille technologique & autoformation',
      'company': 'Période d’autoformation',
      'period': '02/2024 - 03/2025',
      'description': 'Flutter avancé et IoT',
      'details': [
        'Approfondissement de Flutter (state management avancé, Provider, Riverpod)',
        'Exploration de l’écosystème ESP32 / FreeRTOS',
        'Expérimentation pratique de composants électroniques (LCD, capteurs, modules caméra)',
        'Certifications Microsoft Azure Fundamentals et Azure AI Fundamentals',
      ],
      'techStack': ['Flutter', 'ESP32', 'Azure'],
    },
    {
      'title': 'Prédiction des précipitations en Australie',
      'company': 'Projet académique collaboratif',
      'period': '11/2022 - 12/2022',
      'description': '',
      'details': [
        'Construction d’un pipeline ML complet pour la prédiction des précipitations à partir de 142,193 observations',
        'Prétraitement, sélection de variables et rééchantillonnage pour traiter le déséquilibre des classes',
        'Random Forest comme meilleur classificateur avec ROC-AUC de 0.80',
      ],
      'techStack': ['Python', 'Scikit-learn', 'Pandas'],
      'url':
          'https://drive.google.com/file/d/1Tg2m_nWeunxjzOVvIv6D_lKAPd-I-wrp/view?usp=sharing',
    },
    {
      'title': 'Stagiaire Développeur Full Stack',
      'company': 'Consord',
      'period': '02/2021 - 06/2021',
      'description': 'Système de pilotage d’enseignement à distance',
      'details': [
        'Architecture backend Node.js avec Express et WebSockets',
        'Streaming vidéo via caméra serveur et FFmpeg',
        'Prototypage hardware progressif : LEDs sur breadboard puis robot voiture',
        'Migration frontend de Handlebars.js vers Angular',
      ],
      'techStack': ['Node.js', 'Angular', 'WebSockets', 'Express'],
    },
    {
      'title': 'Projets académiques Java',
      'company': 'Faculté des sciences de Tunis',
      'period': '09/2018 - 06/2021',
      'description': '',
      'details': [
        'Application de gestion des absences pour 300+ étudiants sur 100+ classes',
        'Jeu Puissance 4 multijoueur local avec interface graphique complète',
      ],
      'techStack': ['Java', 'JavaFX', 'Swing'],
    },
  ];

  final List<Map<String, dynamic>> education = const [
    {
      'degree': 'Mastère de recherche en systèmes intelligents et IoT',
      'institution': 'Faculté des sciences de Tunis',
      'period': '09/2021 - 01/2024',
      'details':
          'Mémoire : Application du Machine Learning au Model Checking pour améliorer les performances des algorithmes de vérification formelle',
    },
    {
      'degree': 'Licence fondamentale en sciences de l’informatique',
      'institution': 'Faculté des sciences de Tunis',
      'period': '09/2018 - 06/2021',
      'details': '',
    },
    {
      'degree': 'Baccalauréat en sciences techniques',
      'institution': 'Lycée Beb Elkhadhra',
      'period': '09/2017 - 06/2018',
      'details': '',
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
              // Experience Section
              FadeInAnimation(
                delay: 0.3,
                child: Text(
                  'EXPÉRIENCE',
                  style: theme.textTheme.displaySmall?.copyWith(
                    color: theme.colorScheme.primary,
                  ),
                ),
              ),
              const SizedBox(height: 30),
              ...experiences.map((exp) => _buildExperienceItem(context, exp)),

              const SizedBox(height: 60),

              // Education Section
              FadeInAnimation(
                delay: 0.5,
                child: Text(
                  'ÉDUCATION',
                  style: theme.textTheme.displaySmall?.copyWith(
                    color: theme.colorScheme.primary,
                  ),
                ),
              ),
              const SizedBox(height: 30),
              ...education.map((edu) => _buildEducationItem(context, edu)),

              const SizedBox(height: 60),

              // Certifications Section
              FadeInAnimation(
                delay: 0.7,
                child: Text(
                  'CERTIFICATIONS',
                  style: theme.textTheme.displaySmall?.copyWith(
                    color: theme.colorScheme.primary,
                  ),
                ),
              ),
              const SizedBox(height: 30),
              _buildCertificationItem(
                context,
                'Microsoft Certified: Azure AI Fundamentals',
                '08/2024',
                'https://www.credly.com/go/jtnKftOhsl8RpgTLFgYZ9w',
              ),
              const SizedBox(height: 15),
              _buildCertificationItem(
                context,
                'Microsoft Certified: Azure Fundamentals',
                '06/2024',
                'https://www.credly.com/badges/4c049e6e-75ed-4c6d-a739-bb3e10a4c768/linked_in?t=sfc28d',
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildExperienceItem(BuildContext context, Map<String, dynamic> exp) {
    final theme = Theme.of(context);

    return FadeInAnimation(
      delay: 0.4,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    exp['title'],
                    style: theme.textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Text(
                  exp['period'],
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: theme.colorScheme.primary,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 5),
            Text(
              '${exp['company']}${exp['description'].isNotEmpty ? ' - ${exp['description']}' : ''}',
              style: theme.textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 10),
            ...exp['details'].map<Widget>((detail) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 5),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('• '),
                    Expanded(child: Text(detail)),
                  ],
                ),
              );
            }).toList(),
            const SizedBox(height: 10),
            Wrap(
              spacing: 8,
              children: exp['techStack'].map<Widget>((tech) {
                return Chip(
                  label: Text(tech),
                  backgroundColor: theme.colorScheme.primary.withOpacity(0.1),
                  labelStyle: TextStyle(
                    color: theme.colorScheme.primary,
                    fontSize: 12,
                  ),
                );
              }).toList(),
            ),
            if (exp['url'] != null && exp['url'].isNotEmpty)
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: GestureDetector(
                  onTap: () => _launchURL(exp['url']),
                  child: Text(
                    'Voir le projet',
                    style: TextStyle(
                      color: theme.colorScheme.primary,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildEducationItem(BuildContext context, Map<String, dynamic> edu) {
    final theme = Theme.of(context);

    return FadeInAnimation(
      delay: 0.6,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              edu['degree'],
              style: theme.textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  edu['institution'],
                  style: theme.textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  edu['period'],
                  style: theme.textTheme.bodyMedium,
                ),
              ],
            ),
            if (edu['details'].isNotEmpty) ...[
              const SizedBox(height: 8),
              Text(
                edu['details'],
                style: theme.textTheme.bodyMedium,
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildCertificationItem(
      BuildContext context, String title, String date, String url) {
    final theme = Theme.of(context);

    return FadeInAnimation(
      delay: 0.8,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 15),
        child: Row(
          children: [
            Expanded(
              child: GestureDetector(
                onTap: () => _launchURL(url),
                child: Text(
                  title,
                  style: TextStyle(
                    color: theme.colorScheme.primary,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ),
            Text(
              date,
              style: theme.textTheme.bodyMedium,
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _launchURL(String url) async {
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    }
  }
}
