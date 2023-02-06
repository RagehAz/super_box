import 'package:flutter/material.dart';
import 'package:super_image/super_image.dart';
import '../x_controllers/xxx_super_box_controller.dart';
import 'x_loading.dart';
/// => TAMAM
class BoxIcon extends StatelessWidget {
  /// --------------------------------------------------------------------------
  const BoxIcon({
    @required this.icon,
    @required this.loading,
    @required this.size,
    @required this.corners,
    @required this.greyscale,
    @required this.iconColor,
    @required this.iconSizeFactor,
    @required this.backgroundColor,
    @required this.package,
    @required this.isDisabled,
    Key key,
  }) : super(key: key);
  /// --------------------------------------------------------------------------
  final dynamic icon;
  final bool loading;
  final double size;
  final BorderRadius corners;
  final bool greyscale;
  final Color iconColor;
  final double iconSizeFactor;
  final Color backgroundColor;
  final String package;
  final bool isDisabled;
  /// --------------------------------------------------------------------------
  @override
  Widget build(BuildContext context) {

    final Color _iconColor = SuperBoxController.iconColor(
      colorOverride: iconColor,
      isDisabled: isDisabled,
      greyScale: greyscale,
    );

    if (loading == true){
      return Loading(
        loading: true,
        size: size,
        color: _iconColor,
      );
    }

    else {
      return SuperImage(
        key: const ValueKey<String>('DreamBoxIcon'),
        width: size,
        height: size,
        pic: icon,
        scale: iconSizeFactor,
        iconColor: _iconColor,
        loading: loading,
        greyscale: greyscale,
        corners: corners,
        backgroundColor: backgroundColor,
        package: package,
      );
    }

  }
  /// --------------------------------------------------------------------------
}