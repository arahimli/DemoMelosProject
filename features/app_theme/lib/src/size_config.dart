import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

/// Class to initialize calculation for responsiveness
/// must be called when the app is started

const _mobileDesignSize = Size(375, 812);
const _tabletDesignSize = Size(834, 1194);

enum DeviceType { unkown, mobile, tablet, desktop }

T getValueByScreen<T>({
  required T mobile,
  T? tablet,
  T? desktop,
}) {
  switch (SizeConfig.deviceType) {
    case DeviceType.mobile:
      return mobile;
    case DeviceType.tablet:
      return tablet ?? mobile;
    case DeviceType.desktop:
      return desktop ?? tablet ?? mobile;
    default:
      return mobile;
  }
}

class SizeConfig {
  /// [width] of current device
  static late double width;

  /// [height] of current device
  static late double height;

  /// value to get information about [orientation]
  static bool isPortrait = true;

  /// value to get information about [portrait] in in [mobile] or [not]
  static bool isMobilePortrait = false;

  static double widthMultiplier = 0;
  static double heightMultiplier = 0;

  /// type of current device the app running
  static DeviceType deviceType = DeviceType.unkown;

  /// the method to initialize [SizeConfig] for responsive calculation
  static void init(BoxConstraints constraints, Orientation orientation) {
    if (orientation == Orientation.portrait) {
      width = constraints.maxWidth;
      height = constraints.maxHeight;
    } else {
      width = constraints.maxHeight;
      height = constraints.maxWidth;
    }

    if (kIsWeb) {
    } else if (Platform.isAndroid || Platform.isIOS) {
      if ((orientation == Orientation.portrait && width < 600) ||
          (orientation == Orientation.landscape && height < 600)) {
        deviceType = DeviceType.mobile;
        widthMultiplier = width / _mobileDesignSize.width;
        heightMultiplier = height / _mobileDesignSize.height;
      } else {
        deviceType = DeviceType.tablet;
        widthMultiplier = width / _tabletDesignSize.width;
        heightMultiplier = height / _tabletDesignSize.height;
      }
    }
  }
}
