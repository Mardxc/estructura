import 'package:flutter/material.dart';

class CustomListtileFormfield extends StatelessWidget {
  const CustomListtileFormfield({
    super.key,
    required this.title,
    required this.body,
  });
  final Widget title;
  final Widget body;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      title: title,
      subtitle: body,
    );
  }
}
