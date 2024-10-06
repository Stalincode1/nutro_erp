import 'dart:convert';
import 'package:client/model/common_response_model.dart';
import 'package:client/model/token_model.dart';
import 'package:client/service/shared_service.dart';
import 'package:http/http.dart' as http;
import 'package:client/config/app_config.dart';

import '../../model/product.dart';
import '../../networking/api_base_helper.dart';

class AdminService {
  final String ip_helper = AppConfig.baseUrl;

  final ApiBaseHelper _helper = ApiBaseHelper();

  Future<CommonResponseModel?> addProduct(String name, String description,
      String category, int quantity, double price, int currentstock) async {
    try {
      Map<String, dynamic> body = {
        "name": name,
        "description": description,
        "category": category,
        "quantity": quantity,
        "price": price,
        "currentStock": currentstock,
        "images": "image1.jpg,image2.jpg"
      };
      Map<String, dynamic>? response =
          await _helper.post("${AppConfig.adminAdd}/add-products", body);
      return CommonResponseModel.fromMap(response!);
    } catch (e) {
      return null;
    }
  }

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
    print("this is the body $body");
    var req = _helper.post("/products/add-products", body);
  }

  Future<List<Product>> fetchallProducts() async {
    TokenModel? token = await SharedService.getToken();
    final String apiUrl = '$ip_helper/products';
    var headersList = {
      'Authorization': 'Bearer ${token!.accessToken}',
      'Content-Type': 'application/json',
    };

    // Log the token and headers
    print('Token: ${token.accessToken}');
    print('Headers: $headersList');
    print('API URL: $apiUrl');

    try {
      final response = await http.get(Uri.parse(apiUrl), headers: headersList);

      if (response.statusCode >= 200 && response.statusCode < 300) {
        List<dynamic> body = jsonDecode(response.body);
        List<Product> products =
            body.map((dynamic item) => Product.fromJson(item)).toList();
        return products;
      } else {
        // Log the error response
        print('Failed with status code: ${response.statusCode}');
        print('Error response: ${response.body}');
        throw Exception('Failed to load products: ${response.reasonPhrase}');
      }
    } catch (e) {
      print('Error occurred: $e');
      throw e; // Rethrow the error to handle it upstream
    }
  }
}
