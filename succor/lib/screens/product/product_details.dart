import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:succor/common/constants.dart';
import 'package:succor/models/product.dart';
import 'package:succor/models/server_response.dart';
import 'package:succor/providers/product_provider.dart';

class ProductDetailsScreen extends StatefulWidget {
  static final routeName = 'product_details_screen';
  final Product productToBeEdited;
//  final ProductProvider productProvider;
//
  ProductDetailsScreen({this.productToBeEdited});

  @override
  _ProductDetailsScreenState createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  final _formKey = GlobalKey<FormState>();
  Product productEditOrCreate;
  ProductProvider _productProvider;
  TextEditingController _productNameCtrl = TextEditingController();
  TextEditingController _productDetailsCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    _productProvider = Provider.of<ProductProvider>(context);

    if (productEditOrCreate == null) {
      productEditOrCreate = Product();
      if (widget.productToBeEdited != null) {
        productEditOrCreate = widget.productToBeEdited.clone();
        _productNameCtrl.text = productEditOrCreate.productName;
        _productDetailsCtrl.text = productEditOrCreate.productDetails;
      }
    }

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
              _buildSubmitButton(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildProductNameTextFormField() {
    return TextFormField(
      keyboardType: TextInputType.text,
      controller: _productNameCtrl,
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
        productEditOrCreate.productName = value;
      },
      onSaved: (value) {
        productEditOrCreate.productName = value;
      },
    );
  }

  Widget buildProductDetailsTextFormField() {
    return TextFormField(
      keyboardType: TextInputType.text,
      controller: _productDetailsCtrl,
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
        productEditOrCreate.productDetails = value;
      },
      onSaved: (value) {
        productEditOrCreate.productDetails = value;
      },
    );
  }

  Widget _buildSubmitButton(BuildContext context) {
    return RaisedButton(
      child: widget.productToBeEdited == null ? Text('Create') : Text('Update'),
      onPressed: () async {
        if (_formKey.currentState.validate()) {
          _formKey.currentState.save();
          ServerResponse serverResponse = ServerResponse();
          if (widget.productToBeEdited == null) {
            serverResponse = await _productProvider.createProduct(productEditOrCreate);
          } else {
            serverResponse = await _productProvider.editProduct(productEditOrCreate);
          }
          print(serverResponse.message);
          if (serverResponse.status == SUCCESS) {
            Navigator.of(context).pop();
          }
        } else {
          print('problem submitting');
        }
      },
    );
  }
}
