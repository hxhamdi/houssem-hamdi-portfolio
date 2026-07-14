import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:portfolio_website/models/profile_model.dart';
import 'package:portfolio_website/models/social_link_model.dart';
import 'package:portfolio_website/models/skill_model.dart';
import 'package:portfolio_website/models/project_model.dart';
import 'package:portfolio_website/models/experience_model.dart';
import 'package:portfolio_website/models/cv_model.dart';
import 'package:portfolio_website/repositories/portfolio_repository.dart';

class FirestorePortfolioRepository implements PortfolioRepository {
  final FirebaseFirestore _firestore;

  FirestorePortfolioRepository({FirebaseFirestore? firestore})
      : _firestore = firestore ?? FirebaseFirestore.instance;

  // Collection paths
  static const String _profilePath = 'profile';
  static const String _socialLinksPath = 'social_links';
  static const String _skillsPath = 'skills';
  static const String _projectsPath = 'projects';
  static const String _experiencePath = 'experience';
  static const String _cvPath = 'cv';

  @override
  Future<Profile> getProfile() async {
    final doc = await _firestore.collection(_profilePath).doc('main').get();
    return Profile.fromJson(doc.data() ?? {}, id: doc.id);
  }

  @override
  Future<void> updateProfile(Profile profile) async {
    await _firestore.collection(_profilePath).doc(profile.id).set(profile.toJson());
  }

  @override
  Future<List<SocialLink>> getSocialLinks() async {
    final snapshot = await _firestore.collection(_socialLinksPath).get();
    return snapshot.docs
        .map((doc) => SocialLink.fromJson(doc.data(), id: doc.id))
        .toList();
  }

  @override
  Future<SocialLink> getSocialLink(String id) async {
    final doc = await _firestore.collection(_socialLinksPath).doc(id).get();
    return SocialLink.fromJson(doc.data() ?? {}, id: doc.id);
  }

  @override
  Future<void> updateSocialLink(SocialLink link) async {
    await _firestore.collection(_socialLinksPath).doc(link.id).set(link.toJson());
  }

  @override
  Future<List<Skill>> getSkills() async {
    final snapshot = await _firestore.collection(_skillsPath).get();
    return snapshot.docs
        .map((doc) => Skill.fromJson(doc.data(), id: doc.id))
        .toList();
  }

  @override
  Future<List<Skill>> getSkillsByCategory(String category) async {
    final snapshot = await _firestore
        .collection(_skillsPath)
        .where('category', isEqualTo: category)
        .get();
    return snapshot.docs
        .map((doc) => Skill.fromJson(doc.data(), id: doc.id))
        .toList();
  }

  @override
  Future<Skill> getSkill(String id) async {
    final doc = await _firestore.collection(_skillsPath).doc(id).get();
    return Skill.fromJson(doc.data() ?? {}, id: doc.id);
  }

  @override
  Future<void> updateSkill(Skill skill) async {
    await _firestore.collection(_skillsPath).doc(skill.id).set(skill.toJson());
  }

  @override
  Future<List<Project>> getProjects() async {
    final snapshot = await _firestore
        .collection(_projectsPath)
        .orderBy('order')
        .get();
    return snapshot.docs
        .map((doc) => Project.fromJson(doc.data(), id: doc.id))
        .toList();
  }

  @override
  Future<List<Project>> getFeaturedProjects() async {
    final snapshot = await _firestore
        .collection(_projectsPath)
        .where('featured', isEqualTo: true)
        .orderBy('order')
        .get();
    return snapshot.docs
        .map((doc) => Project.fromJson(doc.data(), id: doc.id))
        .toList();
  }

  @override
  Future<Project> getProject(String id) async {
    final doc = await _firestore.collection(_projectsPath).doc(id).get();
    return Project.fromJson(doc.data() ?? {}, id: doc.id);
  }

  @override
  Future<void> updateProject(Project project) async {
    await _firestore.collection(_projectsPath).doc(project.id).set(project.toJson());
  }

  @override
  Future<List<Experience>> getExperience() async {
    final snapshot = await _firestore
        .collection(_experiencePath)
        .orderBy('order')
        .get();
    return snapshot.docs
        .map((doc) => Experience.fromJson(doc.data(), id: doc.id))
        .toList();
  }

  @override
  Future<List<Experience>> getExperienceByType(String type) async {
    final snapshot = await _firestore
        .collection(_experiencePath)
        .where('type', isEqualTo: type)
        .orderBy('order')
        .get();
    return snapshot.docs
        .map((doc) => Experience.fromJson(doc.data(), id: doc.id))
        .toList();
  }

  @override
  Future<Experience> getExperienceItem(String id) async {
    final doc = await _firestore.collection(_experiencePath).doc(id).get();
    return Experience.fromJson(doc.data() ?? {}, id: doc.id);
  }

  @override
  Future<void> updateExperience(Experience experience) async {
    await _firestore.collection(_experiencePath).doc(experience.id).set(experience.toJson());
  }

  @override
  Future<CV> getCV() async {
    final doc = await _firestore.collection(_cvPath).doc('metadata').get();
    return CV.fromJson(doc.data() ?? {}, id: doc.id);
  }

  @override
  Future<void> updateCV(CV cv) async {
    await _firestore.collection(_cvPath).doc(cv.id).set(cv.toJson());
  }
}