import 'package:bookly_app/features/home/presentation/manager/featured_books_cubit/featured_books_cubit.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/featured_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FeturedListViewBlocBuilder extends StatelessWidget {
  const FeturedListViewBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    var nextPage = 1;
    return BlocBuilder<FeaturedBooksCubit, FeaturedBooksState>(
      builder: (context, state) {
        if (state is FeaturedBooksSuccess) {
          return FeaturedListView(
            books: state.books,
            onFetchMore: () {
              context.read<FeaturedBooksCubit>().fetchFeaturedBooks(
                pageNumber: nextPage++,
              );
            },
          );
        } else if (state is FeaturedBooksFailure) {
          return Text(state.errMessage);
        } else {
          return const CircularProgressIndicator();
        }
      },
    );
  }
}
