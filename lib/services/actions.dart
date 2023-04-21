import 'dart:math';

import 'package:flutter/material.dart';
import 'package:my_bingo/model/tile.dart';

class ActionService {
  static final Random swapRandomGenerator = Random();
  static final Random spinRandomGenerator = Random();

  static void swap(List<Tile> tiles) {
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

  static void spin(List<Tile> tiles) {
    bool clockwise = spinRandomGenerator.nextBool();
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

      Tile tmp = tiles[getIndx(low, high, gridSize)];
      //top row
      for (int i = high; i > low; i--) {
        tiles[getIndx(low, i, gridSize)] = tiles[getIndx(low, i - 1, gridSize)];
      }

      //left col
      for (int i = low; i < high; i++) {
        tiles[getIndx(i, low, gridSize)] = tiles[getIndx(i + 1, low, gridSize)];
      }

      //bottom row
      for (int i = low; i < high; i++) {
        tiles[getIndx(high, i, gridSize)] =
            tiles[getIndx(high, i + 1, gridSize)];
      }

      //right col
      for (int i = high; i > low; i--) {
        tiles[getIndx(i, high, gridSize)] =
            tiles[getIndx(i - 1, high, gridSize)];
      }

      tiles[getIndx(low + 1, high, gridSize)] = tmp;
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

      Tile tmp = tiles[getIndx(low, low, gridSize)];

      //top row
      for (int i = low; i < high; i++) {
        tiles[getIndx(low, i, gridSize)] = tiles[getIndx(low, i + 1, gridSize)];
      }

      //right col
      for (int i = low; i < high; i++) {
        tiles[getIndx(i, high, gridSize)] =
            tiles[getIndx(i + 1, high, gridSize)];
      }

      //bottom row
      for (int i = high; i > low; i--) {
        tiles[getIndx(high, i, gridSize)] =
            tiles[getIndx(high, i - 1, gridSize)];
      }

      //left col
      for (int i = high; i > low; i--) {
        tiles[getIndx(i, low, gridSize)] = tiles[getIndx(i - 1, low, gridSize)];
      }

      tiles[getIndx(low + 1, low, gridSize)] = tmp;
    }
  }

  static void printTiles(List<Tile> tiles) {
    for (Tile tile in tiles) {
      debugPrint(tile.task);
    }
  }

  static void printDetailedTiles(List<Tile> tiles) {
    int length = tiles.length;
    int gridSize = sqrt(length).toInt();

    for (int indx = 0; indx < length; indx++) {
      int r = getRow(indx, gridSize), c = getRow(indx, gridSize);
      debugPrint(
          "indx: ${indx.toString().padLeft(2, '0')} row: $r col: $c -> ${tiles[indx].task}");
    }
  }

  static int getIndx(int r, int c, int n_col) => r * n_col + c;
  static int getRow(int indx, int n_col) => indx ~/ n_col;
  static int getCol(int indx, int n_col) => indx % n_col;
}
