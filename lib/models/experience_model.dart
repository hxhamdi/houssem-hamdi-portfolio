class Experience {
  final String id;
  final String role;
  final String company;
  final String period;
  final String description;
  final List<String> details;
  final List<String> techStack;
  final String url;
  final String type;
  final int order;

  const Experience({
    required this.id,
    required this.role,
    required this.company,
    required this.period,
    required this.description,
    required this.details,
    required this.techStack,
    required this.url,
    required this.type,
    required this.order,
  });

  factory Experience.fromJson(Map<String, dynamic> json, {String? id}) {
    return Experience(
      id: id ?? json['id'] ?? '',
      role: json['role'] ?? '',
      company: json['company'] ?? '',
      period: json['period'] ?? '',
      description: json['description'] ?? '',
      details: List<String>.from(json['details'] ?? []),
      techStack: List<String>.from(json['techStack'] ?? []),
      url: json['url'] ?? '',
      type: json['type'] ?? 'work',
      order: json['order'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'role': role,
      'company': company,
      'period': period,
      'description': description,
      'details': details,
      'techStack': techStack,
      'url': url,
      'type': type,
      'order': order,
    };
  }

  Experience copyWith({
    String? id,
    String? role,
    String? company,
    String? period,
    String? description,
    List<String>? details,
    List<String>? techStack,
    String? url,
    String? type,
    int? order,
  }) {
    return Experience(
      id: id ?? this.id,
      role: role ?? this.role,
      company: company ?? this.company,
      period: period ?? this.period,
      description: description ?? this.description,
      details: details ?? this.details,
      techStack: techStack ?? this.techStack,
      url: url ?? this.url,
      type: type ?? this.type,
      order: order ?? this.order,
    );
  }
}