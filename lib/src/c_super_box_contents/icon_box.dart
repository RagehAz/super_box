import 'package:flutter/material.dart';
import 'x_box_icon.dart';
import '../x_controllers/z_helper_methods.dart';
/// TAMAM
class SuperBoxIcon extends StatelessWidget {
  /// --------------------------------------------------------------------------
  const SuperBoxIcon({
    @required this.height,
    @required this.corners,
    @required this.icon,
    @required this.loading,
    @required this.iconColor,
    @required this.greyScale,
    @required this.iconSizeFactor,
    @required this.backgroundColor,
    @required this.package,
    @required this.isDisabled,
    Key key
  }) : super(key: key);
  /// --------------------------------------------------------------------------
  final double height;
  final BorderRadius corners;
  final String icon;
  final bool loading;
  final Color iconColor;
  final bool greyScale;
  final double iconSizeFactor;
  final Color backgroundColor;
  final String package;
  final bool isDisabled;
  /// --------------------------------------------------------------------------
  @override
  Widget build(BuildContext context) {

    final double _jpgGraphicWidth = height * iconSizeFactor;

    return Container(
      key: const ValueKey<String>('DreamIconBox'),
      width: height,
      height: height,
      alignment: Alignment.topCenter,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[

          /// ICON
          Container(
            width: height,
            height: height,
            decoration: BoxDecoration(
              borderRadius: corners,
              // color: Colorz.BloodTest
            ),
            child: Stack(
              alignment: Alignment.center,
              children: <Widget>[

                BoxIcon(
                  icon: icon,
                  loading: loading,
                  size: height,
                  corners: corners,
                  greyscale: greyScale,
                  iconColor: iconColor,
                  iconSizeFactor: iconSizeFactor,
                  backgroundColor: backgroundColor,
                  package: package,
                  isDisabled: isDisabled,
                ),

                /// --- BUTTON BLACK LAYER IF GREYED OUT
                if (greyScale == true && icon != null && fileExtensionOf(icon) != 'svg')
                  Container(
                    height: _jpgGraphicWidth,
                    width: _jpgGraphicWidth,
                    decoration: BoxDecoration(
                      // color: Colorz.Yellow,
                      borderRadius: corners,
                      gradient: const LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: <Color>[
                            Color.fromARGB(80, 0, 0, 0),
                            Color.fromARGB(125, 0, 0, 0),
                          ],
                          stops: <double>[
                            0.5,
                            1
                          ]),
                    ),
                  ),

              ],

            ),
          ),

        ],
      ),
    );
  }
  /// --------------------------------------------------------------------------
}
