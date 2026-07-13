import 'package:flutter/material.dart';
import 'package:portfolio_website/core/constants/app_constants.dart';
import 'package:portfolio_website/shared/animations/fade_in_animation.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isMobile = MediaQuery.of(context).size.width < 768;

    return Container(
      padding: EdgeInsets.symmetric(
        vertical: isMobile ? 60 : 80,
        horizontal: 20,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FadeInAnimation(
            delay: 0.2,
            child: Text(
              'À PROPOS',
              style: theme.textTheme.displayMedium?.copyWith(
                color: theme.colorScheme.primary,
              ),
            ),
          ),
          const SizedBox(height: 30),
          if (isMobile)
            _buildMobileContent(context, theme)
          else
            _buildDesktopContent(context, theme),
        ],
      ),
    );
  }

  Widget _buildDesktopContent(BuildContext context, ThemeData theme) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Left column - about text
        Expanded(
          flex: 3,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FadeInAnimation(
                delay: 0.3,
                child: Text(
                  'Développeur Flutter passionné avec une expertise en IoT embarqué et développement backend.',
                  style: theme.textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              FadeInAnimation(
                delay: 0.4,
                child: Text(
                  'Titulaire d’un Mastère de recherche en systèmes intelligents et IoT (Bac+5), j’ai plus de 2 ans d’expérience dans le développement d’applications mobiles multiplateformes avec Flutter, ainsi qu’une expertise en développement embarqué (ESP32, FreeRTOS) et backend (Node.js, Firebase).',
                  style: theme.textTheme.bodyLarge?.copyWith(
                    height: 1.6,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              FadeInAnimation(
                delay: 0.5,
                child: Text(
                  'Mon approche combine une architecture propre, un code maintenable et une attention particulière à l’expérience utilisateur. Je suis particulièrement intéressé par les projets qui allient Flutter, IoT et cloud computing.',
                  style: theme.textTheme.bodyLarge?.copyWith(
                    height: 1.6,
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(width: 40),
        // Right column - skills preview
        Expanded(
          flex: 2,
          child: FadeInAnimation(
            delay: 0.6,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Compétences clés',
                  style: theme.textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16),
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: [
                    _buildSkillChip(context, 'Flutter'),
                    _buildSkillChip(context, 'Dart'),
                    _buildSkillChip(context, 'ESP32'),
                    _buildSkillChip(context, 'Firebase'),
                    _buildSkillChip(context, 'Node.js'),
                    _buildSkillChip(context, 'IoT'),
                    _buildSkillChip(context, 'REST APIs'),
                    _buildSkillChip(context, 'Clean Architecture'),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildMobileContent(BuildContext context, ThemeData theme) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FadeInAnimation(
          delay: 0.3,
          child: Text(
            'Développeur Flutter passionné avec une expertise en IoT embarqué et développement backend.',
            style: theme.textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(height: 20),
        FadeInAnimation(
          delay: 0.4,
          child: Text(
            'Titulaire d’un Mastère de recherche en systèmes intelligents et IoT (Bac+5), j’ai plus de 2 ans d’expérience dans le développement d’applications mobiles multiplateformes avec Flutter, ainsi qu’une expertise en développement embarqué (ESP32, FreeRTOS) et backend (Node.js, Firebase).',
            style: theme.textTheme.bodyLarge?.copyWith(
              height: 1.6,
            ),
          ),
        ),
        const SizedBox(height: 20),
        FadeInAnimation(
          delay: 0.5,
          child: Text(
            'Mon approche combine une architecture propre, un code maintenable et une attention particulière à l’expérience utilisateur. Je suis particulièrement intéressé par les projets qui allient Flutter, IoT et cloud computing.',
            style: theme.textTheme.bodyLarge?.copyWith(
              height: 1.6,
            ),
          ),
        ),
        const SizedBox(height: 30),
        FadeInAnimation(
          delay: 0.6,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Compétences clés',
                style: theme.textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: [
                  _buildSkillChip(context, 'Flutter'),
                  _buildSkillChip(context, 'Dart'),
                  _buildSkillChip(context, 'ESP32'),
                  _buildSkillChip(context, 'Firebase'),
                  _buildSkillChip(context, 'Node.js'),
                  _buildSkillChip(context, 'IoT'),
                  _buildSkillChip(context, 'REST APIs'),
                  _buildSkillChip(context, 'Clean Architecture'),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildSkillChip(BuildContext context, String skill) {
    final theme = Theme.of(context);
    return Chip(
      label: Text(skill),
      backgroundColor: theme.colorScheme.primary.withValues(alpha: 0.1),
      labelStyle: TextStyle(
        color: theme.colorScheme.primary,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
    );
  }
}