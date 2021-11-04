import 'package:ejemplo_bloc/bloc/bloc.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Iniciar sesión")),
      body: Container(
          child: Column(
        children: [
          obtenerCampoEmail(),
          obtenerCampoPassword(),
          obtenerBotonIniciarSesion()
        ],
      )),
    );
  }

  Widget obtenerCampoEmail() {
    return StreamBuilder(
        stream: bloc.email,
        builder: (context, snapshot) {
          return TextField(
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
                labelText: "Correo electrónico",
                hintText: "jhon.doe@mail.com",
                errorText:
                    snapshot.error == null ? "" : snapshot.error.toString()),
            onChanged: (value) {
              bloc.changeEmail(value);
            },
          );
        });
  }

  Widget obtenerCampoPassword() {
    return StreamBuilder(
        stream: bloc.password,
        builder: (context, snapshot) {
          return TextField(
            keyboardType: TextInputType.visiblePassword,
            obscureText: true,
            decoration: InputDecoration(
                labelText: "Contraseña",
                errorText:
                    snapshot.error == null ? "" : snapshot.error.toString()),
            onChanged: (value) {
              bloc.changePassword(value);
            },
          );
        });
  }

  Widget obtenerBotonIniciarSesion() {
    return ElevatedButton(onPressed: () {}, child: Text("Iniciar sesión"));
  }
}
