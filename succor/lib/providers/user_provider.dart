import 'package:flutter/cupertino.dart';
import 'package:succor/models/server_response.dart';
import 'package:succor/models/user.dart';
import 'package:succor/services/user_service.dart';

class UserProvider extends ChangeNotifier {
  UserService _userService = UserService();

  Future<String> createUser(User user) {
    return _userService.createUser(user);
  }

//  Future<ServerResponse> login(String username, String password) {
//    return _userService.login(username, password);
//  }
}
