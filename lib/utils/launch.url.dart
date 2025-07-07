import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/foundation.dart';

Future<void> launchUrlExternal(String url) async {
  final uri = Uri.parse(url);
  if (await canLaunchUrl(uri)) {
    await launchUrl(
      uri,
      mode: LaunchMode.platformDefault,
      webOnlyWindowName: kIsWeb ? '_blank' : null,
    );
  } else {
    throw 'Could not launch $url';
  }
}
