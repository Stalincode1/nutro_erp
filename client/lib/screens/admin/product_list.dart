import 'package:flutter/material.dart';
import '../../model/product.dart';
import '../../service/admin/admin_service.dart';
import 'add_product_dialog.dart';

class ProductListPage extends StatefulWidget {
  @override
  _ProductListPageState createState() => _ProductListPageState();
}

class _ProductListPageState extends State<ProductListPage> {
  List<Product> _products = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchProducts();
  }

  // Function to refresh the product list
  void refreshProductList() {
    setState(() {
      _products = [];
      _isLoading = true;
    });
    fetchProducts();
  }

  // Fetch products from API
  Future<void> fetchProducts() async {
    AdminService httphelper = AdminService();
    List<Product> products = await httphelper.fetchallProducts();
    setState(() {
      _products = products;
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final imageSize = screenWidth *
        0.25; // Both width and height will be equal for a square shape

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Show the AddProductDialog and call refreshProductList after product is added
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AddProductDialog(onProductAdded: refreshProductList);
            },
          );
        },
        child: Icon(Icons.add),
      ),
      appBar: AppBar(
        title: Text('Products'),
      ),
      body: _isLoading
          ? Center(child: CircularProgressIndicator())
          : RefreshIndicator(
              // Wrap ListView with RefreshIndicator for pull-to-refresh functionality
              onRefresh: fetchProducts,
              child: ListView.builder(
                itemCount: _products.length,
                itemBuilder: (context, index) {
                  final product = _products[index];
                  return Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Card(
                      elevation: 4,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: ListTile(
                        contentPadding: EdgeInsets.all(16.0),
                        leading: Container(
                          width: imageSize,
                          height:
                              imageSize, // Set height same as width for square shape
                          decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius: BorderRadius.circular(8),
                            image: DecorationImage(
                              image: NetworkImage(
                                product.images[0] ??
                                    'https://via.placeholder.com/150',
                              ),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        title: Text(
                          product.name,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 8),
                            Text(
                              product.description,
                              style: TextStyle(fontSize: 12),
                            ),
                            SizedBox(height: 4),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Price: ${product.quantity.price}',
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 38, 97, 41),
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  'Stock: ${product.currentStock}',
                                  style: TextStyle(
                                    color: Colors.green,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        trailing: Icon(Icons.arrow_forward_ios, size: 16),
                        onTap: () {
                          // Handle item tap
                        },
                      ),
                    ),
                  );
                },
              ),
            ),
    );
  }
}
