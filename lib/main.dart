import 'package:flutter/material.dart';
import 'package:my_bingo/constants/colorCode.dart';
import 'package:my_bingo/model/grid.dart';
import 'package:my_bingo/model/tile.dart';
import 'package:my_bingo/pages/gridWidget.dart';

void main() => runApp(MaterialApp(
      home: Home(),
    ));

class Home extends StatelessWidget {
  late List<Tile> tiles = [
    Tile(task: 'task1'),
    Tile(task: 'task2'),
  ];

  late Grid grid = Grid(tiles: tiles, n_col: 2);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MyBINGO'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: GridWidget(grid: grid),
      ),
      backgroundColor: ColorCode.PEACH,
    );
  }
}
