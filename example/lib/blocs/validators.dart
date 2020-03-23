import 'dart:async';

class Validators {
  static StreamTransformer<String, String> validateInputHasMin(int size,
      [String message]) {
    return StreamTransformer<String, String>.fromHandlers(handleData: (
      String value,
      EventSink<String> sink,
    ) {
      if (value == null || value.isEmpty) {
        sink.add(null);
        return;
      }
      if (value.length >= size) {
        sink.add(value);
      } else {
        sink.addError(message);
      }
    });
  }

  static StreamTransformer<String, String>
      validateInputHasExactNumberOfCharacters(int characters,
          [String message]) {
    return StreamTransformer<String, String>.fromHandlers(handleData: (
      String value,
      EventSink<String> sink,
    ) {
      if (value == null || value.isEmpty) {
        sink.add(null);
        return;
      }

      if (value.length == characters) {
        sink.add(value);
      } else {
        sink.addError(message);
      }
    });
  }
}
