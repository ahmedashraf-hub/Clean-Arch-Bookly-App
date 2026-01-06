import 'package:bookly_app/features/home/domain/entities/book_entity.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/custom_book_image.dart';
import 'package:flutter/material.dart';

class FeaturedListView extends StatefulWidget {
  const FeaturedListView({
    super.key,
    required this.books,
    required this.onFetchMore,
  });

  final List<BookEntity> books;
  final VoidCallback onFetchMore;

  @override
  State<FeaturedListView> createState() => _FeaturedListViewState();
}

class _FeaturedListViewState extends State<FeaturedListView> {
  late ScrollController _scrollController;

  bool _isFetching = false;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_isFetching) return;

    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.position.pixels;
    final threshold = maxScroll * 0.7;

    if (currentScroll >= threshold) {
      _isFetching = true;
      widget.onFetchMore();

      Future.delayed(const Duration(seconds: 2), () {
        _isFetching = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.sizeOf(context).height * 0.3,
      child: ListView.builder(
        controller: _scrollController,
        itemCount: widget.books.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return CustomBookImage(image: widget.books[index].image ?? '');
        },
      ),
    );
  }
}
