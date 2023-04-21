import 'package:flutter/material.dart';
import 'package:my_bingo/constants/constants.dart';
import 'package:my_bingo/constants/enum.dart';
import 'package:my_bingo/model/grid.dart';
import 'package:my_bingo/model/tile.dart';
import 'package:my_bingo/widgets/tileWidget.dart';

class GridWidget extends StatefulWidget {
  Grid grid;
  Difficulty difficulty;
  ValueChanged<bool> onWin;
  GridWidget(
      {super.key,
      required this.grid,
      required this.difficulty,
      required this.onWin});

  @override
  State<GridWidget> createState() => _GridWidgetState();
}

class _GridWidgetState extends State<GridWidget> {
  @override
  void initState() {
    super.initState();
    List<Tile> tiles = widget.grid.tiles;
    for (int indx = 0; indx < tiles.length; indx++) {
      if (tiles[indx].finished) widget.grid.bingo(indx);
    }
  }

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: widget.grid.n_col,
      mainAxisSpacing: Constants.MAIN_AXIS_SPACING,
      crossAxisSpacing: Constants.CROSS_AXIS_SPACING,
      children: widget.grid.tiles
          .asMap()
          .entries
          .map((entry) => TileWidget(
                tile: entry.value,
                indx: entry.key,
                onChange: checkBingo,
              ))
          .toList(),
    );
  }

  checkBingo(int indx) {
    widget.grid.bingo(indx);
    bool win = false;
    if (widget.difficulty == Difficulty.EASY) {
      win = widget.grid.isRowBingo(indx) || widget.grid.isColumnBingo(indx);
    } else if (widget.difficulty == Difficulty.MEDIUM) {
      win = widget.grid.isRowBingo(indx) && widget.grid.isColumnBingo(indx);
    } else if (widget.difficulty == Difficulty.HARD) {
      win = widget.grid.isGridBingo(indx);
    }

    if (win) {
      widget.onWin(true);
    }
  }
}
