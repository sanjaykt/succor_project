import 'package:flutter/material.dart';
import 'package:succor/models/server_response.dart';
import 'package:succor/services/auth_service.dart';

class AuthProvider extends ChangeNotifier {
  AuthService _authService = AuthService();
  Map<String, Function> _loginHandlers = {};

  AuthProvider();

  Future<ServerResponse> login(String username, String password) async {
    ServerResponse serverResponse = await _authService.login(username, password);
    if (serverResponse.status == SUCCESS) {
      executeLoginHandler();
    }
    return serverResponse;
  }

  addLoginHandler(String key, Function handler) {
    _loginHandlers[key] = handler;
  }

  executeLoginHandler() {
    for (var handler in _loginHandlers.values) {
      if (handler != null) handler();
    }
  }
}
