import 'package:rxdart/rxdart.dart';

import 'validators.dart';

class ExampleBloc {
  final phoneCharactersAmount = 15;
  final minPasswordCharacters = 5;

  final BehaviorSubject<String> _phone = BehaviorSubject<String>();
  final BehaviorSubject<String> _password = BehaviorSubject<String>();

  Stream<String> get phone => _phone.stream.transform(
      Validators.validateInputHasExactNumberOfCharacters(phoneCharactersAmount,
          'The phone number must have exaclty 11 numbers'));

  Stream<String> get password =>
      _password.stream.transform(Validators.validateInputHasMin(
          minPasswordCharacters,
          'The password must have at least 5 characters'));

  Function get sinkPhone => _phone.sink.add;

  Function get sinkPassword => _password.sink.add;

  String get phoneValue => _phone.value;

  String get passwordValue => _password.value;

  void dispose() {
    _phone.close();
    _password.close();
  }
}
