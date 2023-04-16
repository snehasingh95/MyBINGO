import 'package:flutter/material.dart';
import 'package:my_bingo/constants/colorCode.dart';
import 'package:my_bingo/model/tile.dart';
import 'package:my_bingo/pages/tileWidget.dart';

void main() => runApp(MaterialApp(
      home: Home(),
    ));

class Home extends StatelessWidget {
  Tile tile = Tile(task: 'Tile Pending');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MyBINGO'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: TileWidget(tile: tile),
      ),
      backgroundColor: ColorCode.PEACH,
    );
  }
}
