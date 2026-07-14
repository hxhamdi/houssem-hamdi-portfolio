import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:portfolio_website/models/profile_model.dart';
import 'package:portfolio_website/models/social_link_model.dart';
import 'package:portfolio_website/models/skill_model.dart';
import 'package:portfolio_website/models/project_model.dart';
import 'package:portfolio_website/models/experience_model.dart';
import 'package:portfolio_website/models/cv_model.dart';
import 'package:flutter/foundation.dart';

class FirestoreSeeder {
  final FirebaseFirestore _firestore;

  FirestoreSeeder({FirebaseFirestore? firestore})
      : _firestore = firestore ?? FirebaseFirestore.instance;

  Future<void> seedAllData() async {
    try {
      await Future.wait([
        seedProfile(),
        seedSocialLinks(),
        seedSkills(),
        seedProjects(),
        seedExperience(),
        seedCV(),
      ]);
      debugPrint('All data seeded successfully!');
    } catch (e) {
      debugPrint('Error seeding data: $e');
      rethrow;
    }
  }

  Future<void> seedProfile() async {
    final profile = Profile(
      id: 'main',
      name: 'Elhamdi Mohamed Houssem',
      title: 'Développeur Flutter spécialisé - Mobile, IoT & Full Stack',
      description: 'Mastère de recherche en systèmes intelligents et IoT (Bac+5), 2 ans d’expérience sur des projets livrés de bout en bout. Spécialité Flutter multi-plateformes (iOS, Android) avec une double compétence rare : intégration IoT embarqué (ESP32, FreeRTOS, Firebase) et développement web full stack (Node.js, Angular, REST API). Architecture propre, code maintenable, disponible immédiatement.',
      location: 'Tunis, Tunisie',
      email: 'houssem.hamdi@etudiant-fst.utm.tn',
      phone: '+21658807908',
      availability: 'Disponible pour relocalisation / télétravail',
      heroImage: 'assets/images/profile.jpg',
    );

    await _firestore.collection('profile').doc(profile.id).set(profile.toJson());
    debugPrint('Profile seeded successfully');
  }

  Future<void> seedSocialLinks() async {
    final socialLinks = [
      SocialLink(
        id: 'github',
        platform: 'github',
        url: 'https://github.com/hxhamdi',
        username: 'hxhamdi',
      ),
      SocialLink(
        id: 'linkedin',
        platform: 'linkedin',
        url: 'https://linkedin.com/in/houssem-hamdi-44bbb81b8',
        username: 'houssem-hamdi-44bbb81b8',
      ),
    ];

    for (final link in socialLinks) {
      await _firestore.collection('social_links').doc(link.id).set(link.toJson());
    }
    debugPrint('Social links seeded successfully');
  }

  Future<void> seedSkills() async {
    final skills = [
      Skill(id: '1', category: 'Mobile', name: 'Flutter', icon: 'mobileScreenButton', level: 'advanced'),
      Skill(id: '2', category: 'Mobile', name: 'Dart', icon: 'code', level: 'advanced'),
      Skill(id: '3', category: 'Mobile', name: 'Riverpod', icon: 'gear', level: 'intermediate'),
      Skill(id: '4', category: 'Mobile', name: 'Provider', icon: 'gears', level: 'intermediate'),
      Skill(id: '5', category: 'Embedded / IoT', name: 'ESP32', icon: 'microchip', level: 'advanced'),
      Skill(id: '6', category: 'Embedded / IoT', name: 'ESP-IDF', icon: 'server', level: 'advanced'),
      Skill(id: '7', category: 'Embedded / IoT', name: 'FreeRTOS', icon: 'listCheck', level: 'advanced'),
      Skill(id: '8', category: 'Embedded / IoT', name: 'Arduino', icon: 'microchip', level: 'intermediate'),
      Skill(id: '9', category: 'Embedded / IoT', name: 'SIM7600', icon: 'simCard', level: 'advanced'),
      Skill(id: '10', category: 'Backend', name: 'Node.js', icon: 'nodeJs', level: 'intermediate'),
      Skill(id: '11', category: 'Backend', name: 'Express', icon: 'server', level: 'intermediate'),
      Skill(id: '12', category: 'Backend', name: 'REST APIs', icon: 'cloud', level: 'intermediate'),
      Skill(id: '13', category: 'Backend', name: 'WebSockets', icon: 'networkWired', level: 'intermediate'),
      Skill(id: '14', category: 'Backend', name: 'Socket.io', icon: 'plug', level: 'intermediate'),
      Skill(id: '15', category: 'Cloud', name: 'Firebase', icon: 'google', level: 'advanced'),
      Skill(id: '16', category: 'Cloud', name: 'Firestore', icon: 'database', level: 'advanced'),
      Skill(id: '17', category: 'Cloud', name: 'Cloud Functions', icon: 'cloud', level: 'intermediate'),
      Skill(id: '18', category: 'Cloud', name: 'GCP', icon: 'google', level: 'intermediate'),
      Skill(id: '19', category: 'Cloud', name: 'Azure', icon: 'microsoft', level: 'intermediate'),
      Skill(id: '20', category: 'Cloud', name: 'AWS', icon: 'aws', level: 'basic'),
      Skill(id: '21', category: 'Tools', name: 'Git', icon: 'gitAlt', level: 'intermediate'),
      Skill(id: '22', category: 'Tools', name: 'Docker', icon: 'docker', level: 'intermediate'),
      Skill(id: '23', category: 'Tools', name: 'Linux', icon: 'linux', level: 'intermediate'),
      Skill(id: '24', category: 'Tools', name: 'Postman', icon: 'screwdriverWrench', level: 'intermediate'),
    ];

    for (final skill in skills) {
      await _firestore.collection('skills').doc(skill.id).set(skill.toJson());
    }
    debugPrint('Skills seeded successfully');
  }

  Future<void> seedProjects() async {
    final projects = [
      Project(
        id: '1',
        title: 'Smart Parking App',
        description: 'Solution complète de parking intelligent couvrant le firmware embarqué (ESP32 / SIM7600) et l’application mobile Flutter.',
        details: [
          'Affichage en temps réel de la disponibilité des places avec latence < 2 secondes',
          'Architecture Firebase (Firestore) + Google Cloud Functions',
          'Intégration ESP-CAM pour lecture de QR codes comme mécanisme d’authentification',
        ],
        techStack: ['Flutter', 'ESP32', 'Firebase', 'C/C++'],
        url: 'https://github.com/hxhamdi/ESP32-Camera-QR-Decode',
        demoUrl: '',
        image: 'assets/images/smart_parking.jpg',
        featured: true,
        order: 1,
      ),
      Project(
        id: '2',
        title: 'Système d’authentification vocale (ESP32)',
        description: 'Système d’authentification vocale de bout en bout intégrant ESP32, AssemblyAI, ThingSpeak et Firebase.',
        details: [
          'Taux de reconnaissance correct > 90%',
          'Implémentation complète sous ESP-IDF / FreeRTOS',
          'Communication HTTP vers APIs cloud et retour visuel sur afficheur LCD 16x2',
        ],
        techStack: ['ESP32', 'FreeRTOS', 'AssemblyAI', 'Firebase'],
        url: 'https://github.com/hxhamdi/speech-auth',
        demoUrl: '',
        image: 'assets/images/voice_auth.jpg',
        featured: true,
        order: 2,
      ),
      Project(
        id: '3',
        title: 'Prédiction des précipitations en Australie',
        description: 'Pipeline ML complet pour la prédiction des précipitations à partir de 142,193 observations météorologiques.',
        details: [
          'Prétraitement, sélection de variables et rééchantillonnage pour traiter le déséquilibre des classes',
          'Random Forest comme meilleur classificateur avec ROC-AUC de 0.80',
          'Rappel de 93% sur la classe majoritaire et 45% sur les jours de pluie',
        ],
        techStack: ['Python', 'Scikit-learn', 'Pandas', 'Machine Learning'],
        url: 'https://drive.google.com/file/d/1Tg2m_nWeunxjzOVvIv6D_lKAPd-I-wrp/view?usp=sharing',
        demoUrl: '',
        image: 'assets/images/rain_prediction.jpg',
        featured: true,
        order: 3,
      ),
      Project(
        id: '4',
        title: 'Plateforme éducative Erudaxis',
        description: 'Application multi-rôles desservant 4 profils utilisateurs distincts (étudiants, responsables, instructeurs, collaborateurs).',
        details: [
          'Développement de fonctionnalités clés (suivi des présences, gestion des plannings)',
          'Résolution de problèmes UI/UX de navigation (Provider)',
          'Mises à jour temps réel pour l’accès aux documents',
          'Optimisation des performances réduisant le temps de chargement de ~30%',
        ],
        techStack: ['Flutter', 'Provider', 'Firebase'],
        url: '',
        demoUrl: '',
        image: 'assets/images/education_platform.jpg',
        featured: false,
        order: 4,
      ),
    ];

    for (final project in projects) {
      await _firestore.collection('projects').doc(project.id).set(project.toJson());
    }
    debugPrint('Projects seeded successfully');
  }

  Future<void> seedExperience() async {
    final experience = [
      Experience(
        id: '1',
        role: 'Stagiaire Développeur Flutter',
        company: 'ProServices Training Company',
        period: '03/2026 - Présent',
        description: 'Plateforme éducative Erudaxis',
        details: [
          'Développement de fonctionnalités clés (suivi des présences, gestion des plannings) pour une application multi-rôles desservant 4 profils utilisateurs',
          'Résolution de problèmes UI/UX de navigation (Provider) éliminant les crashs de navigation',
          'Mise en place de mises à jour temps réel pour l’accès aux documents',
          'Optimisation des performances réduisant le temps de chargement des listes de ~30%',
        ],
        techStack: ['Flutter', 'Provider'],
        url: '',
        type: 'work',
        order: 1,
      ),
      Experience(
        id: '2',
        role: 'Développeur Flutter & Embarqué',
        company: 'Projet freelance',
        period: '03/2025 - 02/2026',
        description: 'Smart Parking App',
        details: [
          'Conception et développement complet d’une solution de parking intelligent couvrant le firmware embarqué (ESP32 / SIM7600) et l’application mobile Flutter',
          'Affichage en temps réel de la disponibilité des places avec latence < 2 secondes',
          'Architecture Firebase (Firestore) + Google Cloud Functions pour plusieurs capteurs simultanés',
          'Intégration ESP-CAM pour la lecture de QR codes comme mécanisme d’authentification',
        ],
        techStack: ['Flutter', 'ESP32', 'Firebase', 'C/C++'],
        url: 'https://github.com/hxhamdi/ESP32-Camera-QR-Decode',
        type: 'work',
        order: 2,
      ),
      Experience(
        id: '3',
        role: 'Développeur Embarqué',
        company: 'Projet personnel',
        period: '09/2024 - 01/2025',
        description: 'Système d’authentification vocale (ESP32)',
        details: [
          'Développement d’un système d’authentification vocale de bout en bout avec taux de reconnaissance > 90%',
          'Implémentation complète sous ESP-IDF / FreeRTOS : gestion Wi-Fi, pipeline microphone KY-038',
          'Communication HTTP vers APIs cloud et retour visuel sur afficheur LCD 16x2',
        ],
        techStack: ['ESP32', 'FreeRTOS', 'AssemblyAI', 'Firebase'],
        url: 'https://github.com/hxhamdi/speech-auth',
        type: 'work',
        order: 3,
      ),
      Experience(
        id: '4',
        role: 'Veille technologique & autoformation',
        company: 'Période d’autoformation',
        period: '02/2024 - 03/2025',
        description: 'Flutter avancé et IoT',
        details: [
          'Approfondissement de Flutter (state management avancé, Provider, Riverpod)',
          'Exploration de l’écosystème ESP32 / FreeRTOS',
          'Expérimentation pratique de composants électroniques (LCD, capteurs, modules caméra)',
          'Certifications Microsoft Azure Fundamentals et Azure AI Fundamentals',
        ],
        techStack: ['Flutter', 'ESP32', 'Azure'],
        url: '',
        type: 'education',
        order: 4,
      ),
      Experience(
        id: '5',
        role: 'Stagiaire Développeur Full Stack',
        company: 'Consord',
        period: '02/2021 - 06/2021',
        description: 'Système de pilotage d’enseignement à distance',
        details: [
          'Architecture backend Node.js avec Express et WebSockets',
          'Streaming vidéo via caméra serveur et FFmpeg',
          'Prototypage hardware progressif : LEDs sur breadboard puis robot voiture',
          'Migration frontend de Handlebars.js vers Angular',
        ],
        techStack: ['Node.js', 'Angular', 'WebSockets', 'Express'],
        url: '',
        type: 'work',
        order: 5,
      ),
      Experience(
        id: '6',
        role: 'Mastère de recherche en systèmes intelligents et IoT',
        company: 'Faculté des sciences de Tunis',
        period: '09/2021 - 01/2024',
        description: '',
        details: [
          'Mémoire : Application du Machine Learning au Model Checking pour améliorer les performances des algorithmes de vérification formelle',
        ],
        techStack: ['Machine Learning', 'IoT', 'Model Checking'],
        url: '',
        type: 'education',
        order: 6,
      ),
      Experience(
        id: '7',
        role: 'Licence fondamentale en sciences de l’informatique',
        company: 'Faculté des sciences de Tunis',
        period: '09/2018 - 06/2021',
        description: '',
        details: [],
        techStack: ['Java', 'Algorithms', 'Data Structures'],
        url: '',
        type: 'education',
        order: 7,
      ),
    ];

    for (final exp in experience) {
      await _firestore.collection('experience').doc(exp.id).set(exp.toJson());
    }
    debugPrint('Experience seeded successfully');
  }

  Future<void> seedCV() async {
    final cv = CV(
      id: 'metadata',
      title: 'CV Elhamdi Mohamed Houssem',
      version: '1.0',
      lastUpdated: DateTime(2024, 1, 1),
      description: 'Curriculum Vitae de Elhamdi Mohamed Houssem',
      pdfAssetPath: 'assets/cv/Houssem_Hamdi_CV.pdf',
      texAssetPath: 'assets/cv/Houssem_Hamdi_CV.tex',
      fileSize: '2.4 MB',
      language: 'fr',
      downloadLabel: 'Télécharger CV',
      downloadEnabled: true,
    );

    await _firestore.collection('cv').doc(cv.id).set(cv.toJson());
    debugPrint('CV metadata seeded successfully');
  }

  Future<void> clearAllData() async {
    try {
      await Future.wait([
        _clearCollection('profile'),
        _clearCollection('social_links'),
        _clearCollection('skills'),
        _clearCollection('projects'),
        _clearCollection('experience'),
        _clearCollection('cv'),
      ]);
      debugPrint('All data cleared successfully!');
    } catch (e) {
      debugPrint('Error clearing data: $e');
      rethrow;
    }
  }

  Future<void> _clearCollection(String collectionPath) async {
    final collection = _firestore.collection(collectionPath);
    final snapshot = await collection.get();

    for (final doc in snapshot.docs) {
      await doc.reference.delete();
    }
    debugPrint('Collection $collectionPath cleared successfully');
  }
}