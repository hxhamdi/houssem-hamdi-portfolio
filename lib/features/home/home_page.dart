import 'package:flutter/material.dart';
import 'package:portfolio_website/shared/responsive/responsive_layout.dart';
import 'package:portfolio_website/shared/animations/fade_in_animation.dart';
import 'package:portfolio_website/features/home/widgets/app_navigation_bar.dart';
import 'package:portfolio_website/features/home/widgets/hero_section.dart';
import 'package:portfolio_website/features/home/widgets/about_section.dart';
import 'package:portfolio_website/features/home/widgets/skills_section.dart';
import 'package:portfolio_website/features/home/widgets/sections/projects_section.dart';
import 'package:portfolio_website/features/home/widgets/sections/experience_section.dart' as experience;
import 'package:portfolio_website/features/home/widgets/sections/contact_section.dart';
import 'package:portfolio_website/features/home/widgets/footer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ScrollController _scrollController = ScrollController();
  final List<GlobalKey> _sectionKeys = List.generate(6, (index) => GlobalKey());
  int _currentSection = 0;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    for (int i = 0; i < _sectionKeys.length; i++) {
      final context = _sectionKeys[i].currentContext;
      if (context != null) {
        final box = context.findRenderObject() as RenderBox?;
        if (box != null) {
          final position = box.localToGlobal(Offset.zero);
          final size = box.size;
          final screenHeight = MediaQuery.of(context).size.height;
          final sectionMiddle = position.dy + size.height / 2;

          // Check if section is in view
          if (sectionMiddle > 0 && sectionMiddle < screenHeight) {
            if (_currentSection != i) {
              setState(() => _currentSection = i);
            }
            break;
          }
        }
      }
    }
  }

  void _scrollToSection(int index) {
    final context = _sectionKeys[index].currentContext;
    if (context != null) {
      Scrollable.ensureVisible(
        context,
        duration: const Duration(milliseconds: 800),
        curve: Curves.easeInOut,
        alignment: 0.1, // Align to 10% from top to account for navbar
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ResponsiveLayout(
        child: CustomScrollView(
          controller: _scrollController,
          slivers: [
            SliverAppBar(
              pinned: true,
              expandedHeight: 80.0,
              flexibleSpace: FlexibleSpaceBar(
                background: Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.surface.withValues(alpha: 0.95),
                  ),
                ),
              ),
              title: AppNavigationBar(
                onNavItemTap: _scrollToSection,
                currentSection: _currentSection,
              ),
            ),
            SliverList(
              delegate: SliverChildListDelegate([
                // Hero Section
                FadeInAnimation(
                  delay: 0.2,
                  child: HeroSection(
                    key: _sectionKeys[0],
                    onScrollToSection: _scrollToSection,
                  ),
                ),
                // About Section
                FadeInAnimation(
                  delay: 0.4,
                  child: AboutSection(key: _sectionKeys[1]),
                ),
                // Skills Section
                FadeInAnimation(
                  delay: 0.6,
                  child: SkillsSection(key: _sectionKeys[2]),
                ),
                // Projects Section
                FadeInAnimation(
                  delay: 0.8,
                  child: ProjectsSection(key: _sectionKeys[3]),
                ),
                // Experience Section
                FadeInAnimation(
                  delay: 1.0,
                  child: experience.ExperienceSection(key: _sectionKeys[4]),
                ),
                // Contact Section
                FadeInAnimation(
                  delay: 1.2,
                  child: ContactSection(key: _sectionKeys[5]),
                ),
                // Footer
                const Footer(),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}