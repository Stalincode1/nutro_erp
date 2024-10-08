import 'package:client/constants/ui_routes.dart';
import 'package:client/model/common_response_model.dart';
import 'package:client/screens/user/otp_verify.dart';
import 'package:client/service/oauth_login_service.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends StatefulWidget {
  static String routeName = UiScreenRoutes.login;
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController mobileNoController = TextEditingController();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final OAuthService service = OAuthService();

  void login() async {
    try {
      CommonResponseModel? response =
          await service.login(mobileNoController.text);

      if (response != null && response.status == 200) {
        // Extract OTP and phone number from the response
        String otp = response.data?['otp'] ?? '';
        String phoneNumber = response.data?['phoneNumber'] ?? '';

        Navigator.pushNamed(
          context,
          OtpVerifyScreen.routeName,
          arguments: {'otp': otp, 'phoneNumber': phoneNumber},
        );
      } else {
        debugPrint("Login failed: No response");
      }
    } catch (e) {
      debugPrint("Exception during login: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    // Get screen width and height
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  width: screenWidth,
                  height: screenHeight * 0.4, // 40% of screen height
                  color: Color(0xffF5CB58),
                  child: Center(
                    child: Text(
                      "Login",
                      style: GoogleFonts.poppins(
                          fontSize: 24, color: Colors.white),
                    ),
                  ),
                ),
                Container(
                  width: screenWidth,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                    color: Colors.white,
                  ),
                  child: Form(
                    key: _formKey, // Ensure this is GlobalKey<FormState>
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Welcome",
                            style: GoogleFonts.leagueSpartan(fontSize: 18),
                          ),
                          SizedBox(height: 10),
                          Text(
                            "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
                            style: GoogleFonts.leagueSpartan(fontSize: 14),
                          ),
                          SizedBox(height: 20),
                          Text("Enter Mobile No"),
                          TextFormField(
                            controller: mobileNoController,
                            keyboardType: TextInputType.phone,
                            validator: (value) {
                              if (value == null ||
                                  value.isEmpty ||
                                  value.length != 10) {
                                return "Please enter a valid mobile number";
                              }
                              return null;
                            },
                            // decoration: InputDecoration(
                            //   border: OutlineInputBorder(),
                            //   contentPadding: EdgeInsets.symmetric(
                            //       horizontal: 10, vertical: 15),
                            // ),
                          ),
                          SizedBox(height: 20),
                          Center(
                            child: ElevatedButton(
                              onPressed: () {
                                if (_formKey.currentState?.validate() ??
                                    false) {
                                  login();
                                }
                              },
                              child: Text("Login"),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
