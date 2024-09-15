import 'package:client/constants/ui_routes.dart';
import 'package:flutter/material.dart';

class DashboardPage extends StatefulWidget {
  static String routeName = UiScreenRoutes.adminDashbord;
  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  String _selectedFilter = 'Day'; // Default filter

  // Example data for demonstration
  Map<String, String> _data = {
    'Day': '10 Orders, \500 INR Revenue',
    'Month': '200 Orders, \10,000 INR Revenue',
    'Year': '2,400 Orders, \120,000 INR Revenue',
  };

  void _onFilterChanged(String? newFilter) {
    if (newFilter != null) {
      setState(() {
        _selectedFilter = newFilter;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
        actions: [
          PopupMenuButton<String>(
            icon: Icon(Icons.filter_list),
            onSelected: _onFilterChanged,
            itemBuilder: (BuildContext context) {
              return ['Day', 'Month', 'Year'].map((String choice) {
                return PopupMenuItem<String>(
                  value: choice,
                  child: Text(choice),
                );
              }).toList();
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Filter: $_selectedFilter',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Card(
              child: ListTile(
                title: Text('Total Orders'),
                subtitle: Text(_getFilteredData()), // Filtered data display
              ),
            ),
            Card(
              child: ListTile(
                title: Text('Total Revenue'),
                subtitle: Text(_getFilteredData()), // Filtered data display
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _getFilteredData() {
    // Returns the data based on the selected filter
    return _data[_selectedFilter] ?? 'No data available';
  }
}
