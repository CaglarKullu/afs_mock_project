import 'dart:io';

class Environment {
  static String get baseUrl {
    if (Platform.isAndroid) {
      return 'http://10.0.2.2:3000/items';
    } else {
      return 'http://localhost:3000/items';
    }
  }
}
