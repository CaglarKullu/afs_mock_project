import 'dart:io';

class Environment {
  static String get baseUrl {
    if (Platform.isAndroid) {
      return 'http://192.168.0.59:3000/jobs';
    } else {
      return 'http://localhost:3000/jobs';
    }
  }
}
