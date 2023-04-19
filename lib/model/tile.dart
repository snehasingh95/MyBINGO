import 'package:flutter/material.dart';

class Tile {
  String task;
  bool finished;
  bool free;

  Tile({required this.task, this.finished = false, this.free = false}) {
    if (free) finished = true;
  }

  static Tile fromJSON(Map<String, dynamic> json) {
    bool finished = json['finsihed'] ?? false;
    bool free = json['free'] ?? false;

    // debugPrint(
    //     json['task'] + " " + finished.toString() + " " + free.toString());

    return Tile(task: json['task'], finished: finished, free: free);
  }
}
