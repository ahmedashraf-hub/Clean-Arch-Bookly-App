import 'package:bookly_app/features/home/presentation/views/widgets/book_list_view.dart';
import 'package:flutter/material.dart';

class SearchResultListView extends StatelessWidget {
  const SearchResultListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      padding: EdgeInsetsGeometry.zero,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          child: BookListViewItem(),
        );
      },
    );
  }
}
