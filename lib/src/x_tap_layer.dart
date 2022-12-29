import 'dart:async';
import 'package:flutter/material.dart';

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
    @required this.deactivated,
    @required this.onDeactivatedTap,
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
  final bool deactivated;
  final Function onDeactivatedTap;
  final Function onLongTap;
  final Function onDoubleTap;
  /// --------------------------------------------------------------------------
  Future<void> _onTap(BuildContext context) async {

    /// DEACTIVATED
    if (deactivated == true){

      /// NO DEACTIVATED TAP
      if (onDeactivatedTap == null){
        // do nothing
      }
      /// CAN TAP DEACTIVATED
      else {
        onDeactivatedTap();
      }
    }

    /// NOT DEACTIVATED
    else {

      /// CAN TAP
      if (onTap != null){

        // await Future.delayed(
        //     const Duration(milliseconds: 50,),
        //         () async { onTap(); }
        // );

        await onTap();

      }

    }

  }
  // -----------------------------------------------------------------------------
  bool _canTap(){

    /// DEACTIVATED
    if (deactivated == true){

      /// NO DEACTIVATED TAP
      if (onDeactivatedTap == null){
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
      width: width,
      height: height,
      child: Material(
        color: const Color.fromARGB(0, 255, 255, 255),
        child: GestureDetector(
          // onLongPress: onLongTap,
          onTapDown: deactivated == true || onTapDown == null ?
              (TapDownDetails details) {}
              :
              (TapDownDetails details) => onTapDown(),
          onTapUp: deactivated == true || onTapUp == null ?
              (TapUpDetails details) {}
              :
              (TapUpDetails details) => onTapUp(),
          child: InkWell(
            splashColor: deactivated == true ? const Color.fromARGB(20, 255, 255, 255) : splashColor,
            onTap: _canTap() == true ? () => _onTap(context) : null,
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
