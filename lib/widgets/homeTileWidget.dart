import 'package:flutter/material.dart';
import 'package:my_bingo/constants/ColorCode.dart';
import 'package:my_bingo/model/tile.dart';

class HomeTileWidget extends StatelessWidget {
  const HomeTileWidget({super.key, required this.tile});

  final Tile tile;

  @override
  Widget build(BuildContext context) {
    Color background = tile.finished ? ColorCode.BLUE : ColorCode.LIME_GREEN;
    Color textColor = tile.finished ? ColorCode.PEACH : ColorCode.GREY;
    return Center(
      child: DecoratedBox(
        decoration: BoxDecoration(
            color: background,
            borderRadius: BorderRadius.circular(10.0),
            boxShadow: const [
              BoxShadow(
                color: ColorCode.BLACK_SHADOW,
                blurRadius: 8.0,
                offset: Offset(0, 4),
                spreadRadius: -4.0,
              ),
            ]),
        child: SizedBox.square(
          dimension: 60.0,
          child: Center(
            child: Text(
              tile.task,
              style: TextStyle(
                color: textColor,
                fontSize: 48.0,
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}
