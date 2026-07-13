import 'package:flutter/material.dart';
import '../../core/constants/app_constants.dart';
import '../../shared/responsive/responsive_layout.dart';
import '../../shared/animations/fade_in_animation.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactPage extends StatelessWidget {
  ContactPage({super.key});

  final List<Map<String, dynamic>> contactMethods = const [
    {
      'icon': FontAwesomeIcons.envelope,
      'title': 'Email',
      'value': AppConstants.email,
      'url': 'mailto:${AppConstants.email}',
    },
    {
      'icon': FontAwesomeIcons.phone,
      'title': 'Téléphone',
      'value': AppConstants.phone,
      'url': 'tel:${AppConstants.phone}',
    },
    {
      'icon': FontAwesomeIcons.github,
      'title': 'GitHub',
      'value': AppConstants.github,
      'url': AppConstants.githubUrl,
    },
    {
      'icon': FontAwesomeIcons.linkedin,
      'title': 'LinkedIn',
      'value': AppConstants.linkedin,
      'url': AppConstants.linkedinUrl,
    },
    {
      'icon': FontAwesomeIcons.locationDot,
      'title': 'Localisation',
      'value': AppConstants.location,
      'url': 'https://www.google.com/maps/place/Tunis',
    },
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return ResponsiveLayout(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FadeInAnimation(
                delay: 0.3,
                child: Text(
                  'CONTACT',
                  style: theme.textTheme.displaySmall?.copyWith(
                    color: theme.colorScheme.primary,
                  ),
                ),
              ),
              const SizedBox(height: 30),
              Text(
                'N’hésitez pas à me contacter pour toute opportunité ou collaboration !',
                style: theme.textTheme.bodyLarge,
              ),
              const SizedBox(height: 40),
              Center(
                child: Wrap(
                  spacing: 40,
                  runSpacing: 30,
                  alignment: WrapAlignment.center,
                  children: contactMethods.map((method) {
                    return _buildContactMethod(context, method);
                  }).toList(),
                ),
              ),
              const SizedBox(height: 60),
              // Contact Form
              FadeInAnimation(
                delay: 0.5,
                child: Card(
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(30),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Envoyez-moi un message',
                          style: theme.textTheme.titleLarge?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 20),
                        const TextField(
                          decoration: InputDecoration(
                            labelText: 'Nom',
                            border: OutlineInputBorder(),
                          ),
                        ),
                        const SizedBox(height: 20),
                        const TextField(
                          decoration: InputDecoration(
                            labelText: 'Email',
                            border: OutlineInputBorder(),
                          ),
                        ),
                        const SizedBox(height: 20),
                        const TextField(
                          decoration: InputDecoration(
                            labelText: 'Message',
                            border: OutlineInputBorder(),
                            alignLabelWithHint: true,
                          ),
                          maxLines: 5,
                        ),
                        const SizedBox(height: 20),
                        Center(
                          child: ElevatedButton(
                            onPressed: () {
                              // Handle form submission
                            },
                            style: ElevatedButton.styleFrom(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 40,
                                vertical: 15,
                              ),
                            ),
                            child: const Text('Envoyer'),
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
      ),
    );
  }

  Widget _buildContactMethod(BuildContext context, Map<String, dynamic> method) {
    final theme = Theme.of(context);

    return FadeInAnimation(
      delay: 0.4,
      child: SizedBox(
        width: 200,
        child: Column(
          children: [
            IconButton(
              icon: FaIcon(method['icon']),
              iconSize: 40,
              color: theme.colorScheme.primary,
              onPressed: () => _launchURL(method['url']),
            ),
            const SizedBox(height: 10),
            Text(
              method['title'],
              style: theme.textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 5),
            GestureDetector(
              onTap: () => _launchURL(method['url']),
              child: Text(
                method['value'],
                style: TextStyle(
                  color: theme.colorScheme.primary,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
          ],
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