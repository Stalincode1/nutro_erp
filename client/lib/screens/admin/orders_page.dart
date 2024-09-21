//orders nutro

import 'package:flutter/material.dart';

class OrdersPage extends StatefulWidget {
  const OrdersPage({super.key});

  @override
  State<OrdersPage> createState() => _OrdersPageState();
}

class _OrdersPageState extends State<OrdersPage> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Orders',style: TextStyle(fontWeight: FontWeight.bold),),
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(text: 'Placed'),
            Tab(text: 'Dispatch'),
            Tab(text: 'Deliver'),
            Tab(text: 'Cancel'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _buildOrdersList('Placed'),
          _buildOrdersList('Dispatched'),
          _buildOrdersList('Delivered'),
          _buildOrdersList('Cancelled'),
        ],
      ),
    );
  }

  Widget _buildOrdersList(String orderStatus) {
    // Replace this with real data
    List<String> orders = List.generate(10, (index) => 'Order $index - $orderStatus');

    return ListView.builder(
      itemCount: orders.length,
      itemBuilder: (context, index) {
        return Card(
          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          child: ListTile(
            title: Text(orders[index]),
            subtitle: Text('Customer: Nagma \nTotal: \₹120.00'),
            trailing: orderStatus == 'Placed'
                ? _buildStatusDropdown()
                : Text(orderStatus), // Show status for other tabs
          ),
        );
      },
    );
  }

  Widget _buildStatusDropdown() {
    return DropdownButton<String>(
      value: 'Placed',
      items: const [
        DropdownMenuItem(value: 'Placed', child: Text('Placed')),
        DropdownMenuItem(value: 'Dispatched', child: Text('Dispatch')),
        DropdownMenuItem(value: 'Delivered', child: Text('Delivered')),
        DropdownMenuItem(value: 'Cancelled', child: Text('Cancelled')),
      ],
      onChanged: (String? newValue) {
        // Implement order status change logic here
      },
    );
  }
}
