import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

class SizeConfig {
  static double _screenWidth;
  static double _screenHeight;
  static double _blockWidth = 0;
  static double _blockHeight = 0;

  static double textMultiplier;
  static double imageSizeMultiplier;
  static double heightMultiplier;
  static double widthMultiplier;
  static bool isPortrait = true;
  static bool isMobilePortrait = false;

  void init(BoxConstraints constraints, Orientation orientation) {
    if (orientation == Orientation.portrait) {
      _screenWidth = constraints.maxWidth;
      _screenHeight = constraints.maxHeight;
      isPortrait = true;
      if (_screenWidth < 450) {
        isMobilePortrait = true;
      }
    } else {
      _screenWidth = constraints.maxHeight;
      _screenHeight = constraints.maxWidth;
      isPortrait = false;
      isMobilePortrait = false;
    }

    _blockWidth = _screenWidth / 100;
    _blockHeight = _screenHeight / 100;

    /* Usage */
    // fontSize: 2.3 * SizeConfig.textMultiplier

    //apply to text
    textMultiplier = _blockHeight;

    //apply to image
    imageSizeMultiplier = _blockWidth;

    //apply to vertical margin, vertical padding, constraints and so on... when in portrait
    heightMultiplier = _blockHeight;

    //apply to horizontal margin, horizontal padding, constraints and so on... when in landscape
    widthMultiplier = _blockWidth;

    print(_screenWidth);
  }
}
