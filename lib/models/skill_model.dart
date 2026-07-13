class Skill {
  final String id;
  final String category;
  final String name;
  final String icon;
  final String level;

  const Skill({
    required this.id,
    required this.category,
    required this.name,
    required this.icon,
    required this.level,
  });

  factory Skill.fromJson(Map<String, dynamic> json, {String? id}) {
    return Skill(
      id: id ?? json['id'] ?? '',
      category: json['category'] ?? '',
      name: json['name'] ?? '',
      icon: json['icon'] ?? '',
      level: json['level'] ?? 'intermediate',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'category': category,
      'name': name,
      'icon': icon,
      'level': level,
    };
  }

  Skill copyWith({
    String? id,
    String? category,
    String? name,
    String? icon,
    String? level,
  }) {
    return Skill(
      id: id ?? this.id,
      category: category ?? this.category,
      name: name ?? this.name,
      icon: icon ?? this.icon,
      level: level ?? this.level,
    );
  }
}