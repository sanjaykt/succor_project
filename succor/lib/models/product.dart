import 'dart:io';

class Product {
  int productId;
  String productName;
  String productDetails;
  String productImageUrl;
  File image;
  int createdByUserId;
  int modifiedByUserId;
  DateTime createdDate;
  DateTime modifiedDate;
  int statusId;

  Product();

  clone() => Product.fromJson(toJson());

  Product.fromJson(Map<String, dynamic> json)
      : productId = json['productId'],
        productName = json['productName'],
        productDetails = json['productDetails'],
        productImageUrl = json['productImageUrl'],
        createdByUserId = json['createdByUserId'],
        modifiedByUserId = json['modifiedByUserId'],
        createdDate = (json['createdDate'] != null ? DateTime.parse(json['createdDate']) : null),
        modifiedDate = (json['modifiedDate'] != null ? DateTime.parse(json['modifiedDate']) : null),
        statusId = json['statusId'];

  Map<String, dynamic> toJson() => {
        'productId': productId,
        'productName': productName,
        'productDetails': productDetails,
        'productImageUrl': productImageUrl,
        if (createdDate != null) 'createdDate': createdDate.toString(),
        if (modifiedDate != null) 'modifiedDate': modifiedDate.toString(),
        'createdByUserId': createdByUserId,
        'modifiedByUserId': modifiedByUserId,
        if (statusId != null) 'statusId': statusId,
      };
}
