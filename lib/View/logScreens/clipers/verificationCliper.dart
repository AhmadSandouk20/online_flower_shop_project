import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Verificationcliper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();

    path.lineTo(0, 0);
    var one = Offset(size.width * 2, -50.h);

    var two = Offset(size.width, size.height - 30.h);

    var three = Offset(size.width - 30.w, size.height);

    var four = Offset(30.w, size.height);

    var five = Offset(0, size.height - 30.h);

    path.quadraticBezierTo(one.dx, one.dy, two.dx, two.dy);
    path.quadraticBezierTo(two.dx, two.dy, three.dx, three.dy);
    path.quadraticBezierTo(three.dx, three.dy, four.dx, four.dy);
    path.quadraticBezierTo(four.dx, four.dy, five.dx, five.dy);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
