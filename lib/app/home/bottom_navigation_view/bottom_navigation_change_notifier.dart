import 'package:flutter/material.dart';

class BottomNavigationChangeNotifier extends ChangeNotifier {
  BottomNavigationChangeNotifier(this.selectedIndex);
  int selectedIndex;

  int get currentIndex => this.selectedIndex;

  void changeView(int index) {
    selectedIndex = index;
    notifyListeners();
  }
}
