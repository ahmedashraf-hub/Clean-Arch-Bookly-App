import 'package:bookly_app/features/home/presentation/views/widgets/custom_text_button.dart';
import 'package:flutter/material.dart';

class ButtonAction extends StatelessWidget {
  const ButtonAction({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(
        children: const [
          CustomTextButton(
            backColor: Colors.white,
            titleColor: Colors.black,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16.0),
              bottomLeft: Radius.circular(12.0),
            ),
            title: '19.99€',
          ),
          CustomTextButton(
            backColor: Color(0XFFef8262),
            titleColor: Colors.white,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(16.0),
              bottomRight: Radius.circular(12.0),
            ),
            title: 'Free preview',
            fontSize: 16,
          ),
        ],
      ),
    );
  }
}
