import 'package:flutter/material.dart';
import 'package:portfolio_website/core/constants/app_constants.dart';
import 'package:portfolio_website/shared/animations/fade_in_animation.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:url_launcher/url_launcher.dart';

class HeroSection extends StatelessWidget {
  final Function(int) onScrollToSection;

  const HeroSection({super.key, required this.onScrollToSection});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isMobile = MediaQuery.of(context).size.width < 768;

    return Container(
      padding: EdgeInsets.symmetric(
        vertical: isMobile ? 60 : 100,
        horizontal: 20,
      ),
      child: isMobile
          ? _buildMobileLayout(context, theme)
          : _buildDesktopLayout(context, theme),
    );
  }

  Widget _buildDesktopLayout(BuildContext context, ThemeData theme) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // Left side - Text content
        Expanded(
          flex: 3,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FadeInAnimation(
                delay: 0.5,
                child: Text(
                  'Bonjour, je suis',
                  style: theme.textTheme.headlineMedium?.copyWith(
                    color: theme.colorScheme.primary,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              FadeInAnimation(
                delay: 0.7,
                child: Text(
                  AppConstants.name,
                  style: theme.textTheme.displayLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 15),
              FadeInAnimation(
                delay: 0.9,
                child: SizedBox(
                  height: 60,
                  child: AnimatedTextKit(
                    animatedTexts: [
                      TyperAnimatedText(
                        'Flutter Engineer',
                        textStyle: theme.textTheme.displayMedium?.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                        speed: const Duration(milliseconds: 50),
                      ),
                      TyperAnimatedText(
                        'Embedded Systems & IoT Developer',
                        textStyle: theme.textTheme.displayMedium?.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                        speed: const Duration(milliseconds: 50),
                      ),
                      TyperAnimatedText(
                        'Backend Engineer',
                        textStyle: theme.textTheme.displayMedium?.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                        speed: const Duration(milliseconds: 50),
                      ),
                    ],
                    isRepeatingAnimation: true,
                    repeatForever: true,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              FadeInAnimation(
                delay: 1.1,
                child: Text(
                  'Développeur Flutter spécialisé avec une expertise en IoT embarqué et développement backend.',
                  style: theme.textTheme.bodyLarge?.copyWith(
                    height: 1.6,
                  ),
                ),
              ),
              const SizedBox(height: 30),
              FadeInAnimation(
                delay: 1.3,
                child: Row(
                  children: [
                    ElevatedButton.icon(
                      onPressed: () => onScrollToSection(3), // Projects section
                      icon: const Icon(Icons.code),
                      label: const Text('Voir les projets'),
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 24,
                          vertical: 16,
                        ),
                        textStyle: const TextStyle(fontSize: 16),
                      ),
                    ),
                    const SizedBox(width: 16),
                    OutlinedButton.icon(
                      onPressed: () => _launchURL('mailto:${AppConstants.email}'),
                      icon: const Icon(Icons.email),
                      label: const Text('Me contacter'),
                      style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 24,
                          vertical: 16,
                        ),
                        textStyle: const TextStyle(fontSize: 16),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        // Right side - Profile image
        Expanded(
          flex: 2,
          child: FadeInAnimation(
            delay: 1.5,
            child: Center(
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: theme.colorScheme.primary.withValues(alpha: 0.3),
                      blurRadius: 20,
                      spreadRadius: 5,
                    ),
                  ],
                ),
                child: const CircleAvatar(
                  radius: 150,
                  backgroundImage: AssetImage('assets/images/profile.jpg'),
                  backgroundColor: Colors.transparent,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildMobileLayout(BuildContext context, ThemeData theme) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // Profile image
        FadeInAnimation(
          delay: 0.5,
          child: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: theme.colorScheme.primary.withValues(alpha: 0.3),
                  blurRadius: 20,
                  spreadRadius: 3,
                ),
              ],
            ),
            child: const CircleAvatar(
              radius: 80,
              backgroundImage: AssetImage('assets/images/profile.jpg'),
              backgroundColor: Colors.transparent,
            ),
          ),
        ),
        const SizedBox(height: 30),

        // Text content
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            FadeInAnimation(
              delay: 0.7,
              child: Text(
                'Bonjour, je suis',
                style: theme.textTheme.headlineSmall?.copyWith(
                  color: theme.colorScheme.primary,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 10),
            FadeInAnimation(
              delay: 0.9,
              child: Text(
                AppConstants.name,
                style: theme.textTheme.displayMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 15),
            FadeInAnimation(
              delay: 1.1,
              child: SizedBox(
                height: 50,
                child: AnimatedTextKit(
                  animatedTexts: [
                    TyperAnimatedText(
                      'Flutter Engineer',
                      textStyle: theme.textTheme.headlineSmall?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                      speed: const Duration(milliseconds: 50),
                    ),
                    TyperAnimatedText(
                      'Embedded Systems Developer',
                      textStyle: theme.textTheme.headlineSmall?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                      speed: const Duration(milliseconds: 50),
                    ),
                    TyperAnimatedText(
                      'Backend Engineer',
                      textStyle: theme.textTheme.headlineSmall?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                      speed: const Duration(milliseconds: 50),
                    ),
                  ],
                  isRepeatingAnimation: true,
                  repeatForever: true,
                ),
              ),
            ),
            const SizedBox(height: 20),
            FadeInAnimation(
              delay: 1.3,
              child: Text(
                'Développeur Flutter spécialisé avec une expertise en IoT embarqué et développement backend.',
                style: theme.textTheme.bodyLarge?.copyWith(
                  height: 1.6,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 30),
            FadeInAnimation(
              delay: 1.5,
              child: Column(
                children: [
                  ElevatedButton.icon(
                    onPressed: () => onScrollToSection(3), // Projects section
                    icon: const Icon(Icons.code),
                    label: const Text('Voir les projets'),
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 24,
                        vertical: 16,
                      ),
                      textStyle: const TextStyle(fontSize: 16),
                    ),
                  ),
                  const SizedBox(height: 16),
                  OutlinedButton.icon(
                    onPressed: () => _launchURL('mailto:${AppConstants.email}'),
                    icon: const Icon(Icons.email),
                    label: const Text('Me contacter'),
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 24,
                        vertical: 16,
                      ),
                      textStyle: const TextStyle(fontSize: 16),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }

  Future<void> _launchURL(String url) async {
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    }
  }
}