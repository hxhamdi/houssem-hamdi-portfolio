class SocialLink {
  final String id;
  final String platform;
  final String url;
  final String username;

  const SocialLink({
    required this.id,
    required this.platform,
    required this.url,
    required this.username,
  });

  factory SocialLink.fromJson(Map<String, dynamic> json, {String? id}) {
    return SocialLink(
      id: id ?? json['id'] ?? '',
      platform: json['platform'] ?? '',
      url: json['url'] ?? '',
      username: json['username'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'platform': platform,
      'url': url,
      'username': username,
    };
  }

  SocialLink copyWith({
    String? id,
    String? platform,
    String? url,
    String? username,
  }) {
    return SocialLink(
      id: id ?? this.id,
      platform: platform ?? this.platform,
      url: url ?? this.url,
      username: username ?? this.username,
    );
  }
}