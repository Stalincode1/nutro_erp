import 'package:flutter/material.dart';
import 'package:client/model/common_response_model.dart';
import 'package:client/model/token_model.dart';
import 'package:client/networking/api_base_helper.dart';
import 'package:client/service/shared_service.dart';

class OAuthService {
  final ApiBaseHelper _helper = ApiBaseHelper();
  //final UserService _userService = UserService();

  Future<CommonResponseModel?> login(mobileNo) async {
    String returnError = "";
    try {
      Map<String, dynamic>? response =
          await _helper.getToken(mobileNo);
      debugPrint("$response");
      if (response != null && !response.containsKey("error_description")) {
        TokenModel tokenModel = TokenModel.fromMap(response);
        await SharedService.setToken(tokenModel);
       // CommonResponseModel? user = await _userService.getCurrentUser();
       // return user;
      } else if (response != null) {
        returnError = response["error_description"];
      }
    } catch (error, st) {
      debugPrint("Error while OAuthService:: $error::StackTrace::$st");
      returnError = "$error";
    }
    return CommonResponseModel(data: null, error: true, message: returnError);
  }
}