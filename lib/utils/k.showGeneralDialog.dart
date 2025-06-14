import 'package:flutter/material.dart';
import 'dart:ui';

typedef DialogBuilder = Widget Function(BuildContext context);

dynamic showBlurredGeneralDialog({
  required BuildContext context,
  required DialogBuilder builder,
  String barrierLabel = 'Dialog',
  Color barrierColor = const Color(0x66000000),
}) {
  return showGeneralDialog(
    context: context,
    barrierDismissible: true,
    barrierLabel: barrierLabel,
    barrierColor: barrierColor,
    pageBuilder: (context, anim1, anim2) {
      return BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
        child: builder(context),
      );
    },
    transitionBuilder: (context, anim1, anim2, child) {
      return FadeTransition(
        opacity: CurvedAnimation(parent: anim1, curve: Curves.easeInOut),
        child: child,
      );
    },
  );
}
