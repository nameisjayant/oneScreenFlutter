import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

Widget svgIconComponent({required String icon, double? size, Color? color}) {
  return SvgPicture.asset(
    icon,
    height: size,
    width: size,
  );
}
