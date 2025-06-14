import 'package:flutter/cupertino.dart';
import 'package:responsive_builder/responsive_builder.dart';

int getCrossAxisCount(BuildContext context) {
  final deviceType = getDeviceType(MediaQuery.of(context).size);
  if (deviceType == DeviceScreenType.desktop) {
    return 3;
  } else if (deviceType == DeviceScreenType.tablet) {
    return 2;
  } else {
    return 1;
  }
}
