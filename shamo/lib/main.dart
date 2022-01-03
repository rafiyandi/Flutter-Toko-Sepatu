import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shamo/page/cart_page.dart';
import 'package:shamo/page/checkout_page.dart';
import 'package:shamo/page/checkout_succes_page.dart';
import 'package:shamo/page/detail_chat_page.dart';
import 'package:shamo/page/edit_profile_page.dart';
import 'package:shamo/page/home/main_page.dart';
import 'package:shamo/page/product_page.dart';
import 'package:shamo/page/sign_in_page.dart';
import 'package:shamo/page/sign_up_page.dart';
import 'package:shamo/page/splash_page.dart';
import 'package:shamo/providers/auth_provider.dart';
import 'package:shamo/providers/product_provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AuthProvider()),
        ChangeNotifierProvider(create: (context) => ProductProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          "/": (context) => SplashPage(),
          "/sign-in": (context) => SignInPage(),
          "/sign-up": (context) => SignUpPage(),
          "/home": (context) => MainPage(),
          "/detail-chat": (context) => DetailChatPage(),
          "/edit-profile": (context) => EditProfilePage(),
          "/product": (context) => ProductPage(),
          "/cart": (context) => CartPage(),
          "/checkout": (context) => CheckoutPage(),
          "/checkout-succes": (context) => CheckoutSuccesPage(),
        },
      ),
    );
  }
}
