import 'package:flutter/material.dart';
import 'package:shamo/models/cart_model.dart';
import 'package:shamo/theme.dart';

class CheckoutCard extends StatelessWidget {
  CartModel cart;
  CheckoutCard(this.cart);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 12),
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 20),
      decoration: BoxDecoration(color: backgroundColor4),
      child: Row(
        children: [
          Container(
            height: 60,
            width: 60,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                image: DecorationImage(
                  image: NetworkImage(cart.product.galleries[0].url),
                )),
          ),
          SizedBox(
            width: 12,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  cart.product.name,
                  style: primaryTextStyle.copyWith(fontWeight: semiBold),
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  "\$${cart.product.price}",
                  style: priceTextStyle,
                ),
              ],
            ),
          ),
          SizedBox(
            width: 12,
          ),
          Text(
            cart.quantity.toString() + " Items",
            style: subtitleTextStyle.copyWith(fontSize: 12),
          )
        ],
      ),
    );
  }
}
