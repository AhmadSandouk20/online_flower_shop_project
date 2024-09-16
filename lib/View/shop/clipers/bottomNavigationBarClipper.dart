import 'package:flutter/material.dart';

class BottomNavigationBarClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    // path.lineTo(SizeConfig.screenWidthHundredPercent * 10, 0);
    // path.lineTo(0, size.height);
    // path.lineTo(size.width, size.height);
    // path.lineTo(size.width - SizeConfig.screenWidthHundredPercent * 10, 0);

    path.lineTo(0, 0);
    path.lineTo(0, size.height);

    path.lineTo(size.width, size.height + 100);
    path.lineTo(size.width, 0);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
