import 'dart:convert';

import '../models/cart_model.dart';
import 'package:http/http.dart' as http;

class TransactionService {
  String baseUrl = 'https://shamo-backend.buildwithangga.id/api';

  Future<bool> checkout(
      String token, List<CartModel> carts, double totalPrice) async {
    var url = "$baseUrl/checkout";
    var header = {'Content-Type': 'application/json', 'Authorization': token};
    var body = jsonEncode({
      'address': "Marsemoon",
      'items': carts
          .map((cart) => {
                'id': cart.product.id,
                'quantity': cart.quantity,
              })
          .toList(),
      'status': "PENDING",
      'total_price': totalPrice,
      'shipping_price': 0,
    });

    var response = await http.post(url, headers: header, body: body);
    print("Ini Response " + response.body);

    if (response.statusCode == 200) {
      return true;
    } else {
      throw Exception('Gagal Melakukan Checkout!');
    }
  }
}
