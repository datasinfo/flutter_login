import 'dart:async';

class Validator {

  final validateEmail = StreamTransformer<String, String>.fromHandlers(
    handleData: (data, sink) {
      if(data.contains('@')) {
        sink.add(data);
      } else {
        sink.addError('Enter a valid email');
      }
    },
  );
  
  final validatePassword = StreamTransformer<String, String>.fromHandlers(
    handleData: (data, sink) {
      if(data.length > 5) {
        sink.add(data);
      } else {
        sink.addError('Password must at least 6 digits');
      }
    },
  );
  
}