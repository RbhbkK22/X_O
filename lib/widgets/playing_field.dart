import 'package:flutter/material.dart';
import 'package:x_o/core/game_logic.dart';
import 'package:x_o/widgets/cell.dart';
import 'package:x_o/widgets/refresh_button.dart';

class PlayingField extends StatefulWidget {
  const PlayingField({super.key});

  @override
  State<PlayingField> createState() => _PlayingFieldState();
}

class _PlayingFieldState extends State<PlayingField> {
  GameLogic game = GameLogic();
  String _winPlaeyr = '';

  void _updateState() {
    setState(() {
      _winPlaeyr = game.getWinPlayer();
    });
  }

  void _refreshGame() {
    setState(() {
      game.refreshGame();
      _winPlaeyr = game.getWinPlayer();
      game = GameLogic();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        color: game.getWinPlayer().isEmpty
            ? (game.getPlaeyr() == 1
                ? const Color.fromARGB(82, 79, 168, 240)
                : const Color.fromARGB(64, 240, 95, 85))
            : (game.getWinPlayer() == 'X'
                ? const Color.fromARGB(82, 79, 168, 240)
                : const Color.fromARGB(64, 240, 95, 85)),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          _build(),
          const SizedBox(height: 15),
          RefreshButton(function: _refreshGame),
        ]),
      ),
    );
  }

  Widget _build() {
    return _winPlaeyr == ''
        ? Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Cell(
                      position: const [0, 0],
                      game: game,
                      function: _updateState),
                  const SizedBox(width: 10),
                  Cell(
                      position: const [0, 1],
                      game: game,
                      function: _updateState),
                  const SizedBox(width: 10),
                  Cell(
                      position: const [0, 2],
                      game: game,
                      function: _updateState),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Cell(
                      position: const [1, 0],
                      game: game,
                      function: _updateState),
                  const SizedBox(width: 10),
                  Cell(
                      position: const [1, 1],
                      game: game,
                      function: _updateState),
                  const SizedBox(width: 10),
                  Cell(
                      position: const [1, 2],
                      game: game,
                      function: _updateState),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Cell(
                      position: const [2, 0],
                      game: game,
                      function: _updateState),
                  const SizedBox(width: 10),
                  Cell(
                      position: const [2, 1],
                      game: game,
                      function: _updateState),
                  const SizedBox(width: 10),
                  Cell(
                      position: const [2, 2],
                      game: game,
                      function: _updateState),
                ],
              ),
            ],
          )
        : Center(
            child: Text.rich(
            TextSpan(
                text: 'Победитель: ',
                style: const TextStyle(
                    fontSize: 50,
                    fontWeight: FontWeight.bold,
                    shadows: [
                      Shadow(
                          color: Color.fromARGB(122, 72, 72, 72),
                          offset: Offset(2, 5),
                          blurRadius: 3)
                    ]),
                children: [
                  TextSpan(
                      text: _winPlaeyr,
                      style: TextStyle(
                          color: _winPlaeyr == 'X' ? Colors.blue : Colors.red)),
                ]),
          ));
  }
}
