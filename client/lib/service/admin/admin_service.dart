import 'dart:convert';
import 'package:client/model/token_model.dart';
import 'package:client/service/shared_service.dart';
import 'package:http/http.dart' as http;
import 'package:client/config/app_config.dart';

import '../../model/product.dart';
import '../../networking/api_base_helper.dart';

class AdminService {
  final String ip_helper = AppConfig.baseUrl;

  final ApiBaseHelper _helper = ApiBaseHelper();

  Future<void> addproduct(String name, String description, String category,
      int quantity, double price, int currentstock) async {
    var body = {
      "name": name,
      "description": description,
      "category": category,
      "quantity": quantity,
      "price": price,
      "currentStock": currentstock,
      "images": "image1.jpg,image2.jpg"
    };

    var req = _helper.post("/api/products/add-products", body);
  }

  Future<List<Product>> fetchallProducts() async {
    String temptocken =
        "eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiI4Nzc0NzU0MTIxIiwiaWF0IjoxNzI4MTIxNzA3LCJleHAiOjE3Mjg3MjY1MDcsImp0aSI6IjFkOWE4YmMxLWY4NTktNDkxMy04NDlhLTVmODkyZTBlNmM3MiJ9.P8_sHOKtm-LCBbhJL4BeRN9mnFf5fCmOflVFZT_QBOI";
    TokenModel? token = await SharedService.getToken();
    final String apiUrl = '$ip_helper/api/products';
    var headersList = {
      'Authorization': 'Bearer $token',
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
