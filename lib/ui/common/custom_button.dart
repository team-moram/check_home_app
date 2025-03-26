import 'package:flutter/material.dart';

Widget customButton(double circular, String text, Color backgroundColor,
    Color textColor, FontWeight weight, double fontSize) {
  return ClipRRect(
    borderRadius: BorderRadius.circular(circular),
    child: Container(
      color: backgroundColor,
      child: Center(
        child: Text(
          text,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          textScaler: TextScaler.noScaling,
          style: TextStyle(
              color: textColor, fontSize: fontSize, fontWeight: weight),
        ),
      ),
    ),
  );
}