import 'package:client/screens/splash_screen.dart';
import 'package:client/screens/admin/dashboard_page.dart';
import 'package:client/screens/admin/home_page.dart';
import 'package:client/screens/user/home_screen.dart';
import 'package:client/screens/user/user_dashboard.dart';
import 'package:flutter/material.dart';
import 'package:client/routing/routes.dart';

import 'screens/user/login_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  String defaultRoute = SplashScreen.routeName;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Nutro App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Color(0xfffee6a4)),
        backgroundColor: Colors.transparent,
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: defaultRoute,
      routes: routes,
      // home: HomePage(),
    );
  }
}

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key, required this.title});
//
//   final String title;
//
//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }
//
// class _MyHomePageState extends State<MyHomePage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Theme.of(context).colorScheme.inversePrimary,
//         title: Text(widget.title),
//       ),
//       body: Center(child: Text("V.rise , get ready....")),
//     );
//   }
// }
