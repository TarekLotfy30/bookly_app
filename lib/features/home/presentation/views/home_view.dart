import 'package:flutter/material.dart';

import '../widgets/home_view/home_body.dart';

/// Main screen for browsing books in the home section.
///
/// Displays two primary sections:
/// 1. A horizontal carousel of featured books at the top
/// 2. A vertical scrollable list of Newest books
class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: HomeBody());
  }
}
