import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:whatsapp/helpers/mostrar_alerta.dart';
import 'package:whatsapp/services/auth_service.dart';

class BotonAzul extends StatelessWidget {
  final String texto;
  final TextEditingController emailCtrl;
  final TextEditingController passCtrl;
  final TextEditingController nameCtrl;
  final bool registro;

  const BotonAzul(
      {Key key,
      @required this.texto,
      this.emailCtrl,
      this.passCtrl,
      this.nameCtrl,
      this.registro})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context);

    return RaisedButton(
      elevation: 2,
      highlightElevation: 5,
      color: Colors.blue,
      shape: StadiumBorder(),
      onPressed: (authService.autenticando)
          ? null
          : () async {
              print(this.emailCtrl.text);
              print(this.passCtrl.text);
              print(this.nameCtrl.text);
              FocusScope.of(context).unfocus();
              if (!registro) {
                final loginOk = await authService.login(
                    this.emailCtrl.text.trim(), this.passCtrl.text.trim());

                if (loginOk) {
                  // TODO: Conectar a nuestro socket server

                  // TODO: navegar a pagina
                  Navigator.pushReplacementNamed(context, 'usuarios');
                } else {
                  // Mostrar alerta
                  mostrarAlerta(
                      context, 'Login incorrecto', 'Revise sus creedenciales');
                }
              }
              if (registro) {
                final registroOk = await authService.register(
                  nameCtrl.text.trim(),
                  emailCtrl.text.trim(),
                  passCtrl.text.trim(),
                );

                if (registroOk == true) {
                  // TODO: Conectar a nuestro socket server

                  // TODO: navegar a pagina
                  Navigator.pushReplacementNamed(context, 'usuarios');
                } else {
                  // Mostrar alerta
                  mostrarAlerta(context, 'Registro incorrecto', 'registroOk');
                }
              }
            },
      child: Container(
        width: double.infinity,
        child: Center(
          child: Text(this.texto,
              style: TextStyle(color: Colors.white, fontSize: 17)),
        ),
      ),
    );
  }
}
