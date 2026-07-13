import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:portfolio_website/core/constants/app_constants.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class AppNavigationBar extends StatelessWidget {
  const AppNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    final currentRoute = GoRouterState.of(context).matchedLocation;

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Logo/Name
          GestureDetector(
            onTap: () => context.go('/'),
            child: Text(
              AppConstants.name.split(' ').map((e) => e[0]).join(),
              style: Theme.of(context).textTheme.displaySmall?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.primary,
                  ),
            ),
          ),

          // Navigation Links
          Row(
            children: [
              _buildNavItem(context, 'Accueil', '/', currentRoute),
              const SizedBox(width: 30),
              _buildNavItem(context, 'Projets', '/projects', currentRoute),
              const SizedBox(width: 30),
              _buildNavItem(context, 'Expérience', '/experience', currentRoute),
              const SizedBox(width: 30),
              _buildNavItem(context, 'Contact', '/contact', currentRoute),
            ],
          ),

          // Social Icons
          Row(
            children: [
              IconButton(
                icon: const FaIcon(FontAwesomeIcons.github),
                onPressed: () => _launchURL(AppConstants.githubUrl),
                tooltip: 'GitHub',
              ),
              IconButton(
                icon: const FaIcon(FontAwesomeIcons.linkedin),
                onPressed: () => _launchURL(AppConstants.linkedinUrl),
                tooltip: 'LinkedIn',
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildNavItem(
      BuildContext context, String title, String route, String currentRoute) {
    final isActive = currentRoute == route;

    return GestureDetector(
      onTap: () => context.go(route),
      child: Text(
        title,
        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              fontWeight: FontWeight.w500,
              color: isActive
                  ? Theme.of(context).colorScheme.primary
                  : Theme.of(context).textTheme.bodyLarge?.color,
              decoration:
                  isActive ? TextDecoration.underline : TextDecoration.none,
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
