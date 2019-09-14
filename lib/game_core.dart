import 'dart:math';

class GameCore {
  String starter() {
    var rnd = new Random().nextInt(1);
    if (rnd == 1)
      return 'X';
    else if (rnd == 0) return 'O';
  }
}
