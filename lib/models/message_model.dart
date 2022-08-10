import 'package:shamo/models/product_model.dart';

class Message {
  int userId;
  String message;
  String userName;
  String userImage;
  bool isFromUser;
  ProductModel product;
  DateTime createdAt;
  DateTime updatedAt;

  Message(
      {this.userId,
      this.message,
      this.userName,
      this.userImage,
      this.isFromUser,
      this.product,
      this.createdAt,
      this.updatedAt});

  Message.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    userName = json['userName'];
    userImage = json['userImage'];
    message = json['message'];
    isFromUser = json['isFromUser'];
    product = json['product'] == {}
        ? UninitializedProductModel()
        : ProductModel.fromJson(json['product']);
    createdAt:
    DateTime.parse(json['createdAt']);
    updatedAt:
    DateTime.parse(json['updatedAt']);
  }

  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'userName': userName,
      'userImage': userImage,
      'message': message,
      'isFromUser': isFromUser,
      'product': product is UninitializedProductModel ? {} : product.toJson(),
      'createdAt': createdAt.toString(),
      'updatedAt': updatedAt.toString(),
    };
  }
}
