import 'package:bookly/core/utils/functions/functions.dart';
import 'package:bookly/core/utils/padding/app_padding.dart';
import 'package:bookly/core/utils/styles/font_weight_helper.dart';
import 'package:bookly/core/utils/styles/text_style.dart';
import 'package:bookly/features/home/ui/widgets/best_seller_list_view_item.dart';
import 'package:bookly/features/home/ui/widgets/custom_app_bar.dart';
import 'package:bookly/features/home/ui/widgets/featured_books_list_view.dart';
import 'package:flutter/material.dart';

part '../widgets/home_body.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: _HomeBody(),
    );
  }
}