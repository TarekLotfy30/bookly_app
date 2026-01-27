import 'package:flutter/material.dart';

import '../utils/styles/text_style.dart';

class CustomErrorWidget extends StatelessWidget {
  const CustomErrorWidget(this.errMessage, {super.key});

  final String errMessage;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        errMessage,
        style: Styles.textStyle18,
        textAlign: TextAlign.center,
      ),
    );
  }
}
