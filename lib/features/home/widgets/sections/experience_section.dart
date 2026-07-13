import 'package:flutter/material.dart';
import 'package:portfolio_website/shared/responsive/responsive_layout.dart';
import 'package:portfolio_website/shared/animations/fade_in_animation.dart';

class ExperienceSection extends StatelessWidget {
  const ExperienceSection({super.key});

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
                'EXPÉRIENCE',
                style: theme.textTheme.displayMedium?.copyWith(
                  color: theme.colorScheme.primary,
                ),
              ),
            ),
            const SizedBox(height: 30),
            Text(
              'Voici mon parcours professionnel et académique qui démontre mon expertise en développement mobile, IoT et backend.',
              style: theme.textTheme.bodyLarge,
            ),
            const SizedBox(height: 40),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: experiences.length,
              itemBuilder: (context, index) {
                final exp = experiences[index];
                return FadeInAnimation(
                  delay: 0.3 + (index * 0.1),
                  child: TimelineTile(
                    company: exp['company'],
                    role: exp['title'],
                    period: exp['period'],
                    description: exp['description'],
                    details: exp['details'],
                    techStack: exp['techStack'],
                    url: exp['url'] ?? '',
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

class TimelineTile extends StatelessWidget {
  final String company;
  final String role;
  final String period;
  final String description;
  final List<String> details;
  final List<String> techStack;
  final String url;

  const TimelineTile({
    super.key,
    required this.company,
    required this.role,
    required this.period,
    required this.description,
    required this.details,
    required this.techStack,
    required this.url,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.only(bottom: 40),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Timeline dot and line
          Column(
            children: [
              Container(
                width: 16,
                height: 16,
                decoration: BoxDecoration(
                  color: theme.colorScheme.primary,
                  shape: BoxShape.circle,
                ),
              ),
              if (details.isNotEmpty)
                Container(
                  width: 2,
                  height: 60,
                  color: theme.colorScheme.primary.withOpacity(0.3),
                ),
            ],
          ),
          const SizedBox(width: 20),
          // Experience content
          Expanded(
            child: Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      role,
                      style: theme.textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      '$company • $period',
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: theme.colorScheme.primary,
                      ),
                    ),
                    const SizedBox(height: 8),
                    if (description.isNotEmpty)
                      Text(
                        description,
                        style: theme.textTheme.bodyLarge?.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    const SizedBox(height: 12),
                    // Details as bullet points
                    if (details.isNotEmpty)
                      ...details.map((detail) => Padding(
                            padding: const EdgeInsets.only(bottom: 8),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text('• '),
                                Expanded(child: Text(detail)),
                              ],
                            ),
                          )),
                    const SizedBox(height: 12),
                    // Tech stack chips
                    if (techStack.isNotEmpty)
                      Wrap(
                        spacing: 8,
                        runSpacing: 8,
                        children: techStack.map((tech) => Chip(
                          label: Text(tech),
                          backgroundColor: theme.colorScheme.primary.withOpacity(0.1),
                          labelStyle: TextStyle(
                            color: theme.colorScheme.primary,
                          ),
                        )).toList(),
                      ),
                    // GitHub link if available
                    if (url.isNotEmpty)
                      Padding(
                        padding: const EdgeInsets.only(top: 12),
                        child: TextButton.icon(
                          onPressed: () {
                            // Open URL
                          },
                          icon: const Icon(Icons.link),
                          label: const Text('Voir le projet'),
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}