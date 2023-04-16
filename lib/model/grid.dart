import 'package:my_bingo/model/tile.dart';

class Grid {
  late int n_items;
  late int n_row;
  int n_col;
  List<Tile> tiles;

  late List row_finished_count;
  late List col_finished_count;
  late int grid_finished_count;

  Grid({this.n_col = 1, required this.tiles}) {
    n_items = tiles.length;
    n_row = n_items ~/ n_col;
    if ((n_row * n_col) < n_items) n_row++;

    row_finished_count = List.filled(n_col, 0);
    col_finished_count = List.filled(n_row, 0);
    grid_finished_count = 0;
  }

  bool isRowBingo(int indx) {
    int r = indx ~/ n_col;
    row_finished_count[r]++;
    return (row_finished_count[r] == n_col);
  }

  bool isColumnBingo(int indx) {
    int c = indx % n_col;
    col_finished_count[c]++;
    return (col_finished_count[c] == n_row);
  }

  bool isGridBingo(int indx) {
    grid_finished_count++;
    return (grid_finished_count == n_items);
  }
}
