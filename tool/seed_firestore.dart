// ignore_for_file: avoid_print

/// Firestore Seeder - Safe one-time initialization script for portfolio data
///
/// This script should be executed ONLY ONCE during initial deployment
/// or when resetting the Firestore database.
///
/// To run:
///   flutter run -d chrome -t tool/seed_firestore.dart
///
/// WARNING: Running this script with --force will delete all existing data
/// in the following collections:
///   - profile
///   - social_links
///   - skills
///   - projects
///   - experience
///   - cv

import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:portfolio_website/services/firestore_seeder.dart';
import 'package:portfolio_website/firebase_options.dart';

Future<void> main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();

  final bool force = args.contains('--force');

  print('🔥 Initializing Firebase...');
  try {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    print('✅ Firebase initialized successfully');
  } catch (e) {
    print('❌ Error initializing Firebase: $e');
    rethrow;
  }

  // Check if portfolio is already initialized
  final firestore = FirebaseFirestore.instance;
  try {
    await FirebaseFirestore.instance.collection('profile').limit(1).get();
  } on FirebaseException catch (e) {
    print('Firestore connection failed: ${e.code}');
    print(e.message);
    rethrow;
  }
  final profileDoc = await firestore.collection('profile').doc('main').get();

  if (profileDoc.exists && !force) {
    print('ℹ️  Portfolio already initialized in Firestore');
    print('ℹ️  Use --force to overwrite existing data');
    print(
        'ℹ️  Example: flutter run -d chrome -t tool/seed_firestore.dart --force');
    return;
  }

  if (force) {
    print('⚠️  WARNING: This will DELETE ALL existing portfolio data');
    print(
        '⚠️  Collections to be cleared: profile, social_links, skills, projects, experience, cv');
    print('⚠️  Press Ctrl+C to cancel or wait 5 seconds to continue...');

    // Wait for user confirmation
    try {
      await Future.delayed(const Duration(seconds: 5));
    } catch (e) {
      print('❌ Operation cancelled by user');
      return;
    }
  }

  print('📊 Starting Firestore seeding...');
  final seeder = FirestoreSeeder();

  try {
    if (force) {
      // Clear existing data only when --force is provided
      print('🧹 Clearing existing data...');
      await seeder.clearAllData();
      print('✅ Existing data cleared');
    }

    // Seed new data
    print('🌱 Seeding new data...');
    await seeder.seedAllData();
    print('✅ Data seeded successfully');
  } catch (e) {
    print('❌ Error seeding data: $e');
    rethrow;
  }

  print('🎉 Firestore seeding completed successfully!');
  print('🚀 You can now close this window and run the main app');
}
