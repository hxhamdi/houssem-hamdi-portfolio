import 'package:flutter/material.dart';
import 'package:portfolio_website/models/profile_model.dart';
import 'package:portfolio_website/models/social_link_model.dart';
import 'package:portfolio_website/models/skill_model.dart';
import 'package:portfolio_website/models/project_model.dart';
import 'package:portfolio_website/models/experience_model.dart';
import 'package:portfolio_website/models/cv_model.dart';
import 'package:portfolio_website/repositories/portfolio_repository.dart';

class PortfolioProvider with ChangeNotifier {
  final PortfolioRepository _repository;

  // Data
  Profile? _profile;
  List<SocialLink> _socialLinks = [];
  List<Skill> _skills = [];
  List<Project> _projects = [];
  List<Experience> _experience = [];
  CV? _cv;

  // Loading states
  bool _isLoading = false;
  bool _hasError = false;
  String _errorMessage = '';

  PortfolioProvider(this._repository) {
    loadAllData();
  }

  // Getters
  Profile? get profile => _profile;
  List<SocialLink> get socialLinks => _socialLinks;
  List<Skill> get skills => _skills;
  List<Project> get projects => _projects;
  List<Experience> get experience => _experience;
  CV? get cv => _cv;
  bool get isLoading => _isLoading;
  bool get hasError => _hasError;
  String get errorMessage => _errorMessage;

  List<Skill> getSkillsByCategory(String category) {
    return _skills.where((skill) => skill.category == category).toList();
  }

  List<Project> getFeaturedProjects() {
    return _projects.where((project) => project.featured).toList();
  }

  List<Experience> getExperienceByType(String type) {
    return _experience.where((exp) => exp.type == type).toList();
  }

  // Load all data
  Future<void> loadAllData() async {
    _isLoading = true;
    _hasError = false;
    notifyListeners();

    try {
      // Load all data in parallel
      await Future.wait([
        loadProfile(),
        loadSocialLinks(),
        loadSkills(),
        loadProjects(),
        loadExperience(),
        loadCV(),
      ]);
    } catch (e) {
      _hasError = true;
      _errorMessage = e.toString();
      debugPrint('Error loading portfolio data: $e');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  // Individual loaders
  Future<void> loadProfile() async {
    _profile = await _repository.getProfile();
    notifyListeners();
  }

  Future<void> loadSocialLinks() async {
    _socialLinks = await _repository.getSocialLinks();
    notifyListeners();
  }

  Future<void> loadSkills() async {
    _skills = await _repository.getSkills();
    notifyListeners();
  }

  Future<void> loadProjects() async {
    _projects = await _repository.getProjects();
    notifyListeners();
  }

  Future<void> loadExperience() async {
    _experience = await _repository.getExperience();
    notifyListeners();
  }

  Future<void> loadCV() async {
    _cv = await _repository.getCV();
    notifyListeners();
  }

  // Refresh data
  Future<void> refreshData() async {
    await loadAllData();
  }
}