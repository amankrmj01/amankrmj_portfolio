class CertificateModel {
  final String name;
  final String description;
  final String url;
  final List<String> images;
  final String largeDescription;
  final String issuingOrganization;
  final String issueDate;
  final List<String> skills;
  final String type;

  CertificateModel({
    required this.name,
    required this.description,
    required this.url,
    required this.images,
    required this.largeDescription,
    required this.issuingOrganization,
    required this.issueDate,
    required this.skills,
    required this.type,
  });

  factory CertificateModel.fromJson(Map<String, dynamic> json) {
    return CertificateModel(
      name: json['name'] as String,
      description: json['description'] as String,
      url: json['url'] as String,
      images: List<String>.from(json['images'] as List),
      largeDescription: json['largeDescription'] as String,
      issuingOrganization: json['issuingOrganization'] as String,
      issueDate: json['issueDate'] as String,
      skills: List<String>.from(json['skills'] as List),
      type: json['type'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'description': description,
      'url': url,
      'images': images,
      'largeDescription': largeDescription,
      'issuingOrganization': issuingOrganization,
      'issueDate': issueDate,
      'skills': skills,
      'type': type,
    };
  }
}
