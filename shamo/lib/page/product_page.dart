import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shamo/theme.dart';

class ProductPage extends StatefulWidget {
  @override
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  List images = [
    "assets/image_shoes.png",
    "assets/image_shoes.png",
    "assets/image_shoes.png",
  ];

  List familiarShoes = [
    "assets/image_shoes.png",
    "assets/image_shoes.png",
    "assets/image_shoes.png",
    "assets/image_shoes.png",
    "assets/image_shoes.png",
    "assets/image_shoes.png",
    "assets/image_shoes.png",
    "assets/image_shoes.png",
    "assets/image_shoes.png",
  ];

  int currentIndex = 0;

  Widget indicator(int index) {
    return Container(
      width: currentIndex == index ? 16 : 4,
      height: 4,
      margin: EdgeInsets.symmetric(horizontal: 2),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: currentIndex == index ? primaryColor : Color(0xffc4c4c4)),
    );
  }

  Widget familiarShoesCard(String imageUrl) {
    return Container(
      width: 54,
      height: 54,
      margin: EdgeInsets.only(
        right: 16,
      ),
      decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage(imageUrl)),
          borderRadius: BorderRadius.circular(6)),
    );
  }

  Widget header() {
    int index = -1;
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(
              top: 20, left: defaultMargin, right: defaultMargin),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(Icons.chevron_left),
              Icon(
                Icons.shopping_bag,
                color: backgroundColor1,
              ),
            ],
          ),
        ),
        CarouselSlider(
            items: images
                .map(
                  (image) => Image.asset(
                    image,
                    width: MediaQuery.of(context).size.width,
                    height: 310,
                    fit: BoxFit.cover,
                  ),
                )
                .toList(),
            options: CarouselOptions(
                initialPage: 0,
                onPageChanged: (index, reason) {
                  setState(() {
                    currentIndex = index;
                  });
                })),
        SizedBox(
          height: 20,
        ),
        Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: images.map((e) {
              index++;
              return indicator(index);
            }).toList())
      ],
    );
  }

  Widget content() {
    int index = -1;
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(top: 17),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(24),
          ),
          color: backgroundColor1),
      child: Column(
        // NOTE : HEADER
        children: [
          Container(
            margin: EdgeInsets.only(
                top: defaultMargin, right: defaultMargin, left: defaultMargin),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "TERREX URBAN LOW",
                      style: primaryTextStyle.copyWith(
                          fontSize: 18, fontWeight: semiBold),
                    ),
                    Text(
                      "Hiking",
                      style: secondaryTextStyle.copyWith(fontSize: 12),
                    )
                  ],
                ),
                Image.asset(
                  "assets/button_wishlist.png",
                  width: 46,
                )
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: defaultMargin),
            width: double.infinity,
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
                color: backgroundColor2,
                borderRadius: BorderRadius.circular(4)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Price starts from",
                  style: primaryTextStyle,
                  overflow: TextOverflow.ellipsis,
                ),
                Text("\$143,98",
                    style: priceTextStyle.copyWith(
                      fontSize: 16,
                      fontWeight: semiBold,
                    ))
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(
                top: defaultMargin, right: defaultMargin, left: defaultMargin),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Description",
                  style: primaryTextStyle.copyWith(fontWeight: medium),
                ),
                SizedBox(
                  height: 12,
                ),
                Text(
                  "Unpaved trails and mixed surfaces are easy when you have the traction and support you need. Casual enough for the daily commute.",
                  style: subtitleTextStyle.copyWith(fontWeight: semiBold),
                  textAlign: TextAlign.justify,
                )
              ],
            ),
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.only(top: defaultMargin),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: defaultMargin),
                  child: Text(
                    "Fimiliar Shoes",
                    style: primaryTextStyle.copyWith(fontWeight: medium),
                  ),
                ),
                SizedBox(
                  height: 12,
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: familiarShoes.map((image) {
                      index++;
                      return Container(
                        margin: EdgeInsets.only(
                            left: index == 0 ? defaultMargin : 0),
                        child: familiarShoesCard(image),
                      );
                    }).toList(),
                  ),
                )
              ],
            ),
          ),
          //NOTE:BUTTON
          Container(
            margin: EdgeInsets.all(defaultMargin),
            width: double.infinity,
            child: Row(
              children: [
                Container(
                  height: 54,
                  width: 54,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/button_chat.png")),
                  ),
                ),
                SizedBox(
                  width: 16,
                ),
                Expanded(
                  child: Container(
                    height: 54,
                      child: TextButton(
                        onPressed: () {},
                        style: TextButton.styleFrom(
                          backgroundColor: primaryColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12)
                          )
                        ),
                        child: Text(
                          "Add to Cart",
                          style: primaryTextStyle.copyWith(
                              fontSize: 16, fontWeight: semiBold),
                        ),
                      )),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor6,
      body: ListView(
        children: [
          header(),
          content(),
        ],
      ),
    );
  }
}
