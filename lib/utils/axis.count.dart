import 'package:flutter/cupertino.dart';

int getCrossAxisCount(BuildContext context) {
  final width = MediaQuery.of(context).size.width;
  if (width >= 1100) {
    return 3; // Desktop
  } else if (width >= 600) {
    return 2; // Tablet
  } else {
    return 1; // Mobile
  }
}
