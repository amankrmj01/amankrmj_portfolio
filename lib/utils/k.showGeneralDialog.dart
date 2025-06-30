import 'package:flutter/material.dart';

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
      return Container(
        color: Colors.black.withAlpha((255 * 0.5).toInt()),
        child: builder(context),
      );
    },
    transitionBuilder: (context, anim1, anim2, child) {
      return RepaintBoundary(
        child: FadeTransition(
          opacity: CurvedAnimation(parent: anim1, curve: Curves.easeInOut),
          child: child,
        ),
      );
    },
  );
}
