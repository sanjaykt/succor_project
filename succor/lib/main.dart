import 'package:flutter/material.dart';
import 'package:succor/Screens/User/user_details.dart';
import 'package:succor/common/constants.dart';
import 'package:succor/screens/product/product_details.dart';
import 'package:succor/screens/product/product_list_screen.dart';

import 'Screens/Login/login_screen.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Succour',
      theme: ThemeData(
          backgroundColor: kBackgroundColor,
          cardTheme: CardTheme(color: Colors.brown[100]),
          primaryColor: kPrimaryColor,
          primaryColorLight: kPrimaryLight,
          primaryColorDark: kPrimaryColorDark,
          accentColor: kSecondaryColor,
          accentColorBrightness: Brightness.light,
          errorColor: kErrorColor,
          iconTheme: IconThemeData(
            color: kOnSurfaceColor,
          ),
          buttonTheme: ButtonThemeData(
            buttonColor: kPrimaryColor,
            textTheme: ButtonTextTheme.primary,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
          ),
          textTheme: TextTheme(
            headline1: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                letterSpacing: 3,
                color: kOnBackgroundColor),
            bodyText1: TextStyle(color: Colors.black),
          )),
      routes: {
        LoginScreen.routeName: (BuildContext context) => LoginScreen(),
        UserDetails.routeName: (BuildContext context) => UserDetails(),
        ProductListScreen.routeName: (BuildContext context) =>
            ProductListScreen(),
        ProductDetailsScreen.routeName: (BuildContext context) =>
            ProductDetailsScreen(),
      },
    );
  }
}
