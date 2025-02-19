import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/*
Bu sınıf navbardaki ekranların indexini tutuyor.
Bu index değiştiğinde notifyListeners() çağrılıyor.
*/

class NavbarProvider extends ChangeNotifier {
  int _selectedIndex = 0;

  int get selectedIndex => _selectedIndex;

  void setSelectedIndex(int index) {
    _selectedIndex = index;
    notifyListeners();
  }
}

final navbarProvider =
    ChangeNotifierProvider<NavbarProvider>((ref) => NavbarProvider());
