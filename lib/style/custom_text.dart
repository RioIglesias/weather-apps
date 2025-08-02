import 'package:flutter/material.dart';
import 'package:weather_app/helper/size_customize.dart';
import 'package:weather_app/style/colors.dart';

class TitleText extends StatelessWidget {
  final String text;
  final double? size;
  final Color? colors;
  final FontWeight? weight;
  final TextOverflow? overflow;
  final int? maxLine;
  const TitleText({
    super.key,
    required this.text,
    this.size,
    this.colors,
    this.weight,
    this.overflow = TextOverflow.ellipsis,
    this.maxLine,
  });
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: size ?? 40,
        color: colors ?? AppColors.subtextColor2,
        fontFamily: 'SFPRODISPLAY',
        fontWeight: weight ?? FontWeight.w500,
      ),
      overflow: overflow,
      maxLines: maxLine,
    );
  }
}

class SubText extends StatelessWidget {
  final String text;
  final double? size;
  final Color? colors;
  final FontWeight? weight;
  final TextOverflow? overflow;
  final int? maxLine;
  final TextAlign? align;
  final TextScaler? scale;
  const SubText({
    super.key,
    required this.text,
    this.size,
    this.colors,
    this.weight,
    this.overflow = TextOverflow.ellipsis,
    this.maxLine,
    this.align,
    this.scale,
  });
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: size ?? SizeCustomize.setSp(18),
        color: colors ?? Colors.grey.shade700,
        fontFamily: 'SFPRODISPLAY',
        fontWeight: weight ?? FontWeight.w400,
      ),
      textScaler: scale,
      overflow: overflow,
      textAlign: align,
      maxLines: maxLine ?? 2,
    );
  }
}
