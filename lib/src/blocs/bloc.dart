import 'dart:async';
import 'package:rxdart/rxdart.dart';
import '../validators/validator.dart';

class Bloc extends Object with Validator {
  // final _emailStreamController = StreamController<String>.broadcast();
  // final _passwordStreamController = StreamController<String>.broadcast();
  // replace the StreamController<String>.broadcast() to BehaviorSubject<String> which aleady has boradcast in default
  final _emailStreamController = BehaviorSubject<String>();
  final _passwordStreamController = BehaviorSubject<String>();

  // add data to stream
  Stream<String> get emailStream =>
      this._emailStreamController.stream.transform(validateEmail);
  Stream<String> get passwordStream =>
      this._passwordStreamController.stream.transform(validatePassword);
  Stream<bool> get submitValid => Observable.combineLatest2(
      this.emailStream, this.passwordStream, (e, p) => true);

  // retrieve data from stream
  Function(String) get emailChangeSink => this._emailStreamController.sink.add;
  Function(String) get passwordChangeSink =>
      this._passwordStreamController.sink.add;

  // submit method
  submit() {
    final validEmail = this._emailStreamController.value;
    final validPassword = this._passwordStreamController.value;

    print('Submited Email: $validEmail Password: $validPassword');
  }


  dispose() {
    _emailStreamController.close();
    _passwordStreamController.close();
  }
}

// final bloc = Bloc();
