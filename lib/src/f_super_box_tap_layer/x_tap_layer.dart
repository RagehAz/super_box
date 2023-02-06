import 'dart:async';
import 'package:flutter/material.dart';
import '../x_controllers/xxx_super_box_controller.dart';
/// => TAMAM
class TapLayer extends StatelessWidget {
  /// --------------------------------------------------------------------------
  const TapLayer({
    @required this.width,
    @required this.height,
    @required this.splashColor,
    @required this.onTap,
    @required this.onTapUp,
    @required this.onTapDown,
    @required this.onTapCancel,
    @required this.isDisabled,
    @required this.onDisabledTap,
    @required this.onLongTap,
    @required this.onDoubleTap,
    Key key,
  }) : super(key: key);
  /// --------------------------------------------------------------------------
  final double width;
  final double height;
  final Color splashColor;
  final Function onTap;
  final Function onTapUp;
  final Function onTapDown;
  final Function onTapCancel;
  final bool isDisabled;
  final Function onDisabledTap;
  final Function onLongTap;
  final Function onDoubleTap;
  // --------------------------------------------------------------------------
  /// TESTED : WORKS PERFECT
  Future<void> onBoxTap() async {

    await SuperBoxController.onBoxTap(
        isDisabled: isDisabled,
        onDisabledTap: onDisabledTap,
        onTap: onTap
    );

  }
  // --------------------
  /// TESTED : WORKS PERFECT
  bool _canTap(){

    /// DEACTIVATED
    if (isDisabled == true){

      /// NO DEACTIVATED TAP
      if (onDisabledTap == null){
        return false;
      }
      /// CAN TAP DEACTIVATED
      else {
        return true;
      }
    }

    /// NOT DEACTIVATED
    else {

      if (onTap == null){
        return false;
      }
      else {
        return true;
      }

    }

  }
  // -----------------------------------------------------------------------------
  @override
  Widget build(BuildContext context) {

    return SizedBox(
      key: const ValueKey<String>('DreamBoxTapLayer'),
      width: width,
      height: height,
      child: Material(
        color: const Color.fromARGB(0, 255, 255, 255),
        child: GestureDetector(
          // onLongPress: onLongTap,
          onTapDown: isDisabled == true || onTapDown == null ?
              (TapDownDetails details) {}
              :
              (TapDownDetails details) => onTapDown(),
          onTapUp: isDisabled == true || onTapUp == null ?
              (TapUpDetails details) {}
              :
              (TapUpDetails details) => onTapUp(),
          child: InkWell(
            splashColor: isDisabled == true ? const Color.fromARGB(20, 255, 255, 255) : splashColor,
            onTap: _canTap() == true ? () => onBoxTap() : null,
            onTapCancel: onTapCancel,
            onLongPress: onLongTap,
            onDoubleTap: onDoubleTap,
          ),
        ),
      ),
    );

  }
  // -----------------------------------------------------------------------------
}
