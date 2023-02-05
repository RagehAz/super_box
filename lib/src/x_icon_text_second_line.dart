import 'package:flutter/material.dart';
import 'package:super_text/super_text.dart';

import '../super_box.dart';
import 'x_box_icon.dart';
import 'z_helper_methods.dart';

class IconTextSecondLine extends StatelessWidget {
  /// --------------------------------------------------------------------------
  const IconTextSecondLine({
    @required this.verse,
    @required this.textDirection,
    @required this.icon,
    @required this.loading,
    @required this.height,
    @required this.width,
    @required this.iconCorners,
    @required this.iconMargin,
    @required this.greyscale,
    @required this.bubble,
    @required this.iconColor,
    @required this.iconSizeFactor,
    @required this.verseScaleFactor,
    @required this.verseCentered,
    @required this.secondLine,
    @required this.verseSize,
    @required this.textWeight,
    @required this.inActiveMode,
    @required this.verseColor,
    @required this.verseShadow,
    @required this.verseMaxLines,
    @required this.secondVerseMaxLines,
    @required this.verseItalic,
    @required this.redDot,
    @required this.secondLineScaleFactor,
    @required this.secondLineColor,
    @required this.centered,
    @required this.backgroundColor,
    @required this.highlight,
    @required this.highlightColor,
    @required this.appIsLTR,
    @required this.package,
    @required this.textFont,
    Key key,
  }) : super(key: key);
  /// --------------------------------------------------------------------------
  final String verse;
  final TextDirection textDirection;
  final dynamic icon;
  final bool loading;
  final double width;
  final double height;
  final BorderRadius iconCorners;
  final double iconMargin;
  final bool greyscale;
  final bool bubble;
  final Color iconColor;
  final double iconSizeFactor;
  final double verseScaleFactor;
  final bool verseCentered;
  final String secondLine;
  final int verseSize;
  final FontWeight textWeight;
  final bool inActiveMode;
  final Color verseColor;
  final bool verseShadow;
  final int verseMaxLines;
  final int secondVerseMaxLines;
  final bool verseItalic;
  final bool redDot;
  final double secondLineScaleFactor;
  final Color secondLineColor;
  final bool centered;
  final Color backgroundColor;
  final ValueNotifier<dynamic> highlight;
  final Color highlightColor;
  final bool appIsLTR;
  final String package;
  final String textFont;
  // ----------------------------------------------------------------------------
  /// TESTED : WORKS PERFECT
  static CrossAxisAlignment versesCrossAlignment({
    dynamic icon,
    TextDirection textDirection,
    String secondLine,
    bool verseCentered
  }) {

    final CrossAxisAlignment _versesCrossAlignment =
    verseCentered ? CrossAxisAlignment.center
    :
    icon == null && textDirection == null && secondLine == null ?
    CrossAxisAlignment.center
        :
    textDirection != null ?
    CrossAxisAlignment.start // dunno why
        :
    (icon != null && secondLine != null) || (verseCentered == false) ?
    CrossAxisAlignment.start
        :
    CrossAxisAlignment.center; // verseCentered

    return _versesCrossAlignment;
  }
  // --------------------
  static double verseHorizontalMargin = 5;
  // --------------------
  /// TESTED : WORKS PERFECT
  static double verseWidth({
    @required double width,
    @required double iconMargin,
    @required double graphicWidth,
    @required bool hasIcon,
  }) {

    double _output;

    if (width != null){

      if (hasIcon == true){
        return  width
            - (iconMargin * 2)
            - graphicWidth
            // - ((verseIconSpacing * 2) + iconMargin);
            - getVerseLeftSpacing(iconMargin: iconMargin)
            - getVerseRightSpacing(iconMargin: iconMargin);
      }

      else {
        return width - 10;
      }

    }

    return _output;
  }
  // --------------------
  // /// TESTED : WORKS PERFECT
  // static double verseIconSpacing({
  //   @required double height,
  //   @required Verse verse,
  //   @required double iconSizeFactor,
  //   @required double verseScaleFactor,
  //   @required bool hasIcon,
  // }) {
  //
  //   if (hasIcon == false){
  //     return 0;
  //   }
  //   else if (verse?.text != null){
  //     return height * 0.3 * iconSizeFactor * verseScaleFactor;
  //   }
  //   else {
  //     return 0;
  //   }
  // }
  // --------------------
  /// TESTED : WORKS PERFECT
  static double getVerseLeftSpacing({
    @required double iconMargin,
  }){
    return verseHorizontalMargin - iconMargin < 0 ? 0 : verseHorizontalMargin - iconMargin;
  }
  // --------------------
  /// TESTED : WORKS PERFECT
  static double getVerseRightSpacing({
    @required double iconMargin,
  }){

    return verseHorizontalMargin + iconMargin
    // + 5 // bugs the shit out of all buttons without icon
    ;

  }
  // --------------------
  /// TESTED : WORKS PERFECT : TASK : RE-WORK THE TEXT SHADOW THING
  /*
  bool _verseShadowIsOn() {
    bool _isOn;

    if (verseShadow != null) {
      _isOn = verseShadow;
    } else if (greyscale == true || inActiveMode == true) {
      _isOn = false;
    } else {
      _isOn = true;
    }

    return _isOn;
  }
   */
  // --------------------
  /// TESTED : WORKS PERFECT
  bool _verseIsCentered() {
    bool _centered;

    if (verseCentered == true){
      _centered = true;
    }

    else if (icon == null && verseCentered == null) {
      _centered = true;
    }

    else {
      _centered = false;
    }

    return _centered;
  }
  // --------------------
  /// TESTED : WORKS PERFECT : TASK : RE-WORK THE TEXT SHADOW THING
  /*
  bool _secondLineShadowIsOn() {
    bool _isOn;

    if (greyscale == true || inActiveMode == true || verseShadow == false) {
      _isOn = false;
    }

    else {
      _isOn = true;
    }

    return _isOn;
  }
   */
  // -----------------------------------------------------------------------------
  @override
  Widget build(BuildContext context) {
    // --------------------
    final double _jpgGraphicWidth = height * iconSizeFactor;
    // --------------------
    final double _graphicWidth = SuperBox.graphicWidth(
      icon: icon,
      height: height,
      loading: loading,
      iconSizeFactor: iconSizeFactor,
    );
    // --------------------
    final double _verseWidth = verseWidth(
      graphicWidth: _graphicWidth,
      width: width,
      iconMargin: iconMargin,
      hasIcon: icon != null,
    );
    // --------------------
    final CrossAxisAlignment _versesCrossAlignment = versesCrossAlignment(
      icon: icon,
      secondLine: secondLine,
      textDirection: textDirection,
      verseCentered: verseCentered,
    );
    // --------------------
    final MainAxisAlignment _mainAxisAlignment = centered == true ?
    MainAxisAlignment.center
        :
    MainAxisAlignment.start;
    // --------------------
    final Alignment _verseAlignment = centered == true ?
    Alignment.center
        :
    superCenterAlignment(
      appIsLTR: appIsLTR,
    );

    final double _verseLeftSpacing = getVerseLeftSpacing(
      iconMargin: iconMargin,
    );

    final double _verseRightSpacing = getVerseRightSpacing(
      iconMargin: iconMargin,
    );
    // --------------------
    return Row(
      mainAxisAlignment: _mainAxisAlignment,
      textDirection: textDirection,
      children: <Widget>[

        /// --- ICON BOX footprint
        if (icon != null || loading == true)
          Container(
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
                    borderRadius: iconCorners,
                    // color: Colorz.BloodTest
                  ),
                  child: Stack(
                    alignment: Alignment.center,
                    children: <Widget>[

                      BoxIcon(
                        icon: icon,
                        loading: loading,
                        size: height,
                        corners: iconCorners,
                        iconMargin: iconMargin,
                        greyscale: greyscale,
                        bubble: bubble,
                        iconColor: iconColor,
                        iconSizeFactor: iconSizeFactor,
                        backgroundColor: backgroundColor,
                        package: package,
                      ),

                      /// --- BUTTON BLACK LAYER IF GREYED OUT
                      if (greyscale == true &&
                          icon != null &&
                          fileExtensionOf(icon) != 'svg')
                        Container(
                          height: _jpgGraphicWidth,
                          width: _jpgGraphicWidth,
                          decoration: BoxDecoration(
                            // color: Colorz.Yellow,
                            borderRadius: iconCorners,
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
          ),

        /// --- VERSE LEFT SPACING
        if (verse != null)
          SizedBox(
            // color: Colorz.bloodTest,
            width: _verseLeftSpacing,
            // width: iconSizeFactor != 1 && icon != null ?
            // _verseIconSpacing * 0.25
            //     :
            // _verseIconSpacing,
            height: height,
          ),

        /// --- VERSES
        if (verse != null)
          Container(
            height: height,
            width: _verseWidth,
            alignment: _verseAlignment,
            // color: Colorz.yellow50, // for design purpose only
            child: SingleChildScrollView(
              physics: const NeverScrollableScrollPhysics(),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: _versesCrossAlignment,
                children: <Widget>[

                  SizedBox(
                    width: _verseWidth,
                    height: secondLine == null ? height : null,
                    child: SuperText(
                        boxWidth: _verseWidth,

                        text: verse,
                        lineHeight: height * 0.6,
                        weight: textWeight,
                        font: textFont,
                        textDirection: textDirection,
                        textColor: greyscale == true || inActiveMode == true ?
                        const Color.fromARGB(30, 255, 255, 255)
                            :
                        verseColor,
                        // shadow: _verseShadowIsOn(),
                        maxLines: verseMaxLines,
                        centered: _verseIsCentered(),
                        // scaleFactor: iconSizeFactor * verseScaleFactor,
                        italic: verseItalic,
                        redDot: redDot,
                        highlight: highlight,
                        highlightColor: highlightColor,
                        // margin:
                        // _verseWidth == null ?
                        // EdgeInsets.symmetric(horizontal: height * 0.2)
                      //     :
                      // EdgeInsets.zero,
                    ),
                  ),

                  if (secondLine != null)
                    SizedBox(
                      width: _verseWidth,
                      child: SuperText(
                          text: secondLine,
                          weight: FontWeight.w200,
                          lineHeight: height * 0.4,
                          textColor: greyscale == true || inActiveMode == true ?
                          const Color.fromARGB(30, 255, 255, 255)
                              :
                          secondLineColor,
                          maxLines: secondVerseMaxLines,
                          italic: true,
                          textDirection: textDirection,
                          font: textFont,
                          // shadow: _secondLineShadowIsOn(),
                          centered: _verseIsCentered(),
                          // scaleFactor: secondLineScaleFactor,
                          highlight: highlight,
                          highlightColor: highlightColor,
                          margin:
                          // _verseWidth == null ?
                          EdgeInsets.symmetric(horizontal: height * 0.2)
                        //     :
                        // EdgeInsets.zero,
                      ),
                    ),
                ],
              ),
            ),
          ),

        /// --- VERSE RIGHT SPACING
        if (verse != null)
          SizedBox(
            // color: Colorz.bloodTest,
            width: _verseRightSpacing,
            // width: _verseIconSpacing + iconMargin,
            height: height,
          ),

      ],
    );
    // --------------------
  }
  // -----------------------------------------------------------------------------
}
