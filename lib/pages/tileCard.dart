import 'dart:math';

import 'package:flutter/material.dart';
import 'package:my_bingo/constants/ColorCode.dart';
import 'package:my_bingo/model/tile.dart';

class TileCard extends StatefulWidget {
  const TileCard({super.key});

  @override
  State<TileCard> createState() => _TileCardState();
}

class _TileCardState extends State<TileCard> {
  Tile tile = Tile(task: 'Tile Pending');

  @override
  Widget build(BuildContext context) {
    Color background = tile.finished ? ColorCode.BLUE : ColorCode.LIME_GREEN;
    return GestureDetector(
      onTap: () => finishTileTask(tile),
      child: SizedBox.square(
        dimension: MediaQuery.of(context).size.width,
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: background,
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Center(
            child: getTile(tile),
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

  Widget getTile(Tile tile) =>
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
      ),
    );
  }

  Widget getFinishedTile(Tile tile) {
    return Center(
      child: AspectRatio(
        aspectRatio: 1,
        child: Icon(
          Icons.task_alt,
          color: ColorCode.PEACH,
          size: MediaQuery.of(context).size.width - 25.0,
        ),
      ),
    );
  }
}
