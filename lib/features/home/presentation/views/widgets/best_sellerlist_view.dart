import 'package:bookly_app/features/home/presentation/views/widgets/book_list_view.dart';
import 'package:flutter/material.dart';

class BestSellerlistView extends StatelessWidget {
  const BestSellerlistView({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      sliver: SliverList(
        delegate: SliverChildBuilderDelegate((context, index) {
          return const Padding(
            padding: EdgeInsets.symmetric(vertical: 10.0),
            child: BookListViewItem(),
          );
        }, childCount: 10),
      ),
    );
  }
}
