import 'package:flutter/material.dart';
import 'package:portfolio_website/models/experience_model.dart';
import 'package:portfolio_website/shared/animations/fade_in_animation.dart';
import 'package:provider/provider.dart';
import 'package:portfolio_website/providers/portfolio_provider.dart';

class ExperienceSection extends StatelessWidget {
  const ExperienceSection({super.key});

  @override
  Widget build(BuildContext context) {
    final portfolioProvider = Provider.of<PortfolioProvider>(context);
    final experience = portfolioProvider.experience;
    final theme = Theme.of(context);
    final isMobile = MediaQuery.of(context).size.width < 768;

    if (portfolioProvider.isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    // Separate work and education experience
    final workExperience = portfolioProvider.getExperienceByType('work');
    final educationExperience = portfolioProvider.getExperienceByType('education');

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
          if (isMobile)
            _buildMobileLayout(context, theme, workExperience, educationExperience)
          else
            _buildDesktopLayout(context, theme, workExperience, educationExperience),
        ],
      ),
    );
  }

  Widget _buildDesktopLayout(
    BuildContext context,
    ThemeData theme,
    List<Experience> workExperience,
    List<Experience> educationExperience,
  ) {
    return Column(
      children: [
        // Work Experience
        if (workExperience.isNotEmpty) ...[
          Text(
            'Expérience Professionnelle',
            style: theme.textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 20),
          ...workExperience.map((exp) => _buildExperienceCard(context, exp)),
          const SizedBox(height: 40),
        ],
        // Education
        if (educationExperience.isNotEmpty) ...[
          Text(
            'Formation',
            style: theme.textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 20),
          ...educationExperience.map((exp) => _buildExperienceCard(context, exp)),
        ],
      ],
    );
  }

  Widget _buildMobileLayout(
    BuildContext context,
    ThemeData theme,
    List<Experience> workExperience,
    List<Experience> educationExperience,
  ) {
    return Column(
      children: [
        // Work Experience
        if (workExperience.isNotEmpty) ...[
          Text(
            'Expérience Professionnelle',
            style: theme.textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 20),
          ...workExperience.map((exp) => _buildExperienceCard(context, exp)),
          const SizedBox(height: 30),
        ],
        // Education
        if (educationExperience.isNotEmpty) ...[
          Text(
            'Formation',
            style: theme.textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 20),
          ...educationExperience.map((exp) => _buildExperienceCard(context, exp)),
        ],
      ],
    );
  }

  Widget _buildExperienceCard(BuildContext context, Experience exp) {
    final theme = Theme.of(context);
    return FadeInAnimation(
      delay: 0.3,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 30),
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
                if (exp.details.isNotEmpty)
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
                        exp.role,
                        style: theme.textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        '${exp.company} • ${exp.period}',
                        style: theme.textTheme.bodyMedium?.copyWith(
                          color: theme.colorScheme.primary,
                        ),
                      ),
                      const SizedBox(height: 8),
                      if (exp.description.isNotEmpty)
                        Text(
                          exp.description,
                          style: theme.textTheme.bodyLarge?.copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      const SizedBox(height: 12),
                      // Details as bullet points
                      if (exp.details.isNotEmpty)
                        ...exp.details.map((detail) => Padding(
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
                      if (exp.techStack.isNotEmpty)
                        Wrap(
                          spacing: 8,
                          runSpacing: 8,
                          children: exp.techStack.map((tech) => Chip(
                            label: Text(tech),
                            backgroundColor: theme.colorScheme.primary.withOpacity(0.1),
                            labelStyle: TextStyle(
                              color: theme.colorScheme.primary,
                            ),
                          )).toList(),
                        ),
                      // GitHub link if available
                      if (exp.url.isNotEmpty)
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
      ),
    );
  }
}