import 'package:bookly_app/core/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BookRating extends StatelessWidget {
  const BookRating({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          FontAwesomeIcons.solidStar,
          color: const Color(0XFFFFDD4F),
          size: 12,
        ),
        const SizedBox(width: 6.3),
        const Text('4.8', style: AppStyles.textStyle16),
        const SizedBox(width: 5.0),
        Text(
          '(2390)',
          style: AppStyles.textStyle14.copyWith(color: Color(0XFF707070)),
        ),
      ],
    );
  }
}
