class ContactFormModel {
  final String name;
  final String countryCode;
  final String phoneNumber;
  final String email;
  final String message;

  ContactFormModel({
    required this.countryCode,
    required this.name,
    required this.phoneNumber,
    required this.email,
    required this.message,
  });

  factory ContactFormModel.fromJson(Map<String, dynamic> json) {
    return ContactFormModel(
      name: json['name'] as String,
      countryCode: json['country_code'] as String,
      phoneNumber: json['phone_number'] as String,
      email: json['email'] as String,
      message: json['message'] as String,
    );
  }

  Map<String, dynamic> toJson() => {
    'name': name,
    'country_code': countryCode,
    'phone_number': phoneNumber,
    'email': email,
    'message': message,
  };
}
