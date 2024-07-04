import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final counterChangeNotifier = ChangeNotifierProvider<CounterChangeNotifier>(
    (ref) => CounterChangeNotifier());

class CounterChangeNotifier extends ChangeNotifier {
  int counterValue = 0;

  void increment() {
    counterValue++;
    notifyListeners();
  }

  void decrement() {
    counterValue--;
    notifyListeners();
  }
}
