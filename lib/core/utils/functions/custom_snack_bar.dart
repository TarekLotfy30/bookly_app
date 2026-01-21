import 'package:flutter/material.dart';

Future<void> customSnackBar(BuildContext context, String text) async {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(text)));
}
