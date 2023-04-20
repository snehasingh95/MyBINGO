import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_bingo/constants/colorCode.dart';
import 'package:my_bingo/constants/constants.dart';
import 'package:my_bingo/constants/enum.dart';
import 'package:my_bingo/model/grid.dart';
import 'package:my_bingo/model/tile.dart';
import 'package:my_bingo/widgets/homeTileWidget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Grid grid;

  Future<void> readGridJson() async {
    final String response =
        await rootBundle.loadString('assets/data/json/grid_data_4x4.json');
    // debugPrint(response);
    Map<String, dynamic> data = await json.decode(response);
    // debugPrint(data.toString());

    setState(() {
      grid = Grid.fromJSON(data);
      // debugPrint("Grid ready");
    });
  }

  @override
  void initState() {
    super.initState();
    // debugPrint("init");
    Future.delayed(Duration.zero, () async {
      await readGridJson();
      // debugPrint(grid.toString());
    });
    // debugPrint("done");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            getContent(),
          ],
        ),
      ),
      backgroundColor: ColorCode.PEACH,
    );
  }

  Widget getContent() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        HomeTileWidget(
          tile: Tile(task: 'M', finished: true),
        ),
        const SizedBox(height: Constants.MAIN_AXIS_SPACING),
        HomeTileWidget(
          tile: Tile(task: 'y', finished: true),
        ),
        const SizedBox(height: Constants.MAIN_AXIS_SPACING),
        HomeTileWidget(
          tile: Tile(task: 'B', finished: true),
        ),
        const SizedBox(height: Constants.MAIN_AXIS_SPACING),
        HomeTileWidget(
          tile: Tile(task: 'I', finished: true),
        ),
        const SizedBox(height: Constants.MAIN_AXIS_SPACING),
        HomeTileWidget(
          tile: Tile(task: 'N', finished: true),
        ),
        const SizedBox(height: Constants.MAIN_AXIS_SPACING),
        GestureDetector(
          onTap: () {
            // debugPrint("Pressed");
            Navigator.pushNamed(context, '/game', arguments: {
              "grid": grid,
              "difficulty": Difficulty.EASY,
            });
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              HomeTileWidget(
                tile: Tile(task: 'B', finished: false),
              ),
              const SizedBox(width: Constants.CROSS_AXIS_SPACING),
              HomeTileWidget(
                tile: Tile(task: 'E', finished: false),
              ),
              const SizedBox(width: Constants.CROSS_AXIS_SPACING),
              HomeTileWidget(
                tile: Tile(task: 'G', finished: true),
              ),
              const SizedBox(width: Constants.CROSS_AXIS_SPACING),
              HomeTileWidget(
                tile: Tile(task: 'I', finished: false),
              ),
              const SizedBox(width: Constants.CROSS_AXIS_SPACING),
              HomeTileWidget(
                tile: Tile(task: 'N', finished: false),
              ),
            ],
          ),
        ),
        const SizedBox(height: Constants.MAIN_AXIS_SPACING),
        HomeTileWidget(
          tile: Tile(task: 'O', finished: true),
        ),
      ],
    );
  }
}
