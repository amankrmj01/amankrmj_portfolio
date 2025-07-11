import 'package:portfolio/infrastructure/theme/colors.dart';
import 'package:flutter/material.dart';

final ThemeData kDarkTheme = ThemeData(
  brightness: Brightness.dark,
  primaryColor: KColor.secondaryColor,
  secondaryHeaderColor: const Color(0xFF2A2A2A),
  scaffoldBackgroundColor: const Color(0xFF1A1A2E),
  fontFamily: 'Poppins',
  fontFamilyFallback: ['Poppins'],
);
