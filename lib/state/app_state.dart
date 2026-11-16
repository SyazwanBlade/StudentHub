import 'package:flutter/foundation.dart';

/// Shared application state (selected navigation destination).
class AppState extends ChangeNotifier {
  int _currentIndex = 0;

  int get currentIndex => _currentIndex;

  /// Updates the selected main navigation destination.
  ///
  /// Keeping this mutation in the provider, rather than in a page's
  /// [StatefulWidget], lets the drawer and bottom navigation stay in sync.
  void setIndex(int index) {
    if (index < 0) {
      throw ArgumentError.value(index, 'index', 'must not be negative');
    }
    if (index == _currentIndex) return;
    _currentIndex = index;
    notifyListeners();
  }
}
