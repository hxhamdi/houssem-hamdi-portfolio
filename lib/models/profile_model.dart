class Profile {
  final String id;
  final String name;
  final String title;
  final String description;
  final String location;
  final String email;
  final String phone;
  final String availability;
  final String heroImage;

  const Profile({
    required this.id,
    required this.name,
    required this.title,
    required this.description,
    required this.location,
    required this.email,
    required this.phone,
    required this.availability,
    required this.heroImage,
  });

  factory Profile.fromJson(Map<String, dynamic> json, {String? id}) {
    return Profile(
      id: id ?? json['id'] ?? '',
      name: json['name'] ?? '',
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      location: json['location'] ?? '',
      email: json['email'] ?? '',
      phone: json['phone'] ?? '',
      availability: json['availability'] ?? '',
      heroImage: json['heroImage'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'title': title,
      'description': description,
      'location': location,
      'email': email,
      'phone': phone,
      'availability': availability,
      'heroImage': heroImage,
    };
  }

  Profile copyWith({
    String? id,
    String? name,
    String? title,
    String? description,
    String? location,
    String? email,
    String? phone,
    String? availability,
    String? heroImage,
  }) {
    return Profile(
      id: id ?? this.id,
      name: name ?? this.name,
      title: title ?? this.title,
      description: description ?? this.description,
      location: location ?? this.location,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      availability: availability ?? this.availability,
      heroImage: heroImage ?? this.heroImage,
    );
  }
}