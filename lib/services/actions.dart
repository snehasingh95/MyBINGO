import 'dart:math';

import 'package:my_bingo/model/tile.dart';

class ActionService {
  static final Random random = Random();

  static void swap(List<Tile> tiles) {
    int length = tiles.length;
    int indx1 = random.nextInt(length);
    int indx2 = random.nextInt(length);

    while (indx1 == indx2) {
      indx2 = random.nextInt(length);
    }

    Tile tmp = tiles[indx1];
    tiles[indx1] = tiles[indx2];
    tiles[indx2] = tmp;
  }
}
