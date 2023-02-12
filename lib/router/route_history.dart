class RouteHistory {
  static final List<String> _routes = [];
  static String _currentRoute = "/";

  static bool get isEmpty => _routes.isEmpty;
  static bool get isNotEmpty => _routes.isNotEmpty;
  static List<String> get routes => _routes;

  static setCurrent(String location) {
    if (_routes.isNotEmpty && _routes.last != _currentRoute) {
      _routes.add(_currentRoute);
    }
    if (_currentRoute == "/") _routes.clear();
    _currentRoute = location;
  }

  static add() {
    if (_routes.isEmpty) _routes.add("/");
    _routes.add(_currentRoute);
  }

  static clear() {
    _routes.clear();
  }

  static get last {
    while (_routes.isNotEmpty && _routes.last == _currentRoute) {
      _routes.removeLast();
    }
    return _routes.last;
  }

  static removeLast() => _routes.removeLast();
}
