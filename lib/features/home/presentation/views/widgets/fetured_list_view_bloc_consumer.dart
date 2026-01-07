import 'package:bookly_app/core/utils/functions/build_error_snackbar.dart';
import 'package:bookly_app/features/home/domain/entities/book_entity.dart';
import 'package:bookly_app/features/home/presentation/manager/featured_books_cubit/featured_books_cubit.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/featured_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FeturedListViewBlocConsumer extends StatefulWidget {
  const FeturedListViewBlocConsumer({super.key});

  @override
  State<FeturedListViewBlocConsumer> createState() =>
      _FeturedListViewBlocConsumerState();
}

class _FeturedListViewBlocConsumerState
    extends State<FeturedListViewBlocConsumer> {
  List<BookEntity> books = [];

  @override
  Widget build(BuildContext context) {
    var nextPage = 1;
    return BlocConsumer<FeaturedBooksCubit, FeaturedBooksState>(
      listener: (context, state) {
        if (state is FeaturedBooksSuccess) {
          books.addAll(state.books);
        }

        if (state is FeaturedBooksPaginationFailure) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(buildErrorSnackbar(state.errMessage, context));
        }
      },
      builder: (context, state) {
        if (state is FeaturedBooksSuccess ||
            state is FeaturedBooksPaginationLoading ||
            state is FeaturedBooksPaginationFailure) {
          return FeaturedListView(
            books: books,
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
