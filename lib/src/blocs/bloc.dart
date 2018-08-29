import 'dart:async';
import '../validators/validator.dart';

class Bloc extends Object with Validator {

  final _emailStreamController = StreamController<String>();
  final _passwordStreamController = StreamController<String>();

  // add data to stream
  Stream<String> get emailStream => this._emailStreamController
  .stream.transform(validateEmail);
  Stream<String> get passwordStream => this._passwordStreamController
  .stream.transform(validateEmail);

  // retrieve data from stream
  Function(String) get emailChangeSink => this._emailStreamController.sink.add;
  Function(String) get passwordChangeSink => this._emailStreamController.sink.add;

  dispose() {
    _emailStreamController.close();
    _passwordStreamController.close();
  }

}