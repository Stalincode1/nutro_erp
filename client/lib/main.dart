import 'package:client/screens/user/Categories.dart';
import 'package:client/screens/user/user_dashboard.dart';
import 'package:client/screens/user/wish_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:client/routing/routes.dart';
import 'package:client/screens/user/user_orders_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  String defaultRoute = Categories.routeName;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Nutro App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Color(0xfffee6a4)),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: defaultRoute,
      routes: routes,
    );
  }
}
