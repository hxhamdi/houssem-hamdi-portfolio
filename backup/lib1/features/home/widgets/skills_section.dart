import 'package:flutter/material.dart';
import 'package:portfolio_website/shared/animations/fade_in_animation.dart';

class SkillsSection extends StatelessWidget {
  const SkillsSection({super.key});

  final List<Map<String, dynamic>> skills = const [
    {
      'category': 'Mobile',
      'skills':
          'Flutter / Dart (avancé), Dart state management (Provider, Riverpod)',
    },
    {
      'category': 'Embarqué / IoT',
      'skills': 'C/C++, ESP32, Arduino, FreeRTOS (ESP-IDF), SIM7600 (avancé)',
    },
    {
      'category': 'Backend',
      'skills':
          'Node.js (Express.js, Socket.io), REST API, WebSockets (intermédiaire)',
    },
    {
      'category': 'Cloud',
      'skills':
          'Firebase / GCP (avancé), Microsoft Azure (intermédiaire), AWS (notions)',
    },
    {
      'category': 'Données / ML',
      'skills':
          'Python (Scikit-learn, Pandas, NumPy), MongoDB, MySQL (intermédiaire)',
    },
    {
      'category': 'Frontend',
      'skills': 'Angular, HTML/CSS, JavaScript (intermédiaire)',
    },
    {
      'category': 'DevOps / Outils',
      'skills':
          'Docker, Linux, Git (intermédiaire), Java (Swing, JavaFX) (intermédiaire)',
    },
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return FadeInAnimation(
      delay: 0.5,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'COMPÉTENCES',
              style: theme.textTheme.displaySmall?.copyWith(
                color: theme.colorScheme.primary,
              ),
            ),
            const SizedBox(height: 30),
            Wrap(
              spacing: 30,
              runSpacing: 20,
              children: skills.map((skill) {
                return SizedBox(
                  width: 300,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        skill['category'],
                        style: theme.textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        skill['skills'],
                        style: theme.textTheme.bodyMedium,
                      ),
                    ],
                  ),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
