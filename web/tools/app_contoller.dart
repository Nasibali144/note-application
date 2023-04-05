import 'dart:html';
import 'base_screen.dart';

class AppController {
  AppController._();
  static final AppController _instance = AppController._();
  factory AppController() => _instance;

  /// This code for same flutter framework
  void runApp(BaseScreen screen) {
    screen;
  }

  /// For Navigate
  void navigateToPage(String url) {
    window.location.href = url;
  }
}