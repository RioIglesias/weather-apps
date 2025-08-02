import 'package:flutter/material.dart';
import 'package:weather_app/helper/size_customize.dart';
import 'package:weather_app/style/colors.dart';
import 'package:weather_app/style/custom_text.dart';

class CustomizeCard extends StatelessWidget {
  const CustomizeCard({
    super.key,
    required this.icon,
    required this.title,
    required this.value,
    required this.text,
  });

  final IconData icon;
  final String title;
  final String value;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: SizeCustomize.setSp(10),
        vertical: SizeCustomize.setSp(10),
      ),
      decoration: BoxDecoration(
        color: AppColors.subColor3.withValues(alpha: 0.8),
        borderRadius: SizeCustomize.borderRadiusCircular(all: 20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, color: Colors.grey.shade700),
              SizedBox(width: SizeCustomize.setSp(5)),
              SubText(text: title),
            ],
          ),
          Expanded(
            child: TitleText(text: value, size: SizeCustomize.setSp(30)),
          ),
          SubText(
            text: text,
            size: SizeCustomize.setSp(14),
            colors: Colors.white60,
          ),
        ],
      ),
    );
  }
}
