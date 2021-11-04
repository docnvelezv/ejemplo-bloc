import 'dart:async';

import 'package:ejemplo_bloc/bloc/validators.dart';

class Bloc with Validators {
  StreamController _emailController = StreamController<String>();
  StreamController _passwordController = StreamController<String>();

  Function(String) get changeEmail => _emailController.sink.add;
  Function(String) get changePassword => _passwordController.sink.add;

  Stream<String> get email => _emailController.stream.transform(validarEmail);
  Stream<String> get password =>
      _passwordController.stream.transform(validarPassword);

  dispose() {
    _emailController.close();
    _passwordController.close();
  }
}

final bloc = Bloc();
