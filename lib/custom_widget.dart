import 'package:flutter/material.dart';

Container gradientColor() {
  return Container(
    height: double.infinity,
    width: double.infinity,
    decoration: BoxDecoration(
      gradient: LinearGradient(
        colors: [
          Color.fromRGBO(146, 97, 52, 0.1),
          Color.fromRGBO(146, 97, 52, 1),
        ],
        begin: Alignment.bottomLeft,
        end: Alignment.topRight,
      ),
    ),
  );
}

// Custom Elevated Button
ElevatedButton customImageButton(
  String image,
  String label,
  void Function() onPressed, {
  double elevation = 6,
  double paddingVertical = 20,
  double paddingHorizontal = 20,
  double width = 28,
  double letterSpacing = 0,
}) {
  return ElevatedButton.icon(
    style: ElevatedButton.styleFrom(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      elevation: elevation,
      padding: EdgeInsets.symmetric(
        vertical: paddingVertical,
        horizontal: paddingHorizontal,
      ),
    ),
    icon: Image.asset(
      image,
      color: Colors.white,
      fit: BoxFit.cover,
      width: width,
    ),
    label: Text(
      label,
      style: TextStyle(
        fontSize: 16,
        letterSpacing: letterSpacing,
      ),
    ),
    onPressed: onPressed,
  );
}

// Custom Icon Button
ElevatedButton customIconButton(
  IconData icon,
  String label,
  void Function() onPressed, {
  double elevation = 6,
  double paddingVertical = 20,
  double paddingHorizontal = 20,
  double size = 20,
  double fontSize = 22,
  double letterSpacing = 0,
}) {
  return ElevatedButton.icon(
    style: ElevatedButton.styleFrom(
      elevation: elevation,
      padding: EdgeInsets.symmetric(
        vertical: paddingVertical,
        horizontal: paddingHorizontal,
      ),
    ),
    icon: Icon(
      icon,
      size: size,
    ),
    label: Text(
      label,
      style: TextStyle(
        fontSize: fontSize,
        letterSpacing: letterSpacing,
      ),
    ),
    onPressed: onPressed,
  );
}

// Custom TextField
TextFormField customField(
  String label,
  TextEditingController controller,
  void Function() onTap, {
  int maxLength = 0,
  bool obscureText = false,
}) {
  return TextFormField(
      onTap: onTap,
      controller: controller,
      decoration: InputDecoration(
        label: Text(label),
      ),
      maxLength: maxLength == 0 ? null : maxLength,
      obscureText: obscureText,
      textAlign: TextAlign.center);
}
