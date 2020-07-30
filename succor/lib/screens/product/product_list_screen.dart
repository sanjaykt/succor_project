import 'package:flutter/material.dart';
import 'package:succor/Widgets/drawer.dart';
import 'package:succor/screens/product/product_details.dart';

class ProductListScreen extends StatefulWidget {
  static final routeName = 'home_screen';


  @override
  _ProductListScreenState createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
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
      body: Container(
        child: Card(
          child: Text('Product List here'),
        ),
      ),
    );
  }
}
