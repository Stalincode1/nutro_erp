import 'package:flutter/material.dart';
import 'package:client/routing/routes.dart';
import 'package:client/screens/user/user_orders_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
   MyApp({super.key});
  String defaultRoute = UserOrderScreen.routeName;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'client',
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

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(child: Text("V.rise , get ready....")),
    );
  }
}
