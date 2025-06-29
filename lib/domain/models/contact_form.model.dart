class ContactFormModel {
  final String name;
  final String countryCode;
  final String phoneNumber;
  final String email;
  final String message;
  final String date;
  final String time;

  ContactFormModel({
    required this.countryCode,
    required this.name,
    required this.phoneNumber,
    required this.email,
    required this.message,
    required this.date,
    required this.time,
  });

  factory ContactFormModel.fromJson(Map<String, dynamic> json) {
    return ContactFormModel(
      name: json['name'] as String? ?? '',
      countryCode: json['countryCode'] as String? ?? '',
      phoneNumber: json['phoneNumber'] as String? ?? '',
      email: json['email'] as String? ?? '',
      message: json['message'] as String? ?? '',
      date: json['date'] as String? ?? '',
      time: json['time'] as String? ?? '',
    );
  }

  Map<String, dynamic> toJson() => {
    'name': name,
    'countryCode': countryCode,
    'phoneNumber': phoneNumber,
    'email': email,
    'message': message,
    'date': date,
    'time': time,
  };
}
