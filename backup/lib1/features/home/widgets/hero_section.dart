import 'package:flutter/material.dart';
import 'package:portfolio_website/core/constants/app_constants.dart';
import 'package:portfolio_website/shared/animations/fade_in_animation.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 20),
      child: Column(
        children: [
          // Profile Image
          const FadeInAnimation(
            delay: 0.5,
            child: CircleAvatar(
              radius: 80,
              backgroundImage: AssetImage('assets/images/profile.jpg'),
              backgroundColor: Colors.transparent,
            ),
          ),

          const SizedBox(height: 30),

          // Name
          FadeInAnimation(
            delay: 1.0,
            child: Text(
              AppConstants.name,
              style: theme.textTheme.displayMedium?.copyWith(
                color: theme.colorScheme.primary,
              ),
              textAlign: TextAlign.center,
            ),
          ),

          const SizedBox(height: 15),

          // Title with animation
          FadeInAnimation(
            delay: 1.5,
            child: SizedBox(
              height: 60,
              child: AnimatedTextKit(
                animatedTexts: [
                  TyperAnimatedText(
                    AppConstants.title,
                    textStyle: theme.textTheme.headlineMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                    speed: const Duration(milliseconds: 50),
                  ),
                ],
                isRepeatingAnimation: false,
              ),
            ),
          ),

          const SizedBox(height: 20),

          // Contact Info
          FadeInAnimation(
            delay: 2.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: const FaIcon(FontAwesomeIcons.github),
                  onPressed: () => _launchURL(AppConstants.githubUrl),
                  tooltip: 'GitHub',
                ),
                const SizedBox(width: 10),
                IconButton(
                  icon: const FaIcon(FontAwesomeIcons.linkedin),
                  onPressed: () => _launchURL(AppConstants.linkedinUrl),
                  tooltip: 'LinkedIn',
                ),
                const SizedBox(width: 10),
                IconButton(
                  icon: const FaIcon(FontAwesomeIcons.envelope),
                  onPressed: () => _launchURL('mailto:${AppConstants.email}'),
                  tooltip: 'Email',
                ),
                const SizedBox(width: 10),
                IconButton(
                  icon: const FaIcon(FontAwesomeIcons.phone),
                  onPressed: () => _launchURL('tel:${AppConstants.phone}'),
                  tooltip: 'Phone',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    }
  }
}
