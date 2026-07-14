import 'package:flutter/material.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';
import 'package:portfolio_website/app.dart';
import 'package:portfolio_website/services/firebase_service.dart';
import 'package:provider/provider.dart';
import 'package:portfolio_website/providers/portfolio_provider.dart';
import 'package:portfolio_website/services/local_portfolio_repository.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Firebase
  try {
    await FirebaseService.initialize();
  } catch (e) {
    debugPrint('Firebase initialization failed: $e');
  }

  setUrlStrategy(PathUrlStrategy());

  // Use local repository for now
  final repository = LocalPortfolioRepository();

  runApp(
    ChangeNotifierProvider(
      create: (context) => PortfolioProvider(repository),
      child: const PortfolioApp(),
    ),
  );
}