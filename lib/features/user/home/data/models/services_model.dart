import 'package:flutter/material.dart';

class ServicesModel {
  final String title;
  final String subtitle;
  final String icon;
  final VoidCallback onPressed;

  ServicesModel({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.onPressed,
  });
}
