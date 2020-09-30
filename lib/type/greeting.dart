import 'dart:math';

class Greeting {
  static String random() {
    final List<String> _greetings = [
      "hi",
      "hello",
      "ahoy",
      "hiy",
      "he",
      "how",
      "yo",
      "wazaap"
    ];
    return _greetings[new Random().nextInt(_greetings.length)];
  }
}
