
import 'package:succor/models/product.dart';
import 'package:succor/models/server_response.dart';
import 'package:succor/services/product_service.dart';

class ProductProvider {
  ProductService _productService = ProductService();

  Future<ServerResponse> createProduct(Product product) {
    return _productService.createProduct(product);
  }
}
