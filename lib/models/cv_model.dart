class CV {
  final String id;
  final String title;
  final String version;
  final DateTime lastUpdated;
  final String description;
  final String pdfAssetPath;
  final String texAssetPath;
  final String fileSize;
  final String language;
  final String downloadLabel;
  final bool downloadEnabled;

  const CV({
    required this.id,
    required this.title,
    required this.version,
    required this.lastUpdated,
    required this.description,
    required this.pdfAssetPath,
    required this.texAssetPath,
    required this.fileSize,
    required this.language,
    required this.downloadLabel,
    required this.downloadEnabled,
  });

  factory CV.fromJson(Map<String, dynamic> json, {String? id}) {
    return CV(
      id: id ?? json['id'] ?? '',
      title: json['title'] ?? '',
      version: json['version'] ?? '',
      lastUpdated: json['lastUpdated'] != null
          ? DateTime.parse(json['lastUpdated'])
          : DateTime.now(),
      description: json['description'] ?? '',
      pdfAssetPath: json['pdfAssetPath'] ?? '',
      texAssetPath: json['texAssetPath'] ?? '',
      fileSize: json['fileSize'] ?? '',
      language: json['language'] ?? 'fr',
      downloadLabel: json['downloadLabel'] ?? 'Télécharger CV',
      downloadEnabled: json['downloadEnabled'] ?? true,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'version': version,
      'lastUpdated': lastUpdated.toIso8601String(),
      'description': description,
      'pdfAssetPath': pdfAssetPath,
      'texAssetPath': texAssetPath,
      'fileSize': fileSize,
      'language': language,
      'downloadLabel': downloadLabel,
      'downloadEnabled': downloadEnabled,
    };
  }

  CV copyWith({
    String? id,
    String? title,
    String? version,
    DateTime? lastUpdated,
    String? description,
    String? pdfAssetPath,
    String? texAssetPath,
    String? fileSize,
    String? language,
    String? downloadLabel,
    bool? downloadEnabled,
  }) {
    return CV(
      id: id ?? this.id,
      title: title ?? this.title,
      version: version ?? this.version,
      lastUpdated: lastUpdated ?? this.lastUpdated,
      description: description ?? this.description,
      pdfAssetPath: pdfAssetPath ?? this.pdfAssetPath,
      texAssetPath: texAssetPath ?? this.texAssetPath,
      fileSize: fileSize ?? this.fileSize,
      language: language ?? this.language,
      downloadLabel: downloadLabel ?? this.downloadLabel,
      downloadEnabled: downloadEnabled ?? this.downloadEnabled,
    );
  }
}