part of '../screen/home_screen.dart';

class _HomeBody extends StatelessWidget {
  const _HomeBody();

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Column(
        children: [
          CustomAppBar(),
          FeaturedBooksListView(),
        ],
      ),
    );
  }
}
