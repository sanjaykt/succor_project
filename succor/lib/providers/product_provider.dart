import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:succor/models/product.dart';
import 'package:succor/models/server_response.dart';
import 'package:succor/providers/auth_provider.dart';
import 'package:succor/providers/database_provider.dart';
import 'package:succor/services/product_service.dart';

class ProductProvider extends ChangeNotifier {
  DatabaseProvider _databaseProvider;
  AuthProvider _authProvider;
  ProductService _productService = ProductService();

  List<Product> _productList = [];
  Map<int, Product> _productMap = {};
  bool loadedFromDatabase = false;

  update(AuthProvider authProvider, DatabaseProvider databaseProvider) {
    this._databaseProvider = databaseProvider;
    this._authProvider = authProvider;

    _authProvider.addLoginHandler('ProductProvider', loginHandler);
  }

  loginHandler() async {}

  Future<ServerResponse> getAllProducts() async {
    ServerResponse serverResponse;

//    if (!loadedFromDatabase) {
//      _productList.clear();
//      loadedFromDatabase = true;
//    }

    // if already loaded from the db
    if (_productList.isNotEmpty) {
      return ServerResponse(status: SUCCESS, data: _productList);
    }

    // load from db
    await loadFromDB();

    // if empty get it from the server
    if (_productList == null || _productList.isEmpty) {
      serverResponse = await _productService.getAllProducts();
      print('service is called...');
      processFetchedEntities(serverResponse.data);
    }

    // if not empty
    if (_productList != null && _productList.isNotEmpty) {
      serverResponse = ServerResponse(status: SUCCESS, data: _productList);
    } else if (serverResponse == null) {
      serverResponse = ServerResponse(status: FAILED, message: 'Failed to get products!');
    }
    return serverResponse;
  }

  loadFromDB() async {
    try {
      List<Map<String, dynamic>> fetchedDBData = await _databaseProvider.getAll(DatabaseProvider.PRODUCTS);

      if (fetchedDBData != null && fetchedDBData.isNotEmpty) {
        for (var dbRow in fetchedDBData) {
          Product product = Product.fromJson(json.decode(dbRow['json']));
          addToCache(product);
        }
      }
    } catch (error) {
      print('error occurred while getting data from db' + error.toString());
    }
  }

  processFetchedEntities(List<Product> products) {
    if (products == null || products.isEmpty) {
      return;
    }

    for (var product in products) {
      addToCache(product);
      addToDB(product);
    }
  }

  addToCache(Product product) {
    _productList.add(product);
    _productMap[product.productId] = product;
  }

  updateCache(Product product) {
    for (var i = 0; i < _productList.length; i++) {
      if (_productList[i].productId == product.productId) {
        _productList.removeAt(i);
        _productList.insert(i, product);
        break;
      }
    }
  }

  addToDB(Product product) async {
    String productJson = json.encode(product.toJson());
    await _databaseProvider.insert(DatabaseProvider.PRODUCTS, product.productId, productJson);
  }

  Future<ServerResponse> createProduct(Product product) async {
    ServerResponse serverResponse = await _productService.createProduct(product);
    if (serverResponse.status == SUCCESS) {
      addToCache(serverResponse.data);
      addToDB(serverResponse.data);
      notifyListeners();
    }
    return serverResponse;
  }

  Future<ServerResponse> editProduct(Product product) async {
    ServerResponse serverResponse = await _productService.editProduct(product);
    if (serverResponse.status == SUCCESS) {
      updateCache(serverResponse.data);
      addToDB(serverResponse.data);
      notifyListeners();
    }
    return serverResponse;
  }

  tempUploadImage(Product productEdit) {
    for (var product in _productList) {
      if (product.productId == productEdit.productId) {
        product.productImageUrl = productEdit.productImageUrl;
      }
    }
    notifyListeners();
  }
}
