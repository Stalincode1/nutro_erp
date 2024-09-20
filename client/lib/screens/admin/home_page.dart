import 'package:flutter/material.dart';
import 'dashboard_page.dart';
import 'orders_page.dart';
import 'add_product_dialog.dart';

class AdminHomePage extends StatefulWidget {
  static const routeName = '/admin_home';

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<AdminHomePage> {
  int _selectedIndex = 0;

  // List of pages to navigate to
  static List<Widget> _pages = <Widget>[
    HomePageContent(),
    DashboardPage(),
    OrdersPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (_selectedIndex == 0) {
          return true; // Allow app to exit if on Home Page
        } else {
          setState(() {
            _selectedIndex = 0; // Go back to the Home Page first
          });
          return false;
        }
      },
      child: Scaffold(
        body: _pages[_selectedIndex], // Display selected page
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.dashboard),
              label: 'Dashboard',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.list),
              label: 'Orders',
            ),
          ],
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
        ),
        floatingActionButton: _selectedIndex == 0
            ? FloatingActionButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AddProductDialog();
                    },
                  );
                },
                child: Icon(Icons.add),
              )
            : null, // Show FAB only on Home Page
      ),
    );
  }
}

// Separate Home Page content for the first tab
class HomePageContent extends StatefulWidget {
  const HomePageContent({super.key});

  @override
  State<HomePageContent> createState() => _HomePageContent();
}

class _HomePageContent extends State<HomePageContent> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Center(
        child: Text('Home Page Content'),
      ),
    );
  }
}
