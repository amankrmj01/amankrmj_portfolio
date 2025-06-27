class PhoneValidationResponse {
  final String phone;
  final bool valid;
  final PhoneFormat format;
  final CountryInfo country;
  final String location;
  final String type;
  final String carrier;

  PhoneValidationResponse({
    required this.phone,
    required this.valid,
    required this.format,
    required this.country,
    required this.location,
    required this.type,
    required this.carrier,
  });

  factory PhoneValidationResponse.fromJson(Map<String, dynamic> json) {
    return PhoneValidationResponse(
      phone: json['phone'] as String,
      valid: json['valid'] as bool,
      format: PhoneFormat.fromJson(json['format']),
      country: CountryInfo.fromJson(json['country']),
      location: json['location'] as String,
      type: json['type'] as String,
      carrier: json['carrier'] as String,
    );
  }
}

class PhoneFormat {
  final String international;
  final String local;

  PhoneFormat({required this.international, required this.local});

  factory PhoneFormat.fromJson(Map<String, dynamic> json) {
    return PhoneFormat(
      international: json['international'] as String,
      local: json['local'] as String,
    );
  }
}

class CountryInfo {
  final String code;
  final String name;
  final String prefix;

  CountryInfo({required this.code, required this.name, required this.prefix});

  factory CountryInfo.fromJson(Map<String, dynamic> json) {
    return CountryInfo(
      code: json['code'] as String,
      name: json['name'] as String,
      prefix: json['prefix'] as String,
    );
  }
}
