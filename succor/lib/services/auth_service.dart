import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:crypto/crypto.dart';
import 'package:succor/common/constants.dart';
import 'package:succor/models/server_response.dart';
import 'package:succor/models/user.dart';

class AuthService {
  static const String PATH = "/user";

  Future<ServerResponse> login(String username, String password) async {
    String url = Constants.SERVER + PATH + '/login';

    User user = User();
    user.username = username;
    user.password = sha512.convert(utf8.encode(password)).toString();

    var userJson = user.toJson();
    var body = json.encode(userJson);

    try {
      http.Response response = await http.post(url, body: body, headers: Constants.HEADER);
      var responseJson = json.decode(response.body);
      ServerResponse serverResponse = ServerResponse.fromJson(responseJson);
      serverResponse.data = User.formJson(serverResponse.data);
//      serverResponse.status = SUCCESS;
      return serverResponse;
    } catch (error) {
      return ServerResponse(status: FAILED, message: error, data: null);
    }
  }
}
