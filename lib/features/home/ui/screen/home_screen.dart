import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/functions/functions.dart';
import '../../../../core/utils/padding/app_padding.dart';
import '../../../../core/utils/styles/font_weight_helper.dart';
import '../../../../core/utils/styles/text_style.dart';
import '../../../../core/widgets/custom_error_widget.dart';
import '../../../../core/widgets/custom_loading_indicator.dart';
import '../../logic/newest_books_cubit/newest_books_cubit.dart';
import '../widgets/best_seller_list_view_item.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/featured_books_list_view.dart';

part '../widgets/home_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: _HomeBody());
  }
}
