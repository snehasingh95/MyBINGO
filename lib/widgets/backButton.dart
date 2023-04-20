import 'package:flutter/material.dart';
import 'package:my_bingo/constants/colorCode.dart';

class backButton extends StatelessWidget {
  const backButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      // top: 5.0,
      // right: 200.0,
      child: CircleAvatar(
        backgroundColor: ColorCode.BACK_BUTTON_BG,
        child: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: ColorCode.BLUE,
          ),
          onPressed: () => Navigator.of(context).pop(),
          iconSize: 24.0,
        ),
      ),
    );
  }
}
