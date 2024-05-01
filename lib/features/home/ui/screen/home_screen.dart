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
