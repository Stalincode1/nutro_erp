import 'package:client/constants/ui_routes.dart';
import 'package:client/screens/user/Categories.dart';
import 'package:client/screens/user/add_to_cart.dart';
import 'package:client/screens/user/explore_screen.dart';
import 'package:client/screens/user/user_dashboard.dart';
import 'package:client/screens/widgets/custom_bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../constants/app_colors.dart';

class HomePageScreen extends StatefulWidget {
  static String routeName = UiScreenRoutes.homeScreen;
  const HomePageScreen({super.key});

  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  int _selectedIndex = 0;

  Widget exploreAppBar() {
    return AppBar(
      automaticallyImplyLeading: false,
      title: const Text('Explore'),
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.search),
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.favorite_border),
        ),
      ],
    );
  }

  Widget addToCartAppBar() {
    return AppBar(
      title: const Text('Cart'),
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.favorite_border),
        ),
      ],
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    print(index);
  }

  @override
  void initState() {
    _selectedIndex = 0;
    // TODO: implement initState
    super.initState();
  }

  Widget userDashboardAppBar() {
    return AppBar(
      surfaceTintColor: Colors.white10,
      backgroundColor: Colors.white10,
      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarBrightness: Brightness.light,
        statusBarColor: Color.fromARGB(230, 194, 191, 191),
      ),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Container(
          //   decoration: BoxDecoration(
          //       border: Border.all(color: Colors.black),
          //       borderRadius: BorderRadius.circular(25)),
          //   child: const Icon(
          //     Icons.ac_unit,
          //     size: 24,
          //   ),
          // ),
          const SizedBox(
            width: 5,
          ),
          const Text(
            'BerryDays',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          )
        ],
      ),
    );
  }

  List appBarList = [];

  List bodyList = [
    const UserDashboard(),
    const ExploreScreen(),
    const AddToCartScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    appBarList = [
      userDashboardAppBar(),
      exploreAppBar(),
      addToCartAppBar(),
    ];

    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
        appBar: appBarList[_selectedIndex],
        body: bodyList[_selectedIndex],
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(15), topRight: Radius.circular(15)),
              border: Border.all(color: Colors.black38)),
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(15), topRight: Radius.circular(15)),
            child: BottomAppBar(
              color: Colors.white,
              height: screenSize.height * 0.070,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  IconButton(
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    icon: Icon(
                      Icons.home_filled,
                      color: _selectedIndex == 0
                          ? AppColors.primary
                          : Colors.black,
                    ),
                    // color: _selectedIndex == 0 ? AppColors.primary: Colors.black,
                    onPressed: () {
                      _onItemTapped(0);
                    },
                  ),
                  IconButton(
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    icon: Icon(
                      Icons.explore,
                      color: _selectedIndex == 1
                          ? AppColors.primary
                          : Colors.black,
                    ),
                    // color: _selectedIndex == 1 ? AppColors.primary : Colors.black,
                    onPressed: () {
                      _onItemTapped(1);
                    },
                  ),
                  IconButton(
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    icon: const Icon(Icons.dashboard),
                    color:
                        _selectedIndex == 2 ? AppColors.primary : Colors.black,
                    onPressed: () {
                      _onItemTapped(2);
                    },
                  ),
                  IconButton(
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    icon: const Icon(
                      Icons.shopping_cart,
                    ),
                    color:
                        _selectedIndex == 3 ? AppColors.primary : Colors.black,
                    onPressed: () {
                      _onItemTapped(3);
                    },
                  ),
                  IconButton(
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    icon: const Icon(Icons.person),
                    color:
                        _selectedIndex == 4 ? AppColors.primary : Colors.black,
                    onPressed: () {
                      _onItemTapped(4);
                    },
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
