import 'package:client/constants/ui_routes.dart';
import 'package:client/model/user_model.dart';
import 'package:client/screens/admin/dashboard_page.dart';
import 'package:client/screens/admin/home_page.dart';
import 'package:client/screens/user/home_screen.dart';
import 'package:client/screens/user/login_screen.dart';
import 'package:client/screens/user/user_dashboard.dart';
import 'package:client/screens/user/user_orders_screen.dart';
import 'package:client/service/shared_service.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreen extends StatefulWidget {
  static String routeName = UiScreenRoutes.spalsh;
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToNextScreen();
  }

  void _navigateToNextScreen() async {
    await Future.delayed(const Duration(seconds: 3));
    _checkUserRole();
  }

  void _checkUserRole() async {
    UserModel? user = await SharedService.getUserData();

    if (user != null) {
      int? isAdmin = int.tryParse(user.isAdmin ?? '0') ?? 0;

      if (isAdmin == 0) {
        Navigator.pushReplacementNamed(context, HomePageScreen.routeName);
      } else {
        Navigator.pushReplacementNamed(context, AdminHomePage.routeName);
      }
    } else {
      Navigator.pushReplacementNamed(context, LoginScreen.routeName);
      debugPrint("User data not found, redirecting to login screen");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background image
          Positioned.fill(
            child: Image.asset(
              'assets/images/back_ground.png',
              fit: BoxFit.cover,
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('BerryDays',
                    style: GoogleFonts.poppins(
                      fontSize: 38,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    )),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
