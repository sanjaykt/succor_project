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
      body: Container(
        padding: EdgeInsets.all(10),
        child: FutureBuilder(
          future: _productProvider.getAllProducts(),
          builder: (BuildContext context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasData) {
                List<Product> data = snapshot.data.data;
                return GridView.count(
                    crossAxisCount: 2,
                    children: List.generate(data.length, (index) {
                      return InkWell(
                        onTap: () {
                          print(data[index].productName);
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      ProductDetailsScreen(
                                          productToBeEdited: data[index])));
                        },
                        child: Card(
                          color: Colors.red[50],
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(data[index].productName),
                              SizedBox(height: 10),
                              Text(data[index].productDetails),
                            ],
                          ),
                        ),
                      );
                    }));
              } else {
                return Center(child: Text('no data'));
              }
            } else {
              return Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }
}
