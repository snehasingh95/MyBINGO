import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_bingo/constants/enum.dart';
import 'package:my_bingo/model/grid.dart';

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
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const Text(
              'HomeScreen',
            ),
            FloatingActionButton(
              onPressed: () {
                Navigator.pushNamed(context, '/game', arguments: {
                  "grid": grid,
                  "difficulty": Difficulty.EASY,
                });
              },
              child: const Text('Press Me'),
            ),
          ],
        ),
      ),
    );
  }
}
