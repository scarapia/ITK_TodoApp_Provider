import 'package:flutter/cupertino.dart';

class CounterProvider extends ChangeNotifier {
  var count = 0;

  increment() {
    count++;
    notifyListeners();
  }
}
