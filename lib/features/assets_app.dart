import 'package:flutter/material.dart';

class ImageOne {
  ImageOne._();

  static Image asset() {
    return Image.asset(
      'assets/grocery.png',
      height: 280,
      width: 280,
    );
  }
}

class ImageTwo {
  ImageTwo._();

  static Image asset() {
    return Image.asset(
      '',
      height: 90,
      width: 110,
    );
  }
}

class ImageThree {
  ImageThree._();

  static Image asset() {
    return Image.asset(
      '',
      height: 90,
      width: 110,
    );
  }
}
