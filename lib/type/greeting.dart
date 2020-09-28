import 'dart:math';

class Greeting {
  static String random() {
    final List<String> _greetings = [
      "Hi there!",
      "Hello fellow earthling!",
      "Ahoy, matey!",
      "Hiya!",
      "Hello!",
      "Howdy!",
      "Yo!",
      "Whaddup!"
    ];
    return _greetings[new Random().nextInt(_greetings.length)];
  }
}
