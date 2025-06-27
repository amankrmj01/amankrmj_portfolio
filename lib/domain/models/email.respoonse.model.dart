class EmailValidationResponse {
  final String email;
  final String autocorrect;
  final String deliverability;
  final String qualityScore;
  final BoolText isValidFormat;
  final BoolText isFreeEmail;
  final BoolText isDisposableEmail;
  final BoolText isRoleEmail;
  final BoolText isCatchallEmail;
  final BoolText isMxFound;
  final BoolText isSmtpValid;

  EmailValidationResponse({
    required this.email,
    required this.autocorrect,
    required this.deliverability,
    required this.qualityScore,
    required this.isValidFormat,
    required this.isFreeEmail,
    required this.isDisposableEmail,
    required this.isRoleEmail,
    required this.isCatchallEmail,
    required this.isMxFound,
    required this.isSmtpValid,
  });

  factory EmailValidationResponse.fromJson(Map<String, dynamic> json) {
    return EmailValidationResponse(
      email: json['email'] as String,
      autocorrect: json['autocorrect'] as String,
      deliverability: json['deliverability'] as String,
      qualityScore: json['quality_score'] as String,
      isValidFormat: BoolText.fromJson(json['is_valid_format']),
      isFreeEmail: BoolText.fromJson(json['is_free_email']),
      isDisposableEmail: BoolText.fromJson(json['is_disposable_email']),
      isRoleEmail: BoolText.fromJson(json['is_role_email']),
      isCatchallEmail: BoolText.fromJson(json['is_catchall_email']),
      isMxFound: BoolText.fromJson(json['is_mx_found']),
      isSmtpValid: BoolText.fromJson(json['is_smtp_valid']),
    );
  }
}

class BoolText {
  final bool value;
  final String text;

  BoolText({required this.value, required this.text});

  factory BoolText.fromJson(Map<String, dynamic> json) {
    return BoolText(value: json['value'] as bool, text: json['text'] as String);
  }
}
