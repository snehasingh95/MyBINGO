import 'package:flutter/material.dart';
import 'package:my_bingo/constants/colorCode.dart';
import 'package:my_bingo/pages/tileCard.dart';

void main() => runApp(MaterialApp(
      home: Home(),
    ));

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MyBINGO'),
      ),
      body: const Padding(
        padding: EdgeInsets.all(15),
        child: TileCard(),
      ),
      backgroundColor: ColorCode.PEACH,
    );
  }
}
