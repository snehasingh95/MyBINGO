import 'dart:math';

import 'package:my_bingo/model/grid.dart';
import 'package:my_bingo/model/tile.dart';

class ActionService {
  static final Random swapRandomGenerator = Random();
  static final Random spinRandomGenerator = Random();

  static void swap(Map? arguments) {
    if (arguments == null || arguments["tiles"] == null) return;
    List<Tile> tiles = arguments["tiles"];
    int length = tiles.length;
    int indx1 = swapRandomGenerator.nextInt(length);
    int indx2 = swapRandomGenerator.nextInt(length);

    while (indx1 == indx2) {
      indx2 = swapRandomGenerator.nextInt(length);
    }

    Tile tmp = tiles[indx1];
    tiles[indx1] = tiles[indx2];
    tiles[indx2] = tmp;
  }

  static void spin(Map? arguments) {
    if (arguments == null || arguments["tiles"] == null) return;
    List<Tile> tiles = arguments["tiles"];
    int n_col = arguments["n_col"];
    bool clockwise = arguments["clockwise"] ?? spinRandomGenerator.nextBool();

    if (clockwise) {
      spinClockWise(tiles);
    } else {
      spinAntiClockWise(tiles);
    }
  }

  static void spinClockWise(List<Tile> tiles) {
    int length = tiles.length;
    // todo: remove assumption of square grid
    int gridSize = sqrt(length).toInt();

    if (gridSize <= 1) return;

    int loops = gridSize ~/ 2;
    for (int loop = 0; loop < loops; loop++) {
      int low = loop, high = gridSize - 1 - low;

      Tile tmp = tiles[Grid.getIndx(low, high, gridSize)];
      //top row
      for (int i = high; i > low; i--) {
        tiles[Grid.getIndx(low, i, gridSize)] =
            tiles[Grid.getIndx(low, i - 1, gridSize)];
      }

      //left col
      for (int i = low; i < high; i++) {
        tiles[Grid.getIndx(i, low, gridSize)] =
            tiles[Grid.getIndx(i + 1, low, gridSize)];
      }

      //bottom row
      for (int i = low; i < high; i++) {
        tiles[Grid.getIndx(high, i, gridSize)] =
            tiles[Grid.getIndx(high, i + 1, gridSize)];
      }

      //right col
      for (int i = high; i > low; i--) {
        tiles[Grid.getIndx(i, high, gridSize)] =
            tiles[Grid.getIndx(i - 1, high, gridSize)];
      }

      tiles[Grid.getIndx(low + 1, high, gridSize)] = tmp;
    }
  }

  static void spinAntiClockWise(List<Tile> tiles) {
    int length = tiles.length;
    // todo: remove assumption of square grid
    int gridSize = sqrt(length).toInt();

    if (gridSize <= 1) return;

    int loops = gridSize ~/ 2;
    for (int loop = 0; loop < loops; loop++) {
      int low = loop, high = gridSize - 1 - low;

      Tile tmp = tiles[Grid.getIndx(low, low, gridSize)];

      //top row
      for (int i = low; i < high; i++) {
        tiles[Grid.getIndx(low, i, gridSize)] =
            tiles[Grid.getIndx(low, i + 1, gridSize)];
      }

      //right col
      for (int i = low; i < high; i++) {
        tiles[Grid.getIndx(i, high, gridSize)] =
            tiles[Grid.getIndx(i + 1, high, gridSize)];
      }

      //bottom row
      for (int i = high; i > low; i--) {
        tiles[Grid.getIndx(high, i, gridSize)] =
            tiles[Grid.getIndx(high, i - 1, gridSize)];
      }

      //left col
      for (int i = high; i > low; i--) {
        tiles[Grid.getIndx(i, low, gridSize)] =
            tiles[Grid.getIndx(i - 1, low, gridSize)];
      }

      tiles[Grid.getIndx(low + 1, low, gridSize)] = tmp;
    }
  }
}
