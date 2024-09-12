import 'package:client/config/app_config.dart';
import 'package:flutter/material.dart';
import 'package:client/model/common_response_model.dart';
import 'package:client/model/token_model.dart';
import 'package:client/networking/api_base_helper.dart';
import 'package:client/service/shared_service.dart';

class OAuthService {
  final ApiBaseHelper _helper = ApiBaseHelper();

  Future<CommonResponseModel?> login(mobileNo) async {
    try {
      Map<String, dynamic> body = {
        "phoneNumber": mobileNo,
      };
      Map<String, dynamic>? response = await _helper.postWithoutToken(
          "${AppConfig.oauthAPI}/generate-otp", body);
      return CommonResponseModel.fromMap(response!);
    } catch (error, st) {
      debugPrint("Error while OAuthService:: $error::StackTrace::$st");
      return null;
    }
  }

  Future<CommonResponseModel?> verifyOtp(mobileNo) async {
    String returnError = "";
    try {
      Map<String, dynamic>? response = await _helper.getToken(mobileNo);
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
