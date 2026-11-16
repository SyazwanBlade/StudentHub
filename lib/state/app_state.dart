import 'package:flutter/foundation.dart';

/// Main sections of the app, in the same order as the bottom navigation.
///
/// Kept free of UI types (icons, widgets) so the state layer stays separate
/// from the UI. Adding a section here automatically updates the valid range.
enum AppSection { home, students, records, programmes, about }

/// Shared application state (selected navigation destination).
///
/// Keeping the selected section in the provider, rather than in a page's
/// [StatefulWidget], lets the drawer and bottom navigation stay in sync.
class AppState extends ChangeNotifier {
  AppSection _section = AppSection.home;

  /// Currently selected section.
  AppSection get section => _section;

  /// Index of the selected section, for widgets such as [NavigationBar].
  int get currentIndex => _section.index;

  /// Selects [section] and notifies listeners only if it changed.
  void select(AppSection section) {
    if (section == _section) return;
    _section = section;
    notifyListeners();
  }

  /// Selects the section at [index]. Throws a [RangeError] if out of range.
  void setIndex(int index) {
    RangeError.checkValidIndex(index, AppSection.values, 'index');
    select(AppSection.values[index]);
  }
}
