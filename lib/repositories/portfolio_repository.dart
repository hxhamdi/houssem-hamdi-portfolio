import 'package:portfolio_website/models/profile_model.dart';
import 'package:portfolio_website/models/social_link_model.dart';
import 'package:portfolio_website/models/skill_model.dart';
import 'package:portfolio_website/models/project_model.dart';
import 'package:portfolio_website/models/experience_model.dart';
import 'package:portfolio_website/models/cv_model.dart';

abstract class PortfolioRepository {
  // Profile
  Future<Profile> getProfile();
  Future<void> updateProfile(Profile profile);

  // Social Links
  Future<List<SocialLink>> getSocialLinks();
  Future<SocialLink> getSocialLink(String id);
  Future<void> updateSocialLink(SocialLink link);

  // Skills
  Future<List<Skill>> getSkills();
  Future<List<Skill>> getSkillsByCategory(String category);
  Future<Skill> getSkill(String id);
  Future<void> updateSkill(Skill skill);

  // Projects
  Future<List<Project>> getProjects();
  Future<List<Project>> getFeaturedProjects();
  Future<Project> getProject(String id);
  Future<void> updateProject(Project project);

  // Experience
  Future<List<Experience>> getExperience();
  Future<List<Experience>> getExperienceByType(String type);
  Future<Experience> getExperienceItem(String id);
  Future<void> updateExperience(Experience experience);

  // CV
  Future<CV> getCV();
  Future<void> updateCV(CV cv);
}