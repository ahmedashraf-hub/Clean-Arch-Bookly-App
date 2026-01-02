import 'package:bookly_app/core/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BookRating extends StatelessWidget {
  const BookRating({
    super.key,
    this.mainAxisAlignment = MainAxisAlignment.start,
  });

  final MainAxisAlignment mainAxisAlignment;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: mainAxisAlignment,
      children: [
        Icon(
          FontAwesomeIcons.solidStar,
          color: const Color(0XFFFFDD4F),
          size: 12,
        ),
        const SizedBox(width: 6.3),
        Text(
          '4.8',
          style: AppStyles.textStyle16.copyWith(fontWeight: FontWeight.w600),
        ),
        const SizedBox(width: 5.0),
        Opacity(
          opacity: 0.5,
          child: const Text('(2390)', style: AppStyles.textStyle14),
        ),
      ],
    );
  }
}
