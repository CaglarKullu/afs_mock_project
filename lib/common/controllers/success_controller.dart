import 'package:flutter_riverpod/flutter_riverpod.dart';

final successControllerProvider =
    StateNotifierProvider<SuccessController, String?>((ref) {
  return SuccessController();
});

class SuccessController extends StateNotifier<String?> {
  SuccessController() : super(null);

  void set(String message) => state = message;

  void clear() => state = null;
}
