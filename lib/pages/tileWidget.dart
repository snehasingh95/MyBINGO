import 'dart:math';

import 'package:flutter/material.dart';
import 'package:my_bingo/constants/ColorCode.dart';
import 'package:my_bingo/model/tile.dart';

class TileWidget extends StatefulWidget {
  Tile tile;
  TileWidget({super.key, required this.tile});

  @override
  State<TileWidget> createState() => _TileWidgetState();
}

class _TileWidgetState extends State<TileWidget> {
  @override
  Widget build(BuildContext context) {
    Color background =
        widget.tile.finished ? ColorCode.BLUE : ColorCode.LIME_GREEN;
    return GestureDetector(
      onTap: () => finishTileTask(widget.tile),
      child: DecoratedBox(
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
            color: ColorCode.BLACK_SHADOW,
            blurRadius: 8.0,
            offset: Offset(0, 4),
            spreadRadius: -4.0,
          ),
        ]),
        child: SizedBox.square(
          dimension: MediaQuery.of(context).size.width,
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: background,
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Center(
              child: getContent(widget.tile),
            ),
          ),
        ),
      ),
    );
  }

  void finishTileTask(Tile tile) {
    if (!tile.finished) {
      setState(() {
        tile.finished = true;
      });
    }
  }

  Widget getContent(Tile tile) =>
      tile.finished ? getFinishedTile(tile) : getPendingTile(tile);

  Widget getPendingTile(Tile tile) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Text(
        tile.task,
        style: const TextStyle(
          color: ColorCode.GREY,
          fontFamily: 'Roboto',
          fontWeight: FontWeight.w500,
          fontSize: 12.0,
          letterSpacing: 2.0,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget getFinishedTile(Tile tile) {
    return Center(
      child: LayoutBuilder(
        builder: (BuildContext, BoxConstraints) {
          return Icon(
            Icons.task_alt_rounded,
            color: ColorCode.PEACH,
            size: BoxConstraints.biggest.width - 10.0,
          );
        },
      ),
    );
  }
}
