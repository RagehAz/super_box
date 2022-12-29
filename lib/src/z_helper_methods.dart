import 'dart:io';
import 'package:flutter/material.dart';
// -----------------------------------------------------------------------------
/// TESTED : WORKS PERFECT
extension FileExtention on FileSystemEntity {
  String get fileNameWithExtension {
    return this?.path?.split('/')?.last;
  }

  // -----------------------------------------------------------------------------
  String get fileExtension {
    return this?.path?.split('.')?.last;
  }
}
// -----------------------------------------------------------------------------
/// TESTED : WORKS PERFECT
String fileExtensionOf(dynamic file) {

  if (file == null){
    return null;
  }
  else if (file is String){
    return File(file).fileExtension;
  }
  else {
    return null;
  }

}
// -----------------------------------------------------------------------------
/// TESTED : WORKS PERFECT
BorderRadius getCornersAsBorderRadius(BuildContext context, dynamic corners) {
  BorderRadius _cornerBorders;

  if (corners == 0) {
    _cornerBorders = BorderRadius.zero;
  }

  else if (corners.runtimeType == BorderRadius) {
    _cornerBorders = corners;
  }

  else {
    _cornerBorders = cornerAll(context, corners?.toDouble());
  }

  return _cornerBorders;
}
// -----------------------------------------------------------------------------
/// TESTED : WORKS PERFECT
double getCornersAsDouble(dynamic corners) {
  double _topLeftCorner = 0;

  if (corners != null){

    if (corners.runtimeType == BorderRadius) {
      final BorderRadius _cornerBorders = corners;
      final Radius _topLeftCornerRadius = _cornerBorders?.topLeft;
      _topLeftCorner = _topLeftCornerRadius?.x;
// print('_topLeftCorner : $_topLeftCorner');
    }

    else {
      _topLeftCorner = corners?.toDouble();
    }


  }

  return _topLeftCorner;
}
// -----------------------------------------------------------------------------
/// TESTED : WORKS PERFECT
BorderRadius cornerAll(BuildContext context, double corners) {
  return BorderRadius.all(Radius.circular(corners));
}
// -----------------------------------------------------------------------------
/// TESTED : WORKS PERFECT
EdgeInsets superMargins({dynamic margin}) {

  if (margin == null || margin == 0){
    return EdgeInsets.zero;
  }

  else if (margin.runtimeType == double){
    return EdgeInsets.all(margin);
  }

  else if (margin.runtimeType == int){
    return EdgeInsets.all(margin.toDouble());
  }

  else if (margin.runtimeType == EdgeInsets){
    return margin;
  }

  else {
    return margin;
  }

}
// --------------------
/// TESTED : WORKS PERFECT
bool objectIsSVG(dynamic object) {
  bool _isSVG = false;

  if (fileExtensionOf(object) == 'svg') {
    _isSVG = true;
  }

  else {
    _isSVG = false;
  }

  return _isSVG;
}
// --------------------
/// TESTED : WORKS PERFECT
Alignment superCenterAlignment({
  @required bool appIsLTR
}) {
  return appIsLTR == true ?
  Alignment.centerLeft
      :
  Alignment.centerRight;
}
// --------------------
