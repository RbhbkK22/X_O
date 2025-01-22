import 'package:flutter/material.dart';

class GameLogic {
  int _plaeyr = 1;
  String _winPlaeyr = '';

  List<List<String>> map = [
    ['', '', ''],
    ['', '', ''],
    ['', '', ''],
  ];

  void changePlayr() {
    if (_plaeyr == 1) {
      _plaeyr = 2;
    } else {
      _plaeyr = 1;
    }
  }

  int getPlaeyr() {
    return _plaeyr;
  }

  void updateMap(List<int> position, String value) {
    map[position[0]][position[1]] = value;
    debugPrint(map.join());
  }

  String getWinPlayer() {
    return _winPlaeyr;
  }

  void updateWinPlayer() {
    _winPlaeyr = _checkWin();
  }

  void refreshGame() {
    for (var i = 0; i < map.length; i++) {
      for (var j = 0; j < map[i].length; j++) {
        map[i][j] = '';
      }
    }
    _plaeyr = 1;
    _winPlaeyr = '';
  }

  String _checkWin() {
    // Проверка строк
    for (var i = 0; i < map.length; i++) {
      if (_allEqual(map[i])) {
        return map[i][0]; // Возвращаем символ победителя
      }
    }

    // Проверка колонок
    for (var i = 0; i < map.length; i++) {
      List<String> column = [for (int j = 0; j < map.length; j++) map[j][i]];
      if (_allEqual(column)) {
        return column[0]; // Возвращаем символ победителя
      }
    }

    // Проверка главной диагонали
    List<String> mainDiagonal = [
      for (int i = 0; i < map.length; i++) map[i][i]
    ];
    if (_allEqual(mainDiagonal)) {
      return mainDiagonal[0]; // Возвращаем символ победителя
    }

    // Проверка побочной диагонали
    List<String> antiDiagonal = [
      for (int i = 0; i < map.length; i++) map[i][map.length - i - 1]
    ];
    if (_allEqual(antiDiagonal)) {
      return antiDiagonal[0]; // Возвращаем символ победителя
    }

    // Если победителя нет
    return '';
  }

  bool _allEqual(List<String> list) {
    if (list.isEmpty || list[0].isEmpty) {
      return false; // Если список пустой или ячейка не заполнена
    }
    String first = list[0];
    return list.every((e) => e == first); // Проверяем, все ли элементы равны
  }
}
