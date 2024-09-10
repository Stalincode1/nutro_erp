import 'package:flutter/material.dart';

import '../../constants/app_colors.dart';

class CustomBottomNavBar extends StatefulWidget {
  const CustomBottomNavBar({super.key});

  @override
  State<CustomBottomNavBar> createState() => _CustomBottomNavBarState();
}

class _CustomBottomNavBarState extends State<CustomBottomNavBar> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {

    final screenHeight = MediaQuery.of(context).size.height;

    return Container(
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(15),
              topRight: Radius.circular(15)
          ),
          border:Border.all(color: Colors.black38)
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15),
            topRight: Radius.circular(15)
        ),
        child: BottomAppBar(
          color: Colors.white,
          height: screenHeight*0.070,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              IconButton(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                icon: Icon(Icons.home_outlined),
                color: _selectedIndex == 0 ? AppColors.primary: Colors.black,
                onPressed: (){
                  _onItemTapped(0);
                },
              ),
              IconButton(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                icon: Icon(Icons.explore_outlined),
                color: _selectedIndex == 1 ? AppColors.primary : Colors.black,
                onPressed: (){
                  _onItemTapped(1);
                },
              ),
              IconButton(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                icon: Icon(Icons.dashboard_outlined),
                color: _selectedIndex == 2 ? AppColors.primary : Colors.black,
                onPressed: (){
                  _onItemTapped(2);
                },
              ),
              IconButton(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                icon: Icon(Icons.shopping_cart_outlined),
                color: _selectedIndex == 3 ? AppColors.primary : Colors.black,
                onPressed: (){
                  _onItemTapped(3);
                },
              ),
              IconButton(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                icon: Icon(Icons.person_outlined),
                color: _selectedIndex == 4 ? AppColors.primary : Colors.black,
                onPressed: (){
                  _onItemTapped(4);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
