import 'package:flutter/material.dart';
import 'package:whatsapp/global/environment.dart';
import 'package:whatsapp/models/mensajes_response.dart';
import 'package:whatsapp/models/usuario.dart';

import 'package:http/http.dart' as http;
import 'package:whatsapp/services/auth_service.dart';

class ChatService with ChangeNotifier {
  Usuario usuarioPara;

  Future<List<Mensaje>> getChat(String usuarioID) async {
    final resp = await http.get('${Environment.apiUrl}/mensajes/$usuarioID',
        headers: {
          'Content-Type': 'application/json',
          'x-token': await AuthService.getToken()
        });

    final mensajesResp = mensajesResponseFromJson(resp.body);

    return mensajesResp.mensajes;
  }
}
