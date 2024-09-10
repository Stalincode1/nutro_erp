import 'package:client/screens/user/user_dashboard.dart';
import 'package:client/screens/user/user_order_preview_screen.dart';
import 'package:client/screens/user/user_orders_screen.dart';
import 'package:client/screens/user/wish_list_screen.dart';
import 'package:flutter/material.dart';

final Map<String, WidgetBuilder> routes = {
  //LoginScreen.routeName: (context) => const LoginScreen();
  UserDashboard.routeName : (context) => const UserDashboard(),
  WishList.routeName: (context) => const WishList(),
  UserOrderScreen.routeName : (context) => const UserOrderScreen(),
  OrderPreviewScreen.routeName : (context) => const OrderPreviewScreen(),
};
