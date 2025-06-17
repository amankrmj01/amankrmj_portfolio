class SocialLinksModel {
  final String github;
  final String linkedIn;
  final String twitter;
  final String instagram;
  final String facebook;
  final String medium;
  final String email;
  final String resume;
  final String discord;
  final String phoneNumber;
  final String hackerrank;
  final String leetcode;

  SocialLinksModel({
    required this.github,
    required this.linkedIn,
    required this.twitter,
    required this.instagram,
    required this.facebook,
    required this.medium,
    required this.email,
    required this.resume,
    required this.discord,
    required this.phoneNumber,
    required this.hackerrank,
    required this.leetcode,
  });

  factory SocialLinksModel.fromJson(Map<String, dynamic> json) {
    return SocialLinksModel(
      github: json['github'] as String,
      linkedIn: json['linkedIn'] as String,
      twitter: json['twitter'] as String,
      instagram: json['instagram'] as String,
      facebook: json['facebook'] as String,
      medium: json['medium'] as String,
      email: json['email'] as String,
      resume: json['resume'] as String,
      discord: json['discord'] as String,
      phoneNumber: json['phoneNumber'] as String,
      hackerrank: json['hackerrank'] as String,
      leetcode: json['leetcode'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'github': github,
      'linkedIn': linkedIn,
      'twitter': twitter,
      'instagram': instagram,
      'facebook': facebook,
      'medium': medium,
      'email': email,
      'resume': resume,
      'discord': discord,
      'phoneNumber': phoneNumber,
      'hackerrank': hackerrank,
      'leetcode': leetcode,
    };
  }
}
