part of super_box;

class SuperBoxController {
  /// --------------------------------------------------------------------------

  const SuperBoxController();

  // --------------------------------------------------------------------------

  /// SIZES

  // --------------------
    /// TESTED : WORKS PERFECT
  static double graphicWidth({
    @required dynamic icon,
    @required double height,
    @required bool loading,
    @required double iconSizeFactor,
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
  /// TESTED : WORKS PERFECT
  static double verseWidth({
    @required double width,
    @required double iconMargin,
    @required double graphicWidth,
    @required bool hasIcon,
  }) {

    double _output;

    if (width != null){

        return    width
                - (iconMargin * 2)
                - graphicWidth
                - getVerseLeftSpacing(iconMargin: iconMargin)
                - getVerseRightSpacing(iconMargin: iconMargin);

    }

    return _output;
  }
  // --------------------
  /// TESTED : WORKS PERFECT
  static double textLineHeight({
    @required double height,
    @required double iconSizeFactor,
    @required double textScaleFactor,
  }) {
    return height * 0.7 * iconSizeFactor * textScaleFactor;
  }
  // --------------------------------------------------------------------------

  /// ALIGNMENTS

  // --------------------
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
  /// TESTED : WORKS PERFECT
  static bool checkTextIsCentered({
    @required bool verseCentered,
    @required String icon,
  }) {
    bool _centered;

    if (verseCentered == true) {
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
  /// TESTED : WORKS PERFECT
  static MainAxisAlignment getContentsRowMainAxisAlignment({
    @required bool centered,
  }) {

    if (centered == true) {
      return MainAxisAlignment.center;
    }

    else {
      return MainAxisAlignment.start;
    }

  }
  // --------------------
  /// TESTED : WORKS PERFECT
  static Alignment getVersesBoxAlignment({
    @required bool centered,
    @required bool appIsLTR,
  }) {

    if (centered == true) {
      return Alignment.center;
    }

    else {
      return superCenterAlignment(
        appIsLTR: appIsLTR,
      );
    }

  }
  // --------------------------------------------------------------------------

  /// MARGINS

  // --------------------
    static double verseHorizontalMargin = 10;
  // --------------------
  /// TESTED : WORKS PERFECT
  static double iconMargin({
    @required dynamic icon,
    @required double height,
    @required double iconSizeFactor,
    @required String text,
    @required bool loading,
  }) {

    if (text == null || icon == null){
      return 0;
    }

    else {

    final double _graphicWidth = graphicWidth(
        icon: icon,
        height: height,
        iconSizeFactor: iconSizeFactor,
        loading: loading,
      );

      return (height - _graphicWidth) / 2;
    }

  }
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
  /// TESTED : WORKS PERFECT
  static EdgeInsets superMargins({
    @required dynamic margin,
  }) {
    if (margin == null || margin == 0) {
      return EdgeInsets.zero;
    }

    else if (margin.runtimeType == double) {
      return EdgeInsets.all(margin);
    }

    else if (margin.runtimeType == int) {
      return EdgeInsets.all(margin.toDouble());
    }

    else if (margin.runtimeType == EdgeInsets) {
      return margin;
    }

    else {
      return margin;
    }
  }
  // --------------------------------------------------------------------------

  /// CORNERS

  // --------------------
  static BorderRadius boxCornersValue = const BorderRadius.all(Radius.circular(12));
  // --------------------
  /// TESTED : WORKS PERFECT
  static BorderRadius boxCorners({
    @required BuildContext context,
    @required dynamic cornersOverride,
  }) {
    if (cornersOverride == null) {
      return boxCornersValue;
    } else {
      return superCorners(context, cornersOverride ?? 0);
    }
  }
  // --------------------
  /// TESTED : WORKS PERFECT
  static BorderRadius superCorners(BuildContext context, dynamic corners) {
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
  // --------------------------------------------------------------------------

  /// COLORS

  // --------------------
  /// TESTED : WORKS PERFECT
  static Color iconColor({
    @required bool greyScale,
    @required bool isDisabled,
    @required Color colorOverride
  }) {

    if (greyScale == true || isDisabled == true) {
      return const Color.fromARGB(30, 255, 255, 255);
    }

    else {
      return colorOverride;
    }

  }
  // --------------------
  /// TESTED : WORKS PERFECT
  static Color boxColor({
    @required bool greyScale,
    @required Color color,
    @required bool isDisabled,
  }) {
    if (isDisabled == true) {
      return const Color.fromARGB(10, 255, 255, 255);
    } else {
      if (greyScale == true && color != const Color.fromARGB(0, 255, 255, 255)) {
        return const Color.fromARGB(80, 121, 121, 121);
      } else if (greyScale == true && color == const Color.fromARGB(0, 255, 255, 255)) {
        return const Color.fromARGB(0, 255, 255, 255);
      } else {
        return color;
      }
    }
  }
  // --------------------
  /// TESTED : WORKS PERFECT
  static Color textColor({
    @required Color colorOverride,
    @required bool isDisabled,
    @required bool greyScale,
  }){

    if (greyScale == true || isDisabled == true){
      return const Color.fromARGB(30, 255, 255, 255);
    }

    else {
      return colorOverride;
    }

  }
  // --------------------------------------------------------------------------

  /// GESTURES

  // --------------------
  /// TESTED : WORKS PERFECT
  static Future<void> onBoxTap({
    @required bool isDisabled,
    @required Function onDisabledTap,
    @required Function onTap,
  }) async {

    /// DEACTIVATED
    if (isDisabled == true){

      /// NO DEACTIVATED TAP
      if (onDisabledTap == null){
        // do nothing
      }
      /// CAN TAP DEACTIVATED
      else {
        onDisabledTap();
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
  // --------------------------------------------------------------------------
}

// ----------------------------------0
/*

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

 */
// ----------------------------------0
/*
  /// TESTED : WORKS PERFECT : TASK : RE-WORK THE TEXT SHADOW THING
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
// ----------------------------------0
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
// ----------------------------------0
