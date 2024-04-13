import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

Widget svgIconComponent(
    {required String icon, double? width, double? height, Color? color}) {
  return SvgPicture.asset(
    icon,
    height: height,
    width: width,
    color: color,
  );
}
