import 'package:flutter/material.dart';
import '../a_the_box_of_super_box/x_custom_box_shadow.dart';
import '../x_controllers/z_helper_methods.dart';
/// => TAMAM
class BoxHighlight extends StatelessWidget {
  /// --------------------------------------------------------------------------
  const BoxHighlight({
    @required this.width,
    @required this.height,
    @required this.corners,
    Key key,
  }) : super(key: key);
  /// --------------------------------------------------------------------------
  final double width;
  final double height;
  final dynamic corners;
  /// --------------------------------------------------------------------------
  @override
  Widget build(BuildContext context) {

    return Container(
      key: const ValueKey<String>('DreamBoxHighlight'),
      width: width,
      height: height * 0.27,
      decoration: BoxDecoration(
        // color: Colorz.White,
        borderRadius: BorderRadius.circular(getCornersAsDouble(corners) - (height * 0.8)),
        boxShadow: <BoxShadow>[

          CustomBoxShadow(
              color: const Color.fromARGB(50, 255, 255, 255),
              offset: Offset(0, height * -0.33),
              blurRadius: height * 0.2,
          ),

        ],

      ),
    );

  }
  /// --------------------------------------------------------------------------
}
