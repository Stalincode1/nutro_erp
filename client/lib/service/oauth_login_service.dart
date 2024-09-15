import 'package:client/config/app_config.dart';
import 'package:flutter/material.dart';
import 'package:client/model/common_response_model.dart';
import 'package:client/networking/api_base_helper.dart';

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

  Future<CommonResponseModel?> verifyOtp(String mobileNo, String otp) async {
    String returnError = "";
    try {
      Map<String, dynamic> body = {"phoneNumber": mobileNo, "otp": otp};
      Map<String, dynamic>? response = await _helper.postWithoutToken(
          "${AppConfig.oauthAPI}/verify-otp", body);

      debugPrint("Response: $response");
      if (response != null && !response.containsKey("error_description")) {
        return CommonResponseModel(
            data: response,
            error: false,
            message: "OTP verification successful.");
      } else if (response != null) {
        returnError = response["error_description"];
      }
    } catch (error, st) {
      debugPrint("Error in OAuthService: $error:: StackTrace: $st");
      returnError = error.toString();
    }
    return CommonResponseModel(data: null, error: true, message: returnError);
  }
}
