import 'package:client/screens/widgets/custom_bottom_nav_bar.dart';
import 'package:client/screens/widgets/custom_search_bar.dart';
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


  @override
  Widget build(BuildContext context) {

    final screenHeight = MediaQuery.of(context).size.height;

    int _currentIndex=0;

    final List imglist=[
      'https://m.media-amazon.com/images/I/71oR9w5AjbL.jpg',
      'https://images.immediate.co.uk/production/volatile/sites/30/2024/03/Nuts-2def52f.jpg?quality=90&resize=440,400',
      'https://media.istockphoto.com/id/610957954/photo/mixed-nuts-shelled.jpg?s=612x612&w=0&k=20&c=Bg43e5FkTJnOPQwwvy5Qb38H-kShEMGBR3TxzLi3vT8=',
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


            Center(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [

                  //Search Bar
                  Padding(
                    padding:EdgeInsets.only(top: 15,bottom: 15),
                    child: CustomSearchBar(),
                  ),

                  // Wishlist Button
                  IconButton(
                      onPressed: (){},
                      icon:const Icon(Icons.favorite_border),
                  ),
                ],
              ),
            ),



            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
                image: DecorationImage(
                    opacity: 0.7,
                    image: AssetImage(
                        'assets/images/back_ground.png',
                    ),
                  fit: BoxFit.cover
                ),
                borderRadius: BorderRadius.only(topLeft: Radius.circular(30),topRight:Radius.circular(30))
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [

                  SizedBox(height: 25,),
                  //Carousel Slider
                  CarouselSlider(
                      items: imglist.map((item)=>Container(
                        padding: EdgeInsets.only(top: 10,bottom: 10),
                        margin: EdgeInsets.symmetric(horizontal: 8),
                        child:Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              border: Border.all(
                                  color: Colors.grey,
                              ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.3), // Shadow color
                                offset: Offset(1, 2), // Shadow offset
                                blurRadius: 8, // Shadow blur radius
                                spreadRadius: 2, // Shadow spread radius
                              ),
                            ],
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(25),
                            child:  Image.network(item)),
                        ),
                         )).toList(),

                      options: CarouselOptions(
                        initialPage: 0,
                        aspectRatio: 16/9,
                        viewportFraction: 1,
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
                    padding: const EdgeInsets.only(left: 30,right: 30),
                    height: screenHeight*0.40,
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
              ),
            )

          ]
        ),
      ),



      //Bottom Navigation Bar
      bottomNavigationBar: CustomBottomNavBar()

    );

  }
}
