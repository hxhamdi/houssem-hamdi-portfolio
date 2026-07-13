import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../features/home/home_page.dart';
import '../../features/projects/projects_page.dart';
import '../../features/experience/experience_page.dart';
import '../../features/contact/contact_page.dart';
import '../../features/home/widgets/app_navigation_bar.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    routes: [
      ShellRoute(
        builder: (context, state, child) {
          return Scaffold(
            body: Column(
              children: [
                const AppNavigationBar(),
                Expanded(child: child),
              ],
            ),
          );
        },
        routes: [
          GoRoute(
            path: '/',
            builder: (context, state) => const HomePage(),
          ),
          GoRoute(
            path: '/projects',
            builder: (context, state) => const ProjectsPage(),
          ),
          GoRoute(
            path: '/experience',
            builder: (context, state) => const ExperiencePage(),
          ),
          GoRoute(
            path: '/contact',
            builder: (context, state) => ContactPage(),
          ),
        ],
      ),
    ],
  );
}
