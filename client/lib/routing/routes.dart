import 'package:client/screens/user/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:client/screens/user/user_dashboard.dart';
import 'package:client/screens/user/user_order_preview_screen.dart';
import 'package:client/screens/user/user_orders_screen.dart';
import 'package:client/screens/user/wish_list_screen.dart';

final Map<String, WidgetBuilder> routes = {
  LoginScreen.routeName: (context) => LoginScreen(),
  UserDashboard.routeName: (context) => const UserDashboard(),
  WishList.routeName: (context) => const WishList(),
  UserOrderScreen.routeName: (context) => const UserOrderScreen(),
  OrderPreviewScreen.routeName: (context) => const OrderPreviewScreen(),
};
