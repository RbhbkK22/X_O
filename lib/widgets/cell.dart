import 'package:flutter/material.dart';
import 'package:x_o/core/game_logic.dart';

class Cell extends StatelessWidget {
  final List<int> position;
  final GameLogic game;
  final VoidCallback function;
  const Cell(
      {super.key,
      required this.position,
      required this.game,
      required this.function});

  @override
  Widget build(BuildContext context) {
    String value = game.map[position[0]][position[1]];
    return Center(
      child: GestureDetector(
        onTapDown: (details) {
          if (value.isEmpty && game.getWinPlayer().isEmpty) {
            game.updateMap(position, game.getPlaeyr() == 1 ? 'X' : 'O');
            game.changePlayr();
            game.updateWinPlayer();
          }
          function();
        },
        child: AnimatedContainer(
          height: 100,
          width: 100,
          duration: const Duration(milliseconds: 50),
          decoration: BoxDecoration(
              boxShadow: const [
                BoxShadow(
                  color: Color.fromARGB(178, 200, 200, 200),
                  blurRadius: 3,
                  spreadRadius: 0.5,
                  offset: Offset(2, 5),
                )
              ],
              color: const Color.fromARGB(255, 200, 200, 200),
              borderRadius: BorderRadius.circular(10)),
          child: Center(
            child: Text(value,
                style: TextStyle(
                    color: value == 'X' ? Colors.blue : Colors.red,
                    fontSize: 34)),
          ),
        ),
      ),
    );
  }
}
