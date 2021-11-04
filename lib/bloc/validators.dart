import 'dart:async';

class Validators {
  var validarEmail = StreamTransformer<String, String>.fromHandlers(
      handleData: (inputValue, sink) {
    String patron = r'^[^@]+@[^@]+\.[^@]+$';
    RegExp regExp = new RegExp(patron);

    if (regExp.hasMatch(inputValue.toString())) {
      sink.add(inputValue);
    } else {
      sink.addError('El email ingresado no es válido');
    }
  });

  var validarPassword = StreamTransformer<String, String>.fromHandlers(
      handleData: (inputValue, sink) {
    if (inputValue.length >= 5) {
      sink.add(inputValue);
    } else {
      sink.addError('La contraseña ingresada no es válida');
    }
  });
}
