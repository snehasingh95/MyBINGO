import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:my_bingo/constants/colorCode.dart';
import 'package:my_bingo/constants/constants.dart';

class WinAlertBox extends StatelessWidget {
  const WinAlertBox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
      child: AlertDialog(
        title: const Center(
          child: Text(
            'BINGO!!',
          ),
        ),
        titleTextStyle: const TextStyle(
          color: ColorCode.BLUE,
          fontFamily: 'Roboto',
          fontWeight: FontWeight.w500,
          fontSize: 28.0,
          letterSpacing: 2.0,
        ),
        actions: [
          TextButton(
            onPressed: () {
              // todo: implement next levels
              // nextLevel()
            },
            style: getActionButtonStyle(),
            child: Text(
              "Next Level",
              style: getActionTextStyle(),
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            style: getActionButtonStyle(),
            child: Text(
              "Close",
              style: getActionTextStyle(),
            ),
          ),
        ],
        actionsPadding: const EdgeInsets.all(Constants.MAIN_AXIS_SPACING),
        actionsAlignment: MainAxisAlignment.center,
        backgroundColor: ColorCode.WHITE_SHADOW,
        shadowColor: ColorCode.BLACK,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(5.0))),
      ),
    );
  }

  TextStyle getActionTextStyle() => TextStyle(color: ColorCode.GREY);

  ButtonStyle getActionButtonStyle() => ButtonStyle(
        backgroundColor: MaterialStateProperty.all(ColorCode.LIME_GREEN),
      );
}
