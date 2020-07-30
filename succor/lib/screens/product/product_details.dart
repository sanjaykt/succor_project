import 'package:flutter/material.dart';
import 'package:succor/common/constants.dart';
import 'package:succor/models/product.dart';
import 'package:succor/models/server_response.dart';
import 'package:succor/providers/product_provider.dart';

class ProductDetailsScreen extends StatefulWidget {
  static final routeName = 'product_details_screen';

  @override
  _ProductDetailsScreenState createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  final _formKey = GlobalKey<FormState>();
  Product product = Product();
  ProductProvider _productProvider = ProductProvider();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product Details'),
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: Form(
          key: _formKey,
          child: ListView(
            children: <Widget>[
              buildProductNameTextFormField(),
              buildProductDetailsTextFormField(),
              Divider(),
              RaisedButton(
                child: Text('Create'),
                onPressed: () async {
                  if (_formKey.currentState.validate()) {
                    _formKey.currentState.save();
                    ServerResponse serverResponse =
                        await _productProvider.createProduct(product);
                    print(serverResponse.message);
                    if (serverResponse.status == SUCCESS) {
                      Navigator.of(context).pop();
                    }
                  } else {
                    print('problem submitting');
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildProductNameTextFormField() {
    return TextFormField(
      keyboardType: TextInputType.text,
      initialValue: 'product name amma',
      decoration: InputDecoration(
//                  border: OutlineInputBorder(borderSide: BorderSide.none),
        prefixIcon: Icon(
          Icons.label,
          color: kOnBackgroundColor,
        ),
        labelText: 'product name',
        hintText: 'product name',
//                  filled: true,
//                  fillColor: kPrimaryColor200,
      ),
      onChanged: (value) {
        product.productName = value;
      },
      onSaved: (value) {
        product.productName = value;
      },
    );
  }

  Widget buildProductDetailsTextFormField() {
    return TextFormField(
      keyboardType: TextInputType.text,
      initialValue: 'product details amma',
      maxLines: 5,
      minLines: 3,
      decoration: InputDecoration(
//                  border: OutlineInputBorder(borderSide: BorderSide.none),
        prefixIcon: Icon(
          Icons.more,
          color: kOnBackgroundColor,
        ),
        labelText: 'product details',
        hintText: 'product details',
//                  filled: true,
//                  fillColor: kPrimaryColor200,
      ),
      onChanged: (value) {
        product.productDetails = value;
      },
      onSaved: (value) {
        product.productDetails = value;
      },
    );
  }
}
