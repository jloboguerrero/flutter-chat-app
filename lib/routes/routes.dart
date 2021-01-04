import 'package:flutter/material.dart';

import 'package:whatsapp/pages/chat_page.dart';
import 'package:whatsapp/pages/loading_page.dart';
import 'package:whatsapp/pages/login_page.dart';
import 'package:whatsapp/pages/register_page.dart';
import 'package:whatsapp/pages/usuarios_page.dart';

final Map<String, Widget Function(BuildContext)> appRoutes = {
  'usuarios': (_) => UsuariosPage(),
  'chat': (_) => ChatPage(),
  'login': (_) => LoginPage(),
  'register': (_) => RegisterPage(),
  'loading': (_) => LoadingPage()
};
