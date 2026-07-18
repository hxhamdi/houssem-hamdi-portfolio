import 'package:flutter/material.dart';
import 'package:portfolio_website/models/profile_model.dart';
import 'package:portfolio_website/models/cv_model.dart';
import 'package:portfolio_website/shared/animations/fade_in_animation.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:provider/provider.dart';
import 'package:portfolio_website/providers/portfolio_provider.dart';

class HeroSection extends StatelessWidget {
  final Function(int) onScrollToSection;

  const HeroSection({super.key, required this.onScrollToSection});

  @override
  Widget build(BuildContext context) {
    final portfolioProvider = Provider.of<PortfolioProvider>(context);
    final profile = portfolioProvider.profile;
    final cv = portfolioProvider.cv;
    final isMobile = MediaQuery.of(context).size.width < 768;
    final theme = Theme.of(context);

    if (portfolioProvider.isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (profile == null) {
      return const Center(child: Text('Profile not available'));
    }

    return Container(
      padding: EdgeInsets.symmetric(
        vertical: isMobile ? 60 : 100,
        horizontal: 20,
      ),
      child: isMobile
          ? _buildMobileLayout(context, theme, profile, cv)
          : _buildDesktopLayout(context, theme, profile, cv),
    );
  }

  Widget _buildDesktopLayout(
    BuildContext context,
    ThemeData theme,
    Profile profile,
    CV? cv,
  ) {
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
                  profile.name,
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
                  profile.description,
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
                    if (cv != null && cv.downloadEnabled)
                      OutlinedButton.icon(
                        onPressed: () => _downloadCV(cv.pdfAssetPath),
                        icon: const Icon(Icons.download),
                        label: Text(cv.downloadLabel),
                        style: OutlinedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 24,
                            vertical: 16,
                          ),
                          textStyle: const TextStyle(fontSize: 16),
                        ),
                      ),
                    const SizedBox(width: 16),
                    OutlinedButton.icon(
                      onPressed: () => onScrollToSection(5), // Contact section
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
                child: CircleAvatar(
                  radius: 150,
                  backgroundImage: profile.heroImage.startsWith('http')
                      ? NetworkImage(profile.heroImage)
                      : AssetImage(profile.heroImage) as ImageProvider,
                  backgroundColor: Colors.transparent,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildMobileLayout(
    BuildContext context,
    ThemeData theme,
    Profile profile,
    CV? cv,
  ) {
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
            child: CircleAvatar(
              radius: 80,
              backgroundImage: AssetImage(profile.heroImage),
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
                profile.name,
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
                profile.description,
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
                  if (cv != null && cv.downloadEnabled)
                    OutlinedButton.icon(
                      onPressed: () => _downloadCV(cv.pdfAssetPath),
                      icon: const Icon(Icons.download),
                      label: Text(cv.downloadLabel),
                      style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 24,
                          vertical: 16,
                        ),
                        textStyle: const TextStyle(fontSize: 16),
                      ),
                    ),
                  const SizedBox(height: 16),
                  OutlinedButton.icon(
                    onPressed: () => onScrollToSection(5), // Contact section
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

  Future<void> _downloadCV(String pdfPath) async {
    try {
      // For web, we need to use the url_launcher to open the PDF
      if (await canLaunchUrl(Uri.parse(pdfPath))) {
        await launchUrl(Uri.parse(pdfPath));
      } else {
        // For mobile/desktop, we can use the file path directly
        debugPrint('Downloading CV from: $pdfPath');
      }
    } catch (e) {
      debugPrint('Error downloading CV: $e');
    }
  }
}
