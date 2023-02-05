import 'package:flutter/material.dart';
import 'x_box_gradient.dart';
import 'x_box_highlight.dart';
import 'x_tap_layer.dart';
import 'x_icon_text_second_line.dart';
import 'z_helper_methods.dart';
import 'x_the_box_of_super_box.dart';

class SuperBox extends StatelessWidget {
  /// --------------------------------------------------------------------------
  const SuperBox({
    @required this.height,
    this.width,
    this.icon,
    this.iconSizeFactor = 1,
    this.color = const Color.fromARGB(0, 255, 255, 255),
    this.corners,
    this.iconColor,
    this.verse,
    this.verseColor = const Color.fromARGB(255, 255, 255, 255),
    this.verseWeight = FontWeight.w400,
    this.verseScaleFactor = 1,
    this.verseShadow,
    this.verseItalic = false,
    this.verseMaxLines = 1,
    this.secondVerseMaxLines = 10,
    this.onTap,
    this.margins,
    this.greyscale = false,
    this.iconRounded = true,
    this.bubble = true,
    this.secondLine,
    this.verseCentered = true,
    this.subChild,
    this.childAlignment = Alignment.center,
    this.opacity = 1,
    this.isDisabled = false,
    this.splashColor = const Color.fromARGB(10, 255, 255, 255),
    this.onTapDown,
    this.onTapUp,
    this.onTapCancel,
    this.textDirection = TextDirection.ltr,
    this.blur,
    this.secondLineColor = const Color.fromARGB(255, 255, 255, 255),
    this.redDot = false,
    this.secondLineScaleFactor = 1,
    this.loading = false,
    this.iconBackgroundColor,
    this.onDeactivatedTap,
    this.verseHighlight,
    this.verseHighlightColor = const Color.fromARGB(100, 255, 0, 0),
    this.onLongTap,
    this.onDoubleTap,
    this.appIsLTR = true,
    this.package,
    Key key,
  }) : super(key: key);
  /// --------------------------------------------------------------------------
  final dynamic icon;
  /// works as a verseSizeFactor as well
  final double iconSizeFactor;
  final Color color;
  final double width;
  final double height;
  final dynamic corners;
  final Color iconColor;
  final String verse;
  final Color verseColor;
  final FontWeight verseWeight;
  final double verseScaleFactor;
  final bool verseShadow;
  final bool verseItalic;
  final int verseMaxLines;
  final int secondVerseMaxLines;
  final Function onTap;
  final dynamic margins;
  final bool greyscale;
  final bool iconRounded;
  final bool bubble;
  final String secondLine;
  final bool verseCentered;
  final Widget subChild;
  final Alignment childAlignment;
  final double opacity;
  final bool isDisabled;
  final Color splashColor;
  final Function onTapDown;
  final Function onTapUp;
  final Function onTapCancel;
  final TextDirection textDirection;
  final double blur;
  final Color secondLineColor;
  final bool redDot;
  final double secondLineScaleFactor;
  final bool loading;
  final Color iconBackgroundColor;
  final Function onDeactivatedTap;
  final ValueNotifier<dynamic> verseHighlight;
  final Color verseHighlightColor;
  final Function onLongTap;
  final Function onDoubleTap;
  final bool appIsLTR;
  final String package;
  /// --------------------------------------------------------------------------
  static Color getIconColor({
    bool blackAndWhite = false,
    bool inActiveMode = false,
    Color colorOverride
  }) {

    if (blackAndWhite == true || inActiveMode == true){
      return const Color.fromARGB(30, 255, 255, 255);
    }
    else {
      return colorOverride;
    }

  }
  // --------------------
  static double graphicWidth({
    dynamic icon,
    double height,
    bool loading,
    double iconSizeFactor,
  }) {

    if (icon == null && loading == false){
      return 0;
    }
    else if (
    fileExtensionOf(icon) == 'svg' ||
    fileExtensionOf(icon) == 'jpg' ||
    fileExtensionOf(icon) == 'jpeg' ||
    fileExtensionOf(icon) == 'png'
    ){
      return height * iconSizeFactor;
    }
    else {
      return height;
    }

  }
  // --------------------
  static double iconMargin({
    dynamic icon,
    double height,
    double graphicWidth,
    String verse,
  }) {

    if (verse == null || icon == null){
      return 0;
    }
    else {
      return (height - graphicWidth) / 2;
    }

  }
  // --------------------
  static Color boxColor({
    bool blackAndWhite,
    Color color
  }) {

    if (blackAndWhite == true && color != const Color.fromARGB(0, 255, 255, 255)){
      return  const Color.fromARGB(80, 121, 121, 121);
    }
    else if (color == const Color.fromARGB(0, 255, 255, 255) && blackAndWhite == true){
      return const Color.fromARGB(0, 255, 255, 255);
    }
    else {
      return color;
    }

  }
  // --------------------
  static BorderRadius boxCorners = const BorderRadius.all(Radius.circular(12));
  // --------------------
  static BorderRadius getBoxCorners({
    @required BuildContext context,
    @required dynamic cornersOverride,
  }){

    if (cornersOverride == null){
      return boxCorners;
    }
    else {
      return getCornersAsBorderRadius(context, cornersOverride ?? 0);
    }

  }
  // -----------------------------------------------------------------------------
  @override
  Widget build(BuildContext context) {
    // --------------------
    final BorderRadius _boxCorners = getBoxCorners(
      context: context,
      cornersOverride: corners,
    );
    // --------------------
    return TheBoxOfSuperBox(
      key: const ValueKey<String>('Dream_box_the_box'),
      isDisabled: isDisabled,
      opacity: opacity,
      boxMargins: superMargins(margin: margins),
      width: width,
      height: height,
      boxColor: boxColor(
        color: color,
        blackAndWhite: greyscale,
      ),
      cornersAsBorderRadius: _boxCorners,
      children: <Widget>[

        // /// --- BLUR LAYER
        // if (blur != null)
        //   BlurLayer(
        //     width: width,
        //     height: height,
        //     blur: blur,
        //     borders: _cornersAsBorderRadius,
        //   ),

        /// --- DREAM CHILD
        if (subChild != null)
          Container(
            height: height,
            width: width,
            decoration: BoxDecoration(
              borderRadius: _boxCorners,
            ),
            alignment: childAlignment,
            child: subChild,
          ),

        /// ICON - VERSE - SECOND LINE
        IconTextSecondLine(
          key: const ValueKey<String>('DreamBoxIconVerseSecondLine'),
          package: package,
          verse: verse,
          textDirection: textDirection,
          icon: icon,
          loading: loading,
          height: height,
          width: width,
          iconCorners: getCornersAsBorderRadius(context, _boxCorners),
          iconMargin: iconMargin(
            height: height,
            icon: icon,
            verse: verse,
            graphicWidth: graphicWidth(
              icon: icon,
              height: height,
              iconSizeFactor: iconSizeFactor,
              loading: loading,
            ),
          ),
          greyscale: greyscale,
          bubble: bubble,
          iconColor: getIconColor(
            inActiveMode: isDisabled,
            blackAndWhite: greyscale,
            colorOverride: iconColor,
          ),
          iconSizeFactor: iconSizeFactor,
          verseScaleFactor: verseScaleFactor,
          verseCentered: verseCentered,
          secondLine: secondLine,
          verseSize: iconSizeFactor == 1 ? 4 : 4,
          verseWeight: verseWeight,
          inActiveMode: isDisabled,
          verseColor: verseColor,
          verseShadow: verseShadow,
          verseMaxLines: verseMaxLines,
          secondVerseMaxLines: secondVerseMaxLines,
          verseItalic: verseItalic,
          redDot: redDot,
          secondLineScaleFactor: secondLineScaleFactor,
          secondLineColor: secondLineColor,
          centered: verseCentered,
          backgroundColor: iconBackgroundColor,
          highlight: verseHighlight,
          highlightColor: verseHighlightColor,
          appIsLTR: appIsLTR,
        ),

        /// --- BOX HIGHLIGHT
        if (bubble == true)
          BoxHighlight(
              key: const ValueKey<String>('DreamBoxHighlight'),
              width: width,
              height: height,
              corners: _boxCorners
          ),

        /// --- BOX GRADIENT
        if (bubble == true)
          BoxGradient(
            key: const ValueKey<String>('DreamBoxGradient'),
            width: width,
            height: height,
            corners: _boxCorners,
          ),

        /// --- RIPPLE & TAP LAYER
        if (onTap != null || onDeactivatedTap != null || onLongTap != null || onDoubleTap != null)
          TapLayer(
            key: const ValueKey<String>('DreamBoxTapLayer'),
            width: width,
            height: height,
            splashColor: splashColor,
            onTap: onTap,
            onTapUp: onTapUp,
            onTapDown: onTapDown,
            onTapCancel: onTapCancel,
            deactivated: isDisabled,
            onDeactivatedTap: onDeactivatedTap,
            onLongTap: onLongTap,
            onDoubleTap: onDoubleTap,
          ),

      ],
    );
    // --------------------
  }
// -----------------------------------------------------------------------------
}
