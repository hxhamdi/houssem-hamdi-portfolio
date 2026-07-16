import 'package:flutter/material.dart';
import 'package:portfolio_website/shared/responsive/responsive_layout.dart';
import 'package:portfolio_website/shared/animations/fade_in_animation.dart';
import 'package:portfolio_website/features/projects/project_card.dart';
import 'package:provider/provider.dart';
import 'package:portfolio_website/providers/portfolio_provider.dart';

class ProjectsPage extends StatelessWidget {
  const ProjectsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final portfolioProvider = Provider.of<PortfolioProvider>(context);
    final projects = portfolioProvider.projects;
    final theme = Theme.of(context);
    final isMobile = MediaQuery.of(context).size.width < 768;

    if (portfolioProvider.isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    return ResponsiveLayout(
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: isMobile ? 60 : 80,
            horizontal: 20,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FadeInAnimation(
                delay: 0.3,
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
                    width: isMobile ? double.infinity : 400,
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