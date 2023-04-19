import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_bingo/constants/colorCode.dart';
import 'package:my_bingo/constants/enum.dart';
import 'package:my_bingo/model/grid.dart';
import 'package:my_bingo/pages/gameScreen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MaterialApp(
    theme: ThemeData(
      fontFamily: 'Roboto',
    ),
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  Home({super.key}) {
    debugPrint("starting");
  }

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late Grid grid;

  Future<void> readGridJson() async {
    final String response =
        await rootBundle.loadString('assets/data/json/grid_data_4x4.json');
    // debugPrint(response);
    Map<String, dynamic> data = await json.decode(response);
    // debugPrint(data.toString());

    setState(() {
      grid = Grid.fromJSON(data);
      debugPrint("Grid ready");
    });
  }

  @override
  void initState() {
    super.initState();
    debugPrint("init");
    Future.delayed(Duration.zero, () async {
      await readGridJson();
      debugPrint(grid.toString());
    });
    debugPrint("done");
  }

  @override
  Widget build(BuildContext context) {
    debugPrint("next");

    try {
      return Scaffold(
        // appBar: AppBar(
        //   title: const Text('MyBINGO'),
        // ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: GameScreen(grid: grid, difficulty: Difficulty.EASY),
          ),
        ),
        backgroundColor: ColorCode.PEACH,
      );
    } catch (e) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }
  }
}
