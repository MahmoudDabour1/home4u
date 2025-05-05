import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';

class FixedPackageDetails extends StatelessWidget {
  final String details;

  const FixedPackageDetails({super.key, required this.details});

  @override
  Widget build(BuildContext context) {
    return HtmlWidget(details);
  }
}