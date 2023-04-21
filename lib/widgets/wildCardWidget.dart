import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:my_bingo/constants/colorCode.dart';
import 'package:my_bingo/model/wildCard.dart';

class WildCardWidget extends StatefulWidget {
  WildCard wildCard;
  WildCardWidget({super.key, required this.wildCard});

  @override
  State<WildCardWidget> createState() => _WildCardWidgetState();
}

class _WildCardWidgetState extends State<WildCardWidget> {
  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
      child: AlertDialog(
        title: Text(widget.wildCard.title),
        content: Text(widget.wildCard.description),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              setState(() {
                widget.wildCard.useCard();
              });
            },
            style: getActionButtonStyle(),
            child: Text(
              "Use Card",
              style: getActionTextStyle(),
            ),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context),
            style: getActionButtonStyle(),
            child: Text(
              "Close",
              style: getActionTextStyle(),
            ),
          ),
        ],
      ),
    );
  }

  TextStyle getActionTextStyle() => const TextStyle(color: ColorCode.GREY);

  ButtonStyle getActionButtonStyle() => ButtonStyle(
        backgroundColor: MaterialStateProperty.all(ColorCode.LIME_GREEN),
      );
}
