class AboutMeInfoModel {
  final String name;
  final String profession;
  final String location;
  final List<String> interests;
  final String experience;
  final String education;
  final String email;
  final String summary;
  final List<String> technicalInterests;
  final List<ToolModel> tools;

  AboutMeInfoModel({
    required this.name,
    required this.profession,
    required this.location,
    required this.interests,
    required this.experience,
    required this.education,
    required this.email,
    required this.summary,
    required this.technicalInterests,
    required this.tools,
  });

  factory AboutMeInfoModel.fromJson(Map<String, dynamic> json) {
    return AboutMeInfoModel(
      name: json['name'] as String,
      profession: json['profession'] as String,
      location: json['location'] as String,
      interests: List<String>.from(json['interests'] as List),
      experience: json['experience'] as String,
      education: json['education'] as String,
      email: json['email'] as String,
      summary: json['summary'] as String,
      technicalInterests: List<String>.from(json['technicalInterests'] as List),
      tools: (json['tools'] as List)
          .map((tool) => ToolModel.fromJson(tool as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'profession': profession,
      'location': location,
      'interests': interests,
      'experience': experience,
      'education': education,
      'email': email,
      'summary': summary,
      'technicalInterests': technicalInterests,
      'tools': tools.map((tool) => tool.toJson()).toList(),
    };
  }
}

class ToolModel {
  final String name;
  final String image;
  final String url;
  final String color;
  final double width;

  ToolModel({
    required this.name,
    required this.image,
    required this.url,
    required this.color,
    required this.width,
  });

  factory ToolModel.fromJson(Map<String, dynamic> json) {
    return ToolModel(
      name: json['name'] as String,
      image: json['image'] as String,
      url: json['url'] as String,
      color: json['color'] as String,
      width: json['width'] as double,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'image': image,
      'url': url,
      'color': color,
      'width': width,
    };
  }
}
