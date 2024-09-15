import 'package:client/screens/user/explore_screen.dart';
import 'package:client/screens/user/product_process_screen.dart';
import 'package:client/screens/user/Categories.dart';
import 'package:client/screens/user/login_screen.dart';
import 'package:client/screens/user/otp_verify.dart';
import 'package:flutter/material.dart';
import 'package:client/screens/user/user_dashboard.dart';
import 'package:client/screens/user/user_order_preview_screen.dart';
import 'package:client/screens/user/user_orders_screen.dart';
import 'package:client/screens/user/wish_list_screen.dart';

final Map<String, WidgetBuilder> routes = {
  //LoginScreen.routeName: (context) => const LoginScreen();
  UserDashboard.routeName : (context) => const UserDashboard(),
  ExploreScreen.routeName: (context) => const ExploreScreen(),
  LoginScreen.routeName: (context) => LoginScreen(),
  OtpVerifyScreen.routeName: (context) => OtpVerifyScreen(),
  UserDashboard.routeName: (context) => const UserDashboard(),
  WishList.routeName: (context) => const WishList(),
  UserOrderScreen.routeName : (context) => const UserOrderScreen(),
  OrderPreviewScreen.routeName : (context) => const OrderPreviewScreen(),
  ProductProcessScreen.routeName :(context) => const ProductProcessScreen(),
  UserOrderScreen.routeName: (context) => const UserOrderScreen(),
  OrderPreviewScreen.routeName: (context) => const OrderPreviewScreen(),
  Categories.routeName: (context) => Categories(),
};
