class Experience {
  final String title;
  final String company;
  final String startDate;
  final String endDate;
  final String description;
  final String location;
  final List<String> technologies;
  final bool current;

  Experience({
    required this.title,
    required this.company,
    required this.startDate,
    required this.endDate,
    required this.description,
    required this.location,
    required this.technologies,
    required this.current,
  });

  factory Experience.fromMap(Map<String, dynamic> map) {
    return Experience(
      title: map['title'] ?? '',
      company: map['company'] ?? '',
      startDate: map['startDate'] ?? '',
      endDate: map['endDate'] ?? '',
      description: map['description'] ?? '',
      location: map['location'] ?? '',
      technologies: List<String>.from(map['technologies'] ?? []),
      current: map['current'] ?? false,
    );
  }
}
