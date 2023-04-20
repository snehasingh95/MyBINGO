import 'package:flutter/material.dart';
import 'package:my_bingo/model/tile.dart';

class Grid {
  late int n_items;
  late int n_row;
  int n_col;
  List<Tile> tiles;
  String title;

  late List row_finished_count;
  late List col_finished_count;
  late int grid_finished_count;

  Grid({this.n_col = 1, required this.tiles, required this.title}) {
    n_items = tiles.length;
    n_row = n_items ~/ n_col;
    if ((n_row * n_col) < n_items) n_row++;
  }

  static Grid fromJSON(Map<String, dynamic> json) {
    List<Tile> tiles =
        (json['tiles'] as List).map((tile) => Tile.fromJSON(tile)).toList();

    return Grid(n_col: json['n_col'] ?? 1, tiles: tiles, title: json['title']);
  }

  void initCounts() {
    row_finished_count = List.filled(n_col, 0);
    col_finished_count = List.filled(n_row, 0);
    grid_finished_count = 0;
  }

  void bingo(int indx) {
    int r = indx ~/ n_col;
    row_finished_count[r]++;
    // print("row_finished_count: ");
    // print(row_finished_count);

    int c = indx % n_col;
    col_finished_count[c]++;
    // print("col_finished_count: ");
    // print(col_finished_count);

    grid_finished_count++;
    // print("grid_finished_count: ");
    // print(grid_finished_count);
    // print("");
  }

  bool isRowBingo(int indx) {
    int r = indx ~/ n_col;
    return (row_finished_count[r] == n_col);
  }

  bool isColumnBingo(int indx) {
    int c = indx % n_col;
    return (col_finished_count[c] == n_row);
  }

  bool isGridBingo(int indx) {
    return (grid_finished_count == n_items);
  }
}
