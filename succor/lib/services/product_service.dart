import 'dart:convert';

import 'package:succor/common/constants.dart';
import 'package:succor/models/product.dart';
import 'package:succor/models/server_response.dart';
import 'package:http/http.dart' as http;

class ProductService {
  static const String PATH = '/product';

  Future<ServerResponse> createProduct(Product product) async {
    String url = Constants.SERVER + PATH + '/create';

    var productJson = product.toJson();
    var body = json.encode(productJson);

    try {
      http.Response response =
          await http.post(url, body: body, headers: Constants.HEADER);

      var responseJson = json.decode(response.body);
      ServerResponse serverResponse = ServerResponse.fromJson(responseJson);
      serverResponse.data = Product.fromJson(serverResponse.data);
      return serverResponse;
    } catch (error) {
      return ServerResponse(
          status: FAILED, data: null, message: error.toString());
    }
  }

  Future<ServerResponse> editProduct(Product product) async {
    String url = Constants.SERVER + PATH + '/edit';

    var productJson = product.toJson();
    var body = json.encode(productJson);

    try {
      http.Response response =
          await http.put(url, body: body, headers: Constants.HEADER);

      var responseJson = json.decode(response.body);
      ServerResponse serverResponse = ServerResponse.fromJson(responseJson);
      serverResponse.data = Product.fromJson(serverResponse.data);
      return serverResponse;
    } catch (error) {
      return ServerResponse(
          status: FAILED, data: null, message: error.toString());
    }
  }

  Future<ServerResponse> getAllProducts() async {
    String url = Constants.SERVER + PATH + '/getAll';

    try {
      http.Response response = await http.get(url, headers: Constants.HEADER);

      var responseJson = json.decode(response.body);
      ServerResponse serverResponse = ServerResponse.fromJson(responseJson);
      List<Product> products = [];
      for (var data in serverResponse.data) {
        products.add(Product.fromJson(data));
      }
      serverResponse.data = products;
      return serverResponse;
    } catch (error) {
      return ServerResponse(status: FAILED, message: error, data: null);
    }
  }
}
