import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:portfolio_website/core/routing/app_router.dart';
import 'package:portfolio_website/core/theme/app_theme.dart';
import 'package:provider/provider.dart';
import 'package:portfolio_website/providers/portfolio_provider.dart';

class PortfolioApp extends StatelessWidget {
  const PortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<PortfolioProvider>(
      builder: (context, portfolioProvider, child) {
        return MaterialApp.router(
          title: portfolioProvider.profile?.name ?? 'Portfolio',
          theme: AppTheme.light,
          darkTheme: AppTheme.dark,
          debugShowCheckedModeBanner: false,
          routerConfig: router,
        );
      },
    );
  }
}