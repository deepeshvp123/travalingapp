import 'package:flutter/material.dart';
import 'package:travalingapp/widgets/app_text.dart';
//import 'package:travel_app_flutter/widgets/app_text.dart';

class AppButtons extends StatelessWidget {
  final Color color;
  final Color backgroundColor;
  final double size;
  String text;
  bool isIcon;
  IconData icon;
  final Color borderColor;
  AppButtons({
    Key? key,
    this.text = "hii",
    this.icon = Icons.handyman,
    required this.color,
    required this.backgroundColor,
    required this.size,
    required this.borderColor,
    this.isIcon = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
          border: Border.all(color: borderColor, width: 1.0),
          borderRadius: BorderRadius.circular(15),
          color: backgroundColor),
      child: isIcon == false
          ? Center(
            child: AppText(
                text: text,
                color:color,
              ),
          )
          : Center(
              child: Icon(
              icon,
              color: color,
            )),
    );
  }
}
