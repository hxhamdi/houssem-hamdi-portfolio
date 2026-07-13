import 'package:flutter/material.dart';
import 'package:portfolio_website/shared/animations/fade_in_animation.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SkillsSection extends StatelessWidget {
  const SkillsSection({super.key});

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
              'COMPÉTENCES',
              style: theme.textTheme.displayMedium?.copyWith(
                color: theme.colorScheme.primary,
              ),
            ),
          ),
          const SizedBox(height: 30),
          Text(
            'Voici les technologies avec lesquelles je travaille régulièrement :',
            style: theme.textTheme.bodyLarge,
          ),
          const SizedBox(height: 40),
          if (isMobile)
            _buildMobileLayout(context, theme)
          else
            _buildDesktopLayout(context, theme),
        ],
      ),
    );
  }

  Widget _buildDesktopLayout(BuildContext context, ThemeData theme) {
    return Wrap(
      spacing: 40,
      runSpacing: 40,
      alignment: WrapAlignment.spaceBetween,
      children: [
        _buildSkillCategory(context, 'Mobile', [
          {'name': 'Flutter', 'icon': FontAwesomeIcons.mobileScreenButton},
          {'name': 'Dart', 'icon': FontAwesomeIcons.code},
          {'name': 'Riverpod', 'icon': FontAwesomeIcons.gear},
          {'name': 'Provider', 'icon': FontAwesomeIcons.gears},
        ]),
        _buildSkillCategory(context, 'Embedded / IoT', [
          {'name': 'ESP32', 'icon': FontAwesomeIcons.microchip},
          {'name': 'ESP-IDF', 'icon': FontAwesomeIcons.server},
          {'name': 'FreeRTOS', 'icon': FontAwesomeIcons.listCheck},
          {'name': 'Arduino', 'icon': FontAwesomeIcons.microchip},
          {'name': 'SIM7600', 'icon': FontAwesomeIcons.simCard},
        ]),
        _buildSkillCategory(context, 'Backend', [
          {'name': 'Node.js', 'icon': FontAwesomeIcons.nodeJs},
          {'name': 'Express', 'icon': FontAwesomeIcons.server},
          {'name': 'REST APIs', 'icon': FontAwesomeIcons.cloud},
          {'name': 'WebSockets', 'icon': FontAwesomeIcons.networkWired},
          {'name': 'Socket.io', 'icon': FontAwesomeIcons.plug},
        ]),
        _buildSkillCategory(context, 'Cloud', [
          {'name': 'Firebase', 'icon': FontAwesomeIcons.google},
          {'name': 'Firestore', 'icon': FontAwesomeIcons.database},
          {'name': 'Cloud Functions', 'icon': FontAwesomeIcons.cloud},
          {'name': 'GCP', 'icon': FontAwesomeIcons.google},
          {'name': 'Azure', 'icon': FontAwesomeIcons.microsoft},
          {'name': 'AWS', 'icon': FontAwesomeIcons.aws},
        ]),
        _buildSkillCategory(context, 'Tools', [
          {'name': 'Git', 'icon': FontAwesomeIcons.gitAlt},
          {'name': 'Docker', 'icon': FontAwesomeIcons.docker},
          {'name': 'Linux', 'icon': FontAwesomeIcons.linux},
          {'name': 'Postman', 'icon': FontAwesomeIcons.screwdriverWrench},
        ]),
      ],
    );
  }

  Widget _buildMobileLayout(BuildContext context, ThemeData theme) {
    return Column(
      children: [
        _buildSkillCategory(context, 'Mobile', [
          {'name': 'Flutter', 'icon': FontAwesomeIcons.mobileScreenButton},
          {'name': 'Dart', 'icon': FontAwesomeIcons.code},
          {'name': 'Riverpod', 'icon': FontAwesomeIcons.gear},
          {'name': 'Provider', 'icon': FontAwesomeIcons.gears},
        ]),
        const SizedBox(height: 30),
        _buildSkillCategory(context, 'Embedded / IoT', [
          {'name': 'ESP32', 'icon': FontAwesomeIcons.microchip},
          {'name': 'ESP-IDF', 'icon': FontAwesomeIcons.server},
          {'name': 'FreeRTOS', 'icon': FontAwesomeIcons.listCheck},
          {'name': 'Arduino', 'icon': FontAwesomeIcons.microchip},
          {'name': 'SIM7600', 'icon': FontAwesomeIcons.simCard},
        ]),
        const SizedBox(height: 30),
        _buildSkillCategory(context, 'Backend', [
          {'name': 'Node.js', 'icon': FontAwesomeIcons.nodeJs},
          {'name': 'Express', 'icon': FontAwesomeIcons.server},
          {'name': 'REST APIs', 'icon': FontAwesomeIcons.cloud},
          {'name': 'WebSockets', 'icon': FontAwesomeIcons.networkWired},
          {'name': 'Socket.io', 'icon': FontAwesomeIcons.plug},
        ]),
        const SizedBox(height: 30),
        _buildSkillCategory(context, 'Cloud', [
          {'name': 'Firebase', 'icon': FontAwesomeIcons.google},
          {'name': 'Firestore', 'icon': FontAwesomeIcons.database},
          {'name': 'Cloud Functions', 'icon': FontAwesomeIcons.cloud},
          {'name': 'GCP', 'icon': FontAwesomeIcons.google},
          {'name': 'Azure', 'icon': FontAwesomeIcons.microsoft},
          {'name': 'AWS', 'icon': FontAwesomeIcons.aws},
        ]),
        const SizedBox(height: 30),
        _buildSkillCategory(context, 'Tools', [
          {'name': 'Git', 'icon': FontAwesomeIcons.gitAlt},
          {'name': 'Docker', 'icon': FontAwesomeIcons.docker},
          {'name': 'Linux', 'icon': FontAwesomeIcons.linux},
          {'name': 'Postman', 'icon': FontAwesomeIcons.screwdriverWrench},
        ]),
      ],
    );
  }

  Widget _buildSkillCategory(BuildContext context, String category, List<Map<String, dynamic>> skills) {
    final theme = Theme.of(context);

    return FadeInAnimation(
      delay: 0.3,
      child: SizedBox(
        width: 300,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              category,
              style: theme.textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            ...skills.map((skill) => Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: Row(
                children: [
                  FaIcon(
                    skill['icon'],
                    size: 20,
                    color: theme.colorScheme.primary,
                  ),
                  const SizedBox(width: 12),
                  Text(skill['name']),
                ],
              ),
            )),
          ],
        ),
      ),
    );
  }
}