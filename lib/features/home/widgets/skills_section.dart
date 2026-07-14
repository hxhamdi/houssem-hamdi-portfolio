import 'package:flutter/material.dart';
import 'package:portfolio_website/models/skill_model.dart';
import 'package:portfolio_website/shared/animations/fade_in_animation.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:portfolio_website/providers/portfolio_provider.dart';

class SkillsSection extends StatelessWidget {
  const SkillsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final portfolioProvider = Provider.of<PortfolioProvider>(context);
    final skills = portfolioProvider.skills;
    final isMobile = MediaQuery.of(context).size.width < 768;
    final theme = Theme.of(context);

    if (portfolioProvider.isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    // Group skills by category
    final Map<String, List<Skill>> skillsByCategory = {};
    for (var skill in skills) {
      if (!skillsByCategory.containsKey(skill.category)) {
        skillsByCategory[skill.category] = [];
      }
      skillsByCategory[skill.category]!.add(skill);
    }

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
            _buildMobileLayout(context, theme, skillsByCategory)
          else
            _buildDesktopLayout(context, theme, skillsByCategory),
        ],
      ),
    );
  }

  Widget _buildDesktopLayout(
    BuildContext context,
    ThemeData theme,
    Map<String, List<Skill>> skillsByCategory,
  ) {
    return Wrap(
      spacing: 40,
      runSpacing: 40,
      alignment: WrapAlignment.spaceBetween,
      children: skillsByCategory.entries.map((entry) {
        return SizedBox(
          width: 300,
          child: _buildSkillCategory(context, entry.key, entry.value),
        );
      }).toList(),
    );
  }

  Widget _buildMobileLayout(
    BuildContext context,
    ThemeData theme,
    Map<String, List<Skill>> skillsByCategory,
  ) {
    return Column(
      children: skillsByCategory.entries.map((entry) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 30),
          child: _buildSkillCategory(context, entry.key, entry.value),
        );
      }).toList(),
    );
  }

  Widget _buildSkillCategory(
    BuildContext context,
    String category,
    List<Skill> skills,
  ) {
    final theme = Theme.of(context);

    return FadeInAnimation(
      delay: 0.3,
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
                  _getIconFromName(skill.icon),
                  size: 20,
                  color: theme.colorScheme.primary,
                ),
                const SizedBox(width: 12),
                Text(skill.name),
              ],
            ),
          )),
        ],
      ),
    );
  }

  IconData _getIconFromName(String iconName) {
    switch (iconName) {
      case 'mobileScreenButton': return FontAwesomeIcons.mobileScreenButton;
      case 'code': return FontAwesomeIcons.code;
      case 'gear': return FontAwesomeIcons.gear;
      case 'gears': return FontAwesomeIcons.gears;
      case 'microchip': return FontAwesomeIcons.microchip;
      case 'server': return FontAwesomeIcons.server;
      case 'listCheck': return FontAwesomeIcons.listCheck;
      case 'simCard': return FontAwesomeIcons.simCard;
      case 'nodeJs': return FontAwesomeIcons.nodeJs;
      case 'cloud': return FontAwesomeIcons.cloud;
      case 'networkWired': return FontAwesomeIcons.networkWired;
      case 'plug': return FontAwesomeIcons.plug;
      case 'google': return FontAwesomeIcons.google;
      case 'database': return FontAwesomeIcons.database;
      case 'microsoft': return FontAwesomeIcons.microsoft;
      case 'aws': return FontAwesomeIcons.aws;
      case 'gitAlt': return FontAwesomeIcons.gitAlt;
      case 'docker': return FontAwesomeIcons.docker;
      case 'linux': return FontAwesomeIcons.linux;
      case 'screwdriverWrench': return FontAwesomeIcons.screwdriverWrench;
      default: return FontAwesomeIcons.circle;
    }
  }
}