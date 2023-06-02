import 'size_config.dart';

/// Extension to use values using [num]
extension SizeExt on num {
  /// [getter] to get [responsive height] according to device height
  double get h {
    return SizeConfig.heightMultiplier * this;
  }

  /// [getter] to get [responsive width] according to device width
  double get w {
    return SizeConfig.widthMultiplier * this;
  }
}
