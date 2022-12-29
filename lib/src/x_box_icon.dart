import 'package:flutter/material.dart';
import 'package:super_image/super_image.dart';

class BoxIcon extends StatelessWidget {
  /// --------------------------------------------------------------------------
  const BoxIcon({
    @required this.icon,
    @required this.loading,
    @required this.size,
    @required this.corners,
    @required this.iconMargin,
    @required this.greyscale,
    @required this.bubble,
    @required this.iconColor,
    @required this.iconSizeFactor,
    @required this.backgroundColor,
    @required this.package,
    Key key,
  }) : super(key: key);
  /// --------------------------------------------------------------------------
  final dynamic icon;
  final bool loading;
  final double size;
  final BorderRadius corners;
  final double iconMargin;
  final bool greyscale;
  final bool bubble;
  final Color iconColor;
  final double iconSizeFactor;
  final Color backgroundColor;
  final String package;
  /// --------------------------------------------------------------------------
  @override
  Widget build(BuildContext context) {

    return SuperImage(
      key: const ValueKey<String>('DreamBoxIcon'),
      width: size,
      height: size,
      pic: icon,
      // boxFit: BoxFit.cover,
      scale: iconSizeFactor,
      iconColor: iconColor,
      loading: loading,
      greyscale: greyscale,
      corners: corners,
      backgroundColor: backgroundColor,
      package: package,
    );

  }
  /// --------------------------------------------------------------------------
}
