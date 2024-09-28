import 'dart:convert';
import 'package:client/model/token_model.dart';
import 'package:client/service/shared_service.dart';
import 'package:http/http.dart' as http;
import 'package:client/config/app_config.dart';

import '../../model/product.dart';

class AdminService {
  final String _helper = AppConfig.baseUrl;

  String access_token =
      "eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiI4Nzc0NzU0MTIxIiwiaWF0IjoxNzI2OTA4NDM0LCJleHAiOjE3Mjc1MTMyMzQsImp0aSI6ImE3YWMxZWMzLWJhMDgtNGMyYy1iNWVmLWY4MmFmNWVmODlhYSJ9.z3RdLXiBWZaW6UWbuJvoZDy8af9Mv2o_SwoAqUxHn3U";

  Future<void> addproduct(String name, String description, String category,
      int quantity, double price, int currentstock) async {
    // TokenModel? token = await SharedService.getToken();
    try {
      var headersList = {
        'Authorization': 'Bearer $access_token',
        'Content-Type': 'application/json'
      };
      var url = Uri.parse('$_helper/api/products/add-products');

      var body = {
        "name": name,
        "description": description,
        "category": category,
        "quantity": quantity,
        "price": price,
        "currentStock": currentstock,
        "images": "image1.jpg,image2.jpg"
      };

      var req = http.Request('POST', url);
      req.headers.addAll(headersList);
      req.body = json.encode(body);

      var res = await req.send();
      final resBody = await res.stream.bytesToString();

      if (res.statusCode >= 200 && res.statusCode < 300) {
        print(resBody);
      } else {
        print(res.reasonPhrase);
      }
    } catch (e) {
      print("Error while adding product: $e");
    }
  }

  Future<List<Product>> fetchallProducts() async {
    final String apiUrl = '$_helper/api/products';
    var headersList = {
      'Authorization': 'Bearer $access_token',
      'Content-Type': 'application/json'
    };

    final response = await http.get(Uri.parse(apiUrl), headers: headersList);

    if (response.statusCode >= 200 && response.statusCode < 300) {
      List<dynamic> body = jsonDecode(response.body);
      List<Product> products =
          body.map((dynamic item) => Product.fromJson(item)).toList();
      return products;
    } else {
      throw Exception('Failed to load products: ${response.reasonPhrase}');
    }
  }
}
