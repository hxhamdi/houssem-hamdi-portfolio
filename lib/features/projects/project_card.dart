import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:portfolio_website/shared/animations/fade_in_animation.dart';
import 'package:portfolio_website/models/project_model.dart';

class ProjectCard extends StatelessWidget {
  final Project project;

  const ProjectCard({super.key, required this.project});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isMobile = MediaQuery.of(context).size.width < 768;

    return FadeInAnimation(
      delay: 0.3,
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: InkWell(
          borderRadius: BorderRadius.circular(12),
          onTap: () {
            if (project.url.isNotEmpty) {
              _launchURL(project.url);
            }
          },
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Project image
                Container(
                  height: isMobile ? 180 : 220,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    image: DecorationImage(
                      image: AssetImage(project.image),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(height: 16),

                // Project title
                Text(
                  project.title,
                  style: theme.textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),

                // Project description
                Text(
                  project.description,
                  style: theme.textTheme.bodyMedium?.copyWith(
                    height: 1.5,
                  ),
                ),
                const SizedBox(height: 12),

                // Tech stack chips
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: project.techStack.map((tech) => Chip(
                    label: Text(tech),
                    backgroundColor: theme.colorScheme.primary.withOpacity(0.1),
                    labelStyle: TextStyle(
                      color: theme.colorScheme.primary,
                      fontSize: 12,
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  )).toList(),
                ),
                const SizedBox(height: 16),

                // Key achievements
                if (project.details.isNotEmpty)
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Points clés :',
                        style: theme.textTheme.titleSmall?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      ...project.details.map((detail) => Padding(
                        padding: const EdgeInsets.only(bottom: 4),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text('• '),
                            Expanded(child: Text(detail)),
                          ],
                        ),
                      )),
                    ],
                  ),
                const SizedBox(height: 16),

                // Action buttons
                Row(
                  children: [
                    if (project.url.isNotEmpty)
                      ElevatedButton.icon(
                        onPressed: () => _launchURL(project.url),
                        icon: const Icon(Icons.code, size: 18),
                        label: const Text('Code'),
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 8,
                          ),
                        ),
                      ),
                    if (project.demoUrl.isNotEmpty) ...[
                      const SizedBox(width: 8),
                      OutlinedButton.icon(
                        onPressed: () => _launchURL(project.demoUrl),
                        icon: const Icon(Icons.open_in_new, size: 18),
                        label: const Text('Démo'),
                        style: OutlinedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 8,
                          ),
                        ),
                      ),
                    ],
                  ],
                ),
              ],
            ),
          ),
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