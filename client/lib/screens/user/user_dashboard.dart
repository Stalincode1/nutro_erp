import 'package:client/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import '../widgets/custom_horizaontal_divider.dart';
import '../widgets/custom_list_tile.dart';

class UserDashboard extends StatefulWidget {
  const UserDashboard({super.key});

  @override
  State<UserDashboard> createState() => _UserDashboardState();
}

class _UserDashboardState extends State<UserDashboard> {


  // final CarouselController _carouselController = CarouselController();

  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  
  @override
  Widget build(BuildContext context) {

    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    int _currentIndex=0;

    final List imglist=[
      'https://media.istockphoto.com/id/610957954/photo/mixed-nuts-shelled.jpg?s=612x612&w=0&k=20&c=Bg43e5FkTJnOPQwwvy5Qb38H-kShEMGBR3TxzLi3vT8=',
    ];

    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(25)
              ),
              child: Icon(
                Icons.ac_unit,
                size: 24,),
              ),
            SizedBox(width: 5,),
            Text('Nutro')
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            // Search Bar
            Center(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    padding: const EdgeInsets.only(left: 15,right: 8),
                    width: screenWidth*0.8,
                    height: screenHeight*0.05,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      border: Border.all(color: Colors.black38),
                      color: Colors.grey.shade200
                    ),
                    child:  TextFormField(
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          suffixIcon: Icon(Icons.search),
                          floatingLabelBehavior: FloatingLabelBehavior.never,
                          hintText: 'Search',
                          // contentPadding: EdgeInsets.only(left: 5,top:5.5)
                        ),
                      ),
                  ),
                  IconButton(
                      onPressed: (){},
                      icon:const Icon(Icons.favorite_border),
                  ),
                ],
              ),
            ),



            Column(
              mainAxisSize: MainAxisSize.min,
              children: [

                //Carousel Slider
                CarouselSlider(
                    items: imglist.map((item)=>Container(
                      padding: EdgeInsets.only(top: 10,bottom: 10),
                      margin: EdgeInsets.symmetric(horizontal: 8),
                      child:ClipRRect(
                        borderRadius: BorderRadius.circular(25),
                        child:  Image.network(item)),
                       )).toList(),

                    options: CarouselOptions(
                      initialPage: 0,
                      aspectRatio: 16/9,
                      autoPlay: true,
                      autoPlayAnimationDuration: const Duration(seconds: 2),
                      onPageChanged: (index,reason){
                        setState(() {
                          _currentIndex=index;
                        });
                      }
                    )),

                //Today Deals ListView
                const CustomHorizaontalDivider(title: 'Today Deals'),
                Container(
                  height: screenHeight*0.20,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      CustomListTile(),
                      CustomListTile(),
                      CustomListTile(),
                      CustomListTile(),
                      CustomListTile(),
                      CustomListTile(),
                    ],
                  ),
                ),

                //New Products ListView
                const CustomHorizaontalDivider(title: 'New Products'),
                Container(
                  height: screenHeight*0.20,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      CustomListTile(),
                      CustomListTile(),
                      CustomListTile(),
                      CustomListTile(),
                      CustomListTile(),
                      CustomListTile(),
                    ],
                  ),
                ),

                //Mostly Liked Products GridView
                const CustomHorizaontalDivider(title: 'Mostly liked'),
                Container(
                  padding: const EdgeInsets.only(left: 10,right: 10),
                  height: screenHeight*0.455,
                  child: GridView.count(
                    primary: false,
                    crossAxisSpacing:15,
                    mainAxisSpacing: 15,
                    crossAxisCount: 2,
                    shrinkWrap: true,
                    children: <Widget>[
                      CustomListTile(),
                      CustomListTile(),
                      CustomListTile(),
                      CustomListTile(),
                      CustomListTile(),
                      CustomListTile(),
                    ],
                  ),
                ),

                //Wishlist ListView
                const CustomHorizaontalDivider(title: 'Wishlist'),
                Container(
                  height: screenHeight*0.20,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      CustomListTile(),
                      CustomListTile(),
                      CustomListTile(),
                      CustomListTile(),
                      CustomListTile(),
                      CustomListTile(),
                    ],
                  ),
                ),

              ],
            )

          ]
        ),
      ),



      //Bottom Navigation Bar
      bottomNavigationBar: Container(
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
      ),

    );

  }
}
