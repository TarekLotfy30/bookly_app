import 'package:flutter/material.dart';

import 'font_weight_helper.dart';

abstract class Styles {
  static const textStyle30 = TextStyle(
    fontSize: 30,
    fontWeight: FontWeightHelper.black,
    letterSpacing: 1.2,
  );

  static const textStyle20 = TextStyle(
    fontSize: 20,
    fontWeight: FontWeightHelper.regular,
  );

  static const textStyle18 = TextStyle(
    fontSize: 18,
    fontWeight: FontWeightHelper.semiBold,
  );

  static const textStyle16 = TextStyle(
    fontSize: 16,
    fontWeight: FontWeightHelper.medium,
  );

  static const textStyle14 = TextStyle(
    fontSize: 14,
    fontWeight: FontWeightHelper.regular,
  );
}
