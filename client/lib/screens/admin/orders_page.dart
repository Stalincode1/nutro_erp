import 'package:flutter/material.dart';

class OrdersPage extends StatefulWidget {
  static const routeName = '/orders';
  const OrdersPage({super.key});

  @override
  State<OrdersPage> createState() => _MyOrdersPage();
}

class _MyOrdersPage extends State<OrdersPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Orders'),
      ),
      body: ListView.builder(
        itemCount: 10, // Example data count
        itemBuilder: (context, index) {
          return ListTile(
            leading: Icon(Icons.shopping_cart),
            title: Text('Order #$index'),
            subtitle: Text('Order details for item $index'), // Example data
          );
        },
      ),
    );
  }
}
