import 'package:flutter/material.dart';

class BotonAzul extends StatelessWidget {
  final String texto;
  final TextEditingController emailCtrl;
  final TextEditingController passCtrl;

  const BotonAzul({
    Key key,
    @required this.texto,
    this.emailCtrl,
    this.passCtrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      elevation: 2,
      highlightElevation: 5,
      color: Colors.blue,
      shape: StadiumBorder(),
      onPressed: () {
        print(this.emailCtrl.text);
        print(this.passCtrl.text);
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
