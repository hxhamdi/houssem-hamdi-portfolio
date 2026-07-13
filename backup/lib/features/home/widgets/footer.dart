import 'package:flutter/material.dart';
import '../../../core/constants/app_constants.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
      color: theme.colorScheme.surface,
      child: Column(
        children: [
          const Divider(height: 1, thickness: 1),
          const SizedBox(height: 20),
          Text(
            '© ${DateTime.now().year} ${AppConstants.name}. Tous droits réservés.',
            style: theme.textTheme.bodyMedium,
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
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
              IconButton(
                icon: const FaIcon(FontAwesomeIcons.envelope),
                onPressed: () => _launchURL('mailto:${AppConstants.email}'),
                tooltip: 'Email',
              ),
            ],
          ),
        ],
      ),
    );
  }

  Future<void> _launchURL(String url) async {
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    }
  }
}