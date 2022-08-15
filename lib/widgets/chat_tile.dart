import 'package:flutter/material.dart';
import 'package:shamo/models/message_model.dart';
import 'package:shamo/models/product_model.dart';
import 'package:shamo/page/detail_chat_page.dart';
import 'package:shamo/theme.dart';

class ChatTile extends StatelessWidget {
  final MessageModel message;
  ChatTile(this.message);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    DetailChatPage(UninitializedProductModel())));
      },
      child: Container(
        margin: EdgeInsets.only(top: 33),
        child: Column(
          children: [
            Row(
              children: [
                Image.asset("assets/image_shop_logo.png", width: 54),
                SizedBox(
                  width: 12,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Shoe Store",
                        style: primaryTextStyle.copyWith(
                            fontSize: 15, fontWeight: regular),
                      ),
                      Text(
                        message.message,
                        style: secondaryTextStyle.copyWith(
                            fontSize: 14, fontWeight: light),
                        overflow: TextOverflow.ellipsis,
                      )
                    ],
                  ),
                ),
                Text("Now",
                    style: secondaryTextStyle.copyWith(
                        fontSize: 10, fontWeight: regular))
              ],
            ),
            SizedBox(
              height: 12,
            ),
            Divider(
              thickness: 1,
              color: Color(0xff2B2939),
            )
          ],
        ),
      ),
    );
  }
}
