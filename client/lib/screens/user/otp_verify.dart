import 'package:client/constants/ui_routes.dart';
import 'package:client/model/common_response_model.dart';
import 'package:client/model/token_model.dart';
import 'package:client/model/user_model.dart';
import 'package:client/screens/admin/dashboard_page.dart';
import 'package:client/screens/user/user_dashboard.dart';
import 'package:client/service/oauth_login_service.dart';
import 'package:client/service/shared_service.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:otp_text_field/otp_text_field.dart';
import 'package:otp_text_field/style.dart';

// ignore: must_be_immutable
class OtpVerifyScreen extends StatefulWidget {
  static String routeName = UiScreenRoutes.otpVerify;

  // String? phoneNo;
  // String? otp;
  OtpVerifyScreen({
    super.key,
  });

  @override
  State<OtpVerifyScreen> createState() => _OtpVerifyScreenState();
}

class _OtpVerifyScreenState extends State<OtpVerifyScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late String phoneNo;
  late String otp;

  final OAuthService _oAuthService = OAuthService();

  void verifyOtp(String userotp) async {
    try {
      CommonResponseModel? response =
          await _oAuthService.verifyOtp(phoneNo, userotp);

      if (response != null && response.error == false) {
        // Assuming the response contains the token and user data
        Map<String, dynamic> responseData =
            response.data as Map<String, dynamic>;
        TokenModel token = TokenModel.fromMap(responseData['token']);
        await SharedService.setToken(token);
        UserModel user = UserModel.fromMap(responseData['user']);
        await SharedService.setUserData(user);
        int? isAdmin = int.tryParse(user.isAdmin ?? '0') ?? 0;

        if (isAdmin == 0) {
          Navigator.pushReplacementNamed(context, UserDashboard.routeName);
        } else {
          Navigator.pushReplacementNamed(context, DashboardPage.routeName);
        }
      } else {
        debugPrint("OTP verification failed: ${response?.message}");
      }
    } catch (e) {
      debugPrint("Otp Error: $e");
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    final args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    phoneNo = args['phoneNumber'] ?? '';
    otp = args['otp'] ?? '';
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: screenWidth,
              height: screenHeight * 0.4,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/back_ground.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              width: screenWidth,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: Form(
                key: _formKey, // Ensure this is a GlobalKey<FormState>
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Text(
                          "Enter the verification code we sent to $phoneNo and this the OTP $otp",
                          style: GoogleFonts.leagueSpartan(fontSize: 18),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Center(
                          child: OTPTextField(
                        length: 4,
                        width: MediaQuery.of(context).size.width,
                        fieldWidth: 40,
                        style: const TextStyle(fontSize: 17),
                        textFieldAlignment: MainAxisAlignment.spaceEvenly,
                        keyboardType: TextInputType.number,
                        fieldStyle: FieldStyle.underline,
                        otpFieldStyle: OtpFieldStyle(
                          borderColor: Colors.yellow,
                        ),
                        onChanged: (pin) {
                          if (pin != null) {
                            print("Changed: " + pin);
                          } else {
                            print("Pin is null");
                          }
                        },
                        onCompleted: (pin) {
                          print("Completed: " + pin);
                          verifyOtp(pin);
                        },
                      )),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
