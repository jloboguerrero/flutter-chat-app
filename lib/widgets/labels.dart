import 'package:flutter/material.dart';

class Labels extends StatelessWidget {
  final String ruta;
  final bool login;

  const Labels({
    Key key,
    this.ruta,
    this.login,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Text((login) ? '¿No tienes cuenta?' : '¿Ya tienes cuenta?',
              style: TextStyle(
                  color: Colors.black54,
                  fontSize: 15,
                  fontWeight: FontWeight.w300)),
          SizedBox(height: 10),
          GestureDetector(
            child: Text(
              (login) ? 'Crea una ahora!' : 'Log in',
              style: TextStyle(
                  color: Colors.blue[600],
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
            onTap: () {
              Navigator.pushReplacementNamed(context, this.ruta);
            },
          ),
        ],
      ),
    );
  }
}
