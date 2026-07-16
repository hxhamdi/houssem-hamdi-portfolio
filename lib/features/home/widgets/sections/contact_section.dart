import 'package:flutter/material.dart';
import 'package:portfolio_website/shared/responsive/responsive_layout.dart';
import 'package:portfolio_website/shared/animations/fade_in_animation.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:provider/provider.dart';
import 'package:portfolio_website/providers/portfolio_provider.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  @override
  Widget build(BuildContext context) {
    final portfolioProvider = Provider.of<PortfolioProvider>(context);
    final profile = portfolioProvider.profile;
    final cv = portfolioProvider.cv;
    final theme = Theme.of(context);
    final isMobile = MediaQuery.of(context).size.width < 768;

    if (portfolioProvider.isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (profile == null) {
      return const Center(child: Text('Profile not available'));
    }

    return ResponsiveLayout(
      child: Container(
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
                'CONTACT',
                style: theme.textTheme.displayMedium?.copyWith(
                  color: theme.colorScheme.primary,
                ),
              ),
            ),
            const SizedBox(height: 30),
            Text(
              'Je suis actuellement disponible pour de nouvelles opportunités professionnelles. N’hésitez pas à me contacter !',
              style: theme.textTheme.bodyLarge,
            ),
            const SizedBox(height: 40),
            Center(
              child: Wrap(
                spacing: 40,
                runSpacing: 30,
                alignment: WrapAlignment.center,
                children: [
                  _buildContactItem(
                    context,
                    icon: Icons.email,
                    label: 'Email',
                    value: profile.email,
                    onTap: () => _launchURL('mailto:${profile.email}'),
                  ),
                  _buildContactItem(
                    context,
                    icon: Icons.phone,
                    label: 'Téléphone',
                    value: profile.phone,
                    onTap: () => _launchURL('tel:${profile.phone}'),
                  ),
                  _buildContactItem(
                    context,
                    icon: Icons.location_on,
                    label: 'Localisation',
                    value: profile.location,
                  ),
                  _buildSocialItem(
                    context,
                    icon: Icons.code,
                    label: 'GitHub',
                    url: 'https://github.com/hxhamdi',
                  ),
                  _buildSocialItem(
                    context,
                    icon: Icons.business,
                    label: 'LinkedIn',
                    url: 'https://linkedin.com/in/houssem-hamdi-44bbb81b8',
                  ),
                ],
              ),
            ),
            const SizedBox(height: 60),
            Center(
              child: Column(
                children: [
                  if (cv != null && cv.downloadEnabled)
                    ElevatedButton.icon(
                      onPressed: () => _downloadCV(cv.pdfAssetPath),
                      icon: const Icon(Icons.download),
                      label: Text(cv.downloadLabel),
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 30,
                          vertical: 15,
                        ),
                        textStyle: const TextStyle(fontSize: 16),
                      ),
                    ),
                  const SizedBox(height: 20),
                  ElevatedButton.icon(
                    onPressed: () => _launchURL('mailto:${profile.email}'),
                    icon: const Icon(Icons.email),
                    label: const Text('Envoyez-moi un message'),
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 30,
                        vertical: 15,
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
    );
  }

  Widget _buildContactItem(
    BuildContext context, {
    required IconData icon,
    required String label,
    required String value,
    VoidCallback? onTap,
  }) {
    final theme = Theme.of(context);
    final content = onTap != null
        ? InkWell(
            onTap: onTap,
            borderRadius: BorderRadius.circular(8),
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Text(
                value,
                style: TextStyle(
                  color: theme.colorScheme.primary,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
          )
        : Text(value);

    return SizedBox(
      width: 250,
      child: Row(
        children: [
          Icon(icon, size: 24, color: theme.colorScheme.primary),
          const SizedBox(width: 12),
          Text('$label:', style: theme.textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w600)),
          const SizedBox(width: 8),
          Expanded(child: content),
        ],
      ),
    );
  }

  Widget _buildSocialItem(
    BuildContext context, {
    required IconData icon,
    required String label,
    required String url,
  }) {
    final theme = Theme.of(context);

    return SizedBox(
      width: 250,
      child: Row(
        children: [
          Icon(icon, size: 24, color: theme.colorScheme.primary),
          const SizedBox(width: 12),
          Text(label, style: theme.textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w600)),
          const SizedBox(width: 8),
          IconButton(
            icon: const Icon(Icons.open_in_new, size: 20),
            onPressed: () => _launchURL(url),
            tooltip: 'Ouvrir $label',
          ),
        ],
      ),
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

  Future<void> _launchURL(String url) async {
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    }
  }
}