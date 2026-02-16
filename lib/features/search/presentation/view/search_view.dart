import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/di/service_locator.dart';
import '../../data/repo/search_book_repo.dart';
import '../controller/cubit/search_book_cubit.dart';
import '../widgets/search_view_body.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          SearchBookCubit(getIt.get<SearchBookRepo>()),
      child: const Scaffold(body: SafeArea(child: SearchViewBody())),
    );
  }
}
