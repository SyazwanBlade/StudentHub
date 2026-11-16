import 'package:flutter/foundation.dart';

/// Manages the selected navigation destination.
class AppState extends ChangeNotifier {
  static const int destinationCount = 5;

  int _currentIndex = 0;

  int get currentIndex => _currentIndex;

  /// Updates the selected navigation destination.
  void setIndex(int index) {
    if (index < 0 || index >= destinationCount) {
      throw RangeError.range(
        index,
        0,
        destinationCount - 1,
        'index',
      );
    }

    if (_currentIndex == index) return;

    _currentIndex = index;
    notifyListeners();
  }
}
