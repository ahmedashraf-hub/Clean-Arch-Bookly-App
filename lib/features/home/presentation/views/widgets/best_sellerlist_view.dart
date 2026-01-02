import 'package:bookly_app/features/home/presentation/views/widgets/book_list_view.dart';
import 'package:flutter/material.dart';

class BestSellerlistView extends StatelessWidget {
  const BestSellerlistView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: ListView.builder(
        itemCount: 10,
        padding: EdgeInsetsGeometry.zero,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: BookListViewItem(),
          );
        },
      ),
    );
  }
}
