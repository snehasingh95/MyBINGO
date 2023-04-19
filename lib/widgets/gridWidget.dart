import 'package:flutter/material.dart';
import 'package:my_bingo/constants/constants.dart';
import 'package:my_bingo/model/grid.dart';
import 'package:my_bingo/widgets/tileWidget.dart';

class GridWidget extends StatefulWidget {
  Grid grid;
  GridWidget({super.key, required this.grid});

  @override
  State<GridWidget> createState() => _GridWidgetState();
}

class _GridWidgetState extends State<GridWidget> {
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: widget.grid.n_col,
      mainAxisSpacing: Constants.MAIN_AXIS_SPACING,
      crossAxisSpacing: Constants.CROSS_AXIS_SPACING,
      children:
          widget.grid.tiles.map((tile) => TileWidget(tile: tile)).toList(),
    );
  }
}
