class ExperienceModel {
  final String title;
  final String company;
  final String startDate;
  final String endDate;
  final String description;
  final String location;
  final List<String> technologies;
  final bool current;

  ExperienceModel({
    required this.title,
    required this.company,
    required this.startDate,
    required this.endDate,
    required this.description,
    required this.location,
    required this.technologies,
    required this.current,
  });

  factory ExperienceModel.fromJson(Map<String, dynamic> json) {
    return ExperienceModel(
      title: json['title'] as String,
      company: json['company'] as String,
      startDate: json['startDate'] as String,
      endDate: json['endDate'] as String,
      description: json['description'] as String,
      location: json['location'] as String,
      technologies: List<String>.from(json['technologies'] as List<String>),
      current: json['current'] as bool,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'company': company,
      'startDate': startDate,
      'endDate': endDate,
      'description': description,
      'location': location,
      'technologies': technologies,
      'current': current,
    };
  }
}
