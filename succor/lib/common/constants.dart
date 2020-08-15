import 'package:flutter/material.dart';

var kPrimaryColor200 = Colors.blueGrey[200];
var kPrimaryColor = Colors.blueGrey[700];
var kPrimaryLight = Color(0xFF718792);
var kPrimaryColorDark = Color(0xFF1c313a);
var kOnPrimaryColor = Colors.white;

var kSecondaryColor = Colors.amber[700];
var kSecondaryLight = Color(0xFFffd149);
var kSecondaryDark = Color(0xFFc67100);
var kOnSecondaryColor = Colors.black;

var kSurfaceColor = Colors.white;
var kOnSurfaceColor = Colors.black;

var kBackgroundColor = Colors.blueGrey[100];
var kOnBackgroundColor = Colors.black;

var kErrorColor = Colors.red;
var kOnErrorColor = Colors.white;

class Constants {
  Constants();

//  static const String SERVER = 'http://172.20.10.2:3030';
//  static const String SERVER = 'http://10.110.44.136:3030';

  static const String SERVER = 'http://192.168.43.122:3030';
  static const Map<String, String> HEADER = {"Content-Type": "application/json"};
}
