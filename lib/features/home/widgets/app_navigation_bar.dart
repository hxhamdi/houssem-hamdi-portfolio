import 'package:flutter/material.dart';
import 'package:portfolio_website/core/constants/app_constants.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class AppNavigationBar extends StatefulWidget {
  final Function(int) onNavItemTap;
  final int currentSection;

  const AppNavigationBar({
    super.key,
    required this.onNavItemTap,
    required this.currentSection,
  });

  @override
  State<AppNavigationBar> createState() => _AppNavigationBarState();
}

class _AppNavigationBarState extends State<AppNavigationBar> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isMobile = MediaQuery.of(context).size.width < 768;

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      decoration: BoxDecoration(
        color: theme.colorScheme.surface.withValues(alpha: 0.95),
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
            onTap: () => widget.onNavItemTap(0),
            child: Text(
              AppConstants.name.split(' ').map((e) => e[0]).join(),
              style: theme.textTheme.displaySmall?.copyWith(
                fontWeight: FontWeight.bold,
                color: theme.colorScheme.primary,
              ),
            ),
          ),

          // Navigation Links - Desktop
          if (!isMobile)
            Row(
              children: [
                _buildNavItem(context, 'Accueil', 0),
                const SizedBox(width: 30),
                _buildNavItem(context, 'À propos', 1),
                const SizedBox(width: 30),
                _buildNavItem(context, 'Compétences', 2),
                const SizedBox(width: 30),
                _buildNavItem(context, 'Projets', 3),
                const SizedBox(width: 30),
                _buildNavItem(context, 'Expérience', 4),
                const SizedBox(width: 30),
                _buildNavItem(context, 'Contact', 5),
              ],
            ),

          // Mobile menu button
          if (isMobile)
            IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () => _showMobileMenu(context),
            ),

          // Social Icons - Desktop
          if (!isMobile)
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

  Widget _buildNavItem(BuildContext context, String title, int index) {
    final theme = Theme.of(context);
    final isActive = widget.currentSection == index;

    return GestureDetector(
      onTap: () => widget.onNavItemTap(index),
      child: Text(
        title,
        style: theme.textTheme.bodyLarge?.copyWith(
          fontWeight: FontWeight.w500,
          color: isActive ? theme.colorScheme.primary : theme.textTheme.bodyLarge?.color,
          decoration: isActive ? TextDecoration.underline : TextDecoration.none,
        ),
      ),
    );
  }

  void _showMobileMenu(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              title: const Text('Accueil'),
              onTap: () {
                Navigator.pop(context);
                widget.onNavItemTap(0);
              },
            ),
            ListTile(
              title: const Text('À propos'),
              onTap: () {
                Navigator.pop(context);
                widget.onNavItemTap(1);
              },
            ),
            ListTile(
              title: const Text('Compétences'),
              onTap: () {
                Navigator.pop(context);
                widget.onNavItemTap(2);
              },
            ),
            ListTile(
              title: const Text('Projets'),
              onTap: () {
                Navigator.pop(context);
                widget.onNavItemTap(3);
              },
            ),
            ListTile(
              title: const Text('Expérience'),
              onTap: () {
                Navigator.pop(context);
                widget.onNavItemTap(4);
              },
            ),
            ListTile(
              title: const Text('Contact'),
              onTap: () {
                Navigator.pop(context);
                widget.onNavItemTap(5);
              },
            ),
          ],
        );
      },
    );
  }

  Future<void> _launchURL(String url) async {
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    }
  }
}