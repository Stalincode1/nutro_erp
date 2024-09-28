import 'dart:io';
import 'package:client/screens/admin/home_page.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../service/admin/admin_service.dart';

class AddProductDialog extends StatefulWidget {
  @override
  final Function onProductAdded;
  AddProductDialog({required this.onProductAdded});
  _AddProductDialogState createState() => _AddProductDialogState();
}

class _AddProductDialogState extends State<AddProductDialog> {
  final _formKey = GlobalKey<FormState>();
  final _picker = ImagePicker();
  List<XFile?> _images = [];

  TextEditingController _productName = TextEditingController();
  TextEditingController _quantity = TextEditingController();
  TextEditingController _price = TextEditingController();
  TextEditingController _description = TextEditingController();
  TextEditingController _currentStock = TextEditingController();

  AdminService helper = new AdminService();

  Future<void> _pickImages() async {
    if (_images.length >= 3) return;

    final List<XFile>? selectedImages = await _picker.pickMultiImage();
    if (selectedImages != null) {
      setState(() {
        _images.addAll(selectedImages.take(3 - _images.length));
      });
    }
  }

  void _removeImage(int index) {
    setState(() {
      _images.removeAt(index);
    });
  }

  void _saveProduct() async {
    if (_formKey.currentState?.validate() ?? false) {
      _formKey.currentState?.save();

      double price = int.tryParse(_price.text)!.toDouble();
      int? quantity = int.tryParse(_quantity.text);
      int? currentstock = int.tryParse(_currentStock.text);

      // Save the product using AdminService
      await helper.addproduct(_productName.text, _description.text, "FRUITS",
          quantity!, price, currentstock!);

      // Notify parent to refresh product list
      widget.onProductAdded();

      Navigator.of(context).pop(); // Close the dialog
    }
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Container(
        width: 400, // Set a fixed width for the dialog
        padding: EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Add Product',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                SizedBox(height: 15),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Product Name',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  controller: _productName,
                  validator: (value) {
                    return value?.isEmpty ?? true
                        ? 'Please enter product name'
                        : null;
                  },
                ),
                SizedBox(height: 15),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Quantity',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  keyboardType: TextInputType.number,
                  controller: _quantity,
                  validator: (value) {
                    return value?.isEmpty ?? true
                        ? 'Please enter quantity'
                        : null;
                  },
                ),
                SizedBox(height: 15),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Description',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  controller: _description,
                  validator: (value) {
                    return value?.isEmpty ?? true
                        ? 'Please enter description'
                        : null;
                  },
                ),
                SizedBox(height: 15),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Price',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  keyboardType: TextInputType.number,
                  controller: _price,
                  validator: (value) {
                    return value?.isEmpty ?? true ? 'Please enter price' : null;
                  },
                ),
                SizedBox(height: 15),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Current Stock',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  keyboardType: TextInputType.number,
                  controller: _currentStock,
                  validator: (value) {
                    return value?.isEmpty ?? true
                        ? 'Please enter current stock'
                        : null;
                  },
                ),
                SizedBox(height: 20),
                _buildImagePreview(),
                SizedBox(height: 10),
                if (_images.length < 3)
                  ElevatedButton.icon(
                    onPressed: _pickImages,
                    icon: Icon(Icons.upload),
                    label: Text('Upload Images'),
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      backgroundColor: Colors.blueAccent,
                    ),
                  ),
                SizedBox(height: 20),
                // Move the buttons inside the container
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text('Cancel'),
                      style: TextButton.styleFrom(
                        foregroundColor: Colors.redAccent,
                        textStyle: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: _saveProduct,
                      child: Text('Save'),
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        backgroundColor: Colors.greenAccent,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildImagePreview() {
    if (_images.isEmpty) {
      return Center(
        child: Text(
          'No images selected',
          style: TextStyle(color: Colors.grey),
        ),
      );
    }
    return Container(
      height: 120, // Fixed height to prevent dialog resizing
      child: GridView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 1, // Shows one image per row in the grid
          childAspectRatio: 1, // Aspect ratio to keep images square
          mainAxisSpacing: 10,
        ),
        itemCount: _images.length,
        itemBuilder: (context, index) {
          return Stack(
            children: [
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                elevation: 4,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.file(
                    File(_images[index]!.path),
                    width: 100,
                    height: 100,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                right: 0,
                child: IconButton(
                  icon: Icon(Icons.remove_circle, color: Colors.red),
                  onPressed: () => _removeImage(index),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
