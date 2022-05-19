import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shamo/models/cart_model.dart';
import 'package:shamo/providers/cart_provider.dart';
import 'package:shamo/providers/wishlist_provider.dart';
import 'package:shamo/theme.dart';

class CartCard extends StatelessWidget {
  final CartModel cart;
  CartCard(this.cart);
  @override
  Widget build(BuildContext context) {
    CartProvider cartProvider = Provider.of<CartProvider>(context);
    return Container(
        margin: EdgeInsets.only(
            top: defaultMargin, left: defaultMargin, right: defaultMargin),
        padding: EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 10,
        ),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12), color: backgroundColor4),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  width: 64,
                  height: 64,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    image: DecorationImage(
                      image: NetworkImage(cart.product.galleries[0].url),
                    ),
                  ),
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
                      ),
                      SizedBox(
                        height: 2,
                      ),
                      Text(
                        "\$${cart.product.price}",
                        style: priceTextStyle,
                      ),
                    ],
                  ),
                ),
                Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        cartProvider.addQuantity(cart.id);
                      },
                      child: Image.asset(
                        "assets/icon_add.png",
                        width: 16,
                      ),
                    ),
                    SizedBox(
                      height: 2,
                    ),
                    Text(cart.quantity.toString(), style: primaryTextStyle),
                    SizedBox(
                      height: 2,
                    ),
                    GestureDetector(
                      onTap: () {
                        cartProvider.reduceQuantity(cart.id);
                      },
                      child: Image.asset(
                        "assets/icon_min.png",
                        width: 16,
                      ),
                    )
                  ],
                )
              ],
            ),
            SizedBox(
              height: 12,
            ),
            GestureDetector(
              onTap: () {
                cartProvider.removeCart(cart.id);
              },
              child: Row(
                children: [
                  Image.asset(
                    "assets/icon_remove.png",
                    width: 10,
                  ),
                  SizedBox(
                    width: 4,
                  ),
                  Text(
                    "Remove",
                    style: alertTextStyle.copyWith(
                        fontSize: 12, fontWeight: light),
                  )
                ],
              ),
            )
          ],
        ));
  }
}
