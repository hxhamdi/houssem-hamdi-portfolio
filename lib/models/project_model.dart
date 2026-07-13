class Project {
  final String id;
  final String title;
  final String description;
  final List<String> details;
  final List<String> techStack;
  final String url;
  final String demoUrl;
  final String image;
  final bool featured;
  final int order;

  const Project({
    required this.id,
    required this.title,
    required this.description,
    required this.details,
    required this.techStack,
    required this.url,
    required this.demoUrl,
    required this.image,
    required this.featured,
    required this.order,
  });

  factory Project.fromJson(Map<String, dynamic> json, {String? id}) {
    return Project(
      id: id ?? json['id'] ?? '',
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      details: List<String>.from(json['details'] ?? []),
      techStack: List<String>.from(json['techStack'] ?? []),
      url: json['url'] ?? '',
      demoUrl: json['demoUrl'] ?? '',
      image: json['image'] ?? '',
      featured: json['featured'] ?? false,
      order: json['order'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'description': description,
      'details': details,
      'techStack': techStack,
      'url': url,
      'demoUrl': demoUrl,
      'image': image,
      'featured': featured,
      'order': order,
    };
  }

  Project copyWith({
    String? id,
    String? title,
    String? description,
    List<String>? details,
    List<String>? techStack,
    String? url,
    String? demoUrl,
    String? image,
    bool? featured,
    int? order,
  }) {
    return Project(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      details: details ?? this.details,
      techStack: techStack ?? this.techStack,
      url: url ?? this.url,
      demoUrl: demoUrl ?? this.demoUrl,
      image: image ?? this.image,
      featured: featured ?? this.featured,
      order: order ?? this.order,
    );
  }
}