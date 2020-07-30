import 'package:flutter/material.dart';
import 'package:succor/Widgets/drawer.dart';
import 'package:succor/models/product.dart';
import 'package:succor/providers/product_provider.dart';
import 'package:succor/screens/product/product_details.dart';

class ProductListScreen extends StatefulWidget {
  static final routeName = 'home_screen';

  @override
  _ProductListScreenState createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  ProductProvider _productProvider = ProductProvider();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Products'),
      ),
      drawer: AppDrawer(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.pushNamed(context, ProductDetailsScreen.routeName);
        },
      ),
      body: FutureBuilder(
        future: _productProvider.getAllProducts(),
        builder: (BuildContext context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasData) {
              List<Product> data = snapshot.data.data;
              return ListView.builder(
                  itemCount: data.length,
                  itemBuilder: (BuildContext context, index) {
                    return Card(child: Text(data[index].productName));
                  }
              );
            } else {
              return Center(child: Text('no data'));
            }
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
