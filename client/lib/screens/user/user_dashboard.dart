import 'dart:async';
import 'package:client/screens/user/wish_list_screen.dart';
import 'package:client/screens/widgets/custom_grid_tile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:client/screens/widgets/custom_search_bar.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:shimmer/shimmer.dart';
import '../../constants/app_colors.dart';
import '../../constants/ui_routes.dart';
import '../widgets/custom_horizaontal_divider.dart';
import '../widgets/custom_list_tile.dart';
import 'explore_screen.dart';

class UserDashboard extends StatefulWidget {
  const UserDashboard({super.key});

  static String routeName = UiScreenRoutes.userDashBoard;

  @override
  State<UserDashboard> createState() => _UserDashboardState();
}

class _UserDashboardState extends State<UserDashboard> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    intializeListView();
  }

  bool _listViewLoaded = true;

  Future<void> intializeListView ()async{
    await Future.delayed(const Duration(seconds: 5));
    setState(() {
      _listViewLoaded=false;
    });
  }
  @override
  Widget build(BuildContext context) {

    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    int _currentIndex = 0;

    final List imglist = [
      'https://m.media-amazon.com/images/I/71oR9w5AjbL.jpg',
      'https://images.immediate.co.uk/production/volatile/sites/30/2024/03/Nuts-2def52f.jpg?quality=90&resize=440,400',
      'https://media.istockphoto.com/id/610957954/photo/mixed-nuts-shelled.jpg?s=612x612&w=0&k=20&c=Bg43e5FkTJnOPQwwvy5Qb38H-kShEMGBR3TxzLi3vT8=',
      'https://media.istockphoto.com/id/610957954/photo/mixed-nuts-shelled.jpg?s=612x612&w=0&k=20&c=Bg43e5FkTJnOPQwwvy5Qb38H-kShEMGBR3TxzLi3vT8=',
    ];

    Widget ListViewShimmerEffectForLoading() {
      return Shimmer.fromColors(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[100]!,
        child: Padding(
          padding: EdgeInsets.all(8),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Colors.grey[300],
            ),
            width: 125,
            height: 100,
          ),
        ),
      );
    }

    Widget CarouselShimmerEffectForLoading() {
      return Center(
        child: Shimmer.fromColors(
          baseColor: Colors.grey[300]!,
          highlightColor: Colors.grey[100]!,
          child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Colors.grey[300],
              ),
              width: screenWidth*0.90,
              height: 150,
            ),
        ),
      );
    }

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Center(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              //Search Bar
              Padding(
                padding: EdgeInsets.only(top: 15, bottom: 15),
                child: CustomSearchBar(),
              ),

              // Wishlist Button
              IconButton(
                onPressed: () {
                  Navigator.pushNamed(context,WishList.routeName);
                },
                icon: const Icon(Icons.favorite_border),
              ),
            ],
          ),
        ),
        Expanded(
          child: Container(
            decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
                image: const DecorationImage(
                    opacity: 0.35,
                    image: AssetImage(
                      'assets/images/back_ground.png',
                    ),
                    fit: BoxFit.cover),
                borderRadius:const BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30))),
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30)
              ),
              child: SingleChildScrollView(
                child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        decoration: const BoxDecoration(
                            borderRadius:BorderRadius.only(
                                topRight: Radius.circular(30),
                                topLeft: Radius.circular(30)
                            )
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const SizedBox(
                              height: 25,
                            ),
                            //Carousel Slider
                            !_listViewLoaded
                                ?CarouselSlider(
                                items: imglist
                                    .map((item) => Container(
                                  padding:
                                  EdgeInsets.only(top: 10, bottom: 10),
                                  margin: EdgeInsets.symmetric(horizontal: 8),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(25),
                                      border: Border.all(
                                        color: Colors.grey,
                                      ),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black.withOpacity(
                                              0.3), // Shadow color
                                          offset:
                                          Offset(1, 2), // Shadow offset
                                          blurRadius: 8, // Shadow blur radius
                                          spreadRadius:
                                          2, // Shadow spread radius
                                        ),
                                      ],
                                    ),
                                    child: ClipRRect(
                                        borderRadius:
                                        BorderRadius.circular(25),
                                        child: Image.network(item)),
                                  ),
                                ))
                                    .toList(),
                                options: CarouselOptions(
                                    initialPage: 0,
                                    aspectRatio: 16 / 9,
                                    viewportFraction: 1,
                                    autoPlay: true,
                                    autoPlayAnimationDuration:
                                    const Duration(seconds: 2),
                                    onPageChanged: (index, reason) {
                                      setState(() {
                                        _currentIndex = index;
                                      });
                                    }))
                                :CarouselShimmerEffectForLoading(),


                            //Today Deals ListView
                            const CustomHorizaontalDivider(title: 'Today Deals'),
                            !_listViewLoaded
                                ? Container(
                                height: screenHeight * 0.20,
                                child: ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    itemCount: 5,
                                    itemBuilder: (BuildContext context,int index){
                                      return CustomListTile();
                                    })
                            )
                                : Container(
                                height: screenHeight * 0.20,
                                child: ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    itemCount: 5,
                                    itemBuilder: (BuildContext context,int index){
                                      return ListViewShimmerEffectForLoading();
                                    })
                            ),

                            // Advertisement Banner
                            Center(
                              child: Padding(
                                  padding: EdgeInsets.all(8),
                                  child: Container(
                                    decoration: BoxDecoration(
                                        border: Border.all(color: Colors.amber,width: 2.5),
                                        borderRadius: BorderRadius.circular(20)
                                    ),
                                    child: ClipRRect(
                                        borderRadius: BorderRadius.circular(20),
                                        child: Container(
                                          decoration: BoxDecoration(
                                            border: Border.all(color: Colors.amber),
                                          ),
                                          child: Image.
                                          network('https://nuttynuts.com.au/wp-content/uploads/2021/10/Rug-banner-2.png',
                                            errorBuilder: (BuildContext context, Object error, StackTrace? stackTrace) {
                                              return const Row(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                children: [
                                                  Icon(
                                                    Icons.error,
                                                    color: Colors.red,
                                                    size: 50.0,
                                                  ),
                                                ],
                                              );
                                            },),
                                        )),
                                  )),
                            ),

                            //New Products ListView
                            const CustomHorizaontalDivider(title: 'New Products'),
                            !_listViewLoaded
                                ? Container(
                                height: screenHeight * 0.20,
                                child: ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    itemCount: 5,
                                    itemBuilder: (BuildContext context,int index){
                                      return CustomListTile();
                                    })
                            )
                                : Container(
                                height: screenHeight * 0.20,
                                child: ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    itemCount: 5,
                                    itemBuilder: (BuildContext context,int index){
                                      return ListViewShimmerEffectForLoading();
                                    })
                            ),

                            //Mostly Liked Products GridView
                            const CustomHorizaontalDivider(title: 'Mostly liked'),
                            _listViewLoaded
                                ?Container(
                              width: screenWidth*0.80,
                              height: screenHeight*0.40,
                              padding: const EdgeInsets.only(
                                  top: 6, bottom: 10, left: 10, right: 10),
                              child: GridView.builder(
                                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  crossAxisSpacing: 8.0,
                                  mainAxisSpacing: 10.0,
                                  // childAspectRatio: 0.7,
                                ),
                                itemCount: 5,
                                itemBuilder: (context, index) {
                                  return ListViewShimmerEffectForLoading();
                                },
                              ),
                            )
                                :Container(
                              width: screenWidth*0.80,
                              height: screenHeight*0.38,
                              padding: const EdgeInsets.only(
                                  top: 6, bottom: 10, left: 10, right: 10),
                              child: GridView.builder(
                                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  crossAxisSpacing: 8.0,
                                  mainAxisSpacing: 10.0,
                                  // childAspectRatio: 0.7,
                                ),
                                itemCount: 5,
                                itemBuilder: (context, index) {
                                  return CustomGridTile();
                                },
                              ),
                            ),

                            // Advertisement Banner
                            Center(
                              child: Padding(
                                  padding: EdgeInsets.all(8),
                                  child: Container(
                                    decoration: BoxDecoration(
                                        border: Border.all(color: Colors.amber,width: 2.5),
                                        borderRadius: BorderRadius.circular(20)
                                    ),
                                    child: ClipRRect(
                                        borderRadius: BorderRadius.circular(20),
                                        child: Container(
                                          decoration: BoxDecoration(
                                            border: Border.all(color: Colors.amber),
                                          ),
                                          child: Image.
                                          network('https://as2.ftcdn.net/v2/jpg/03/34/80/85/1000_F_334808581_4cH1mAsSMZJROxUB6jfpXiRBdZnXMKpG.jpg',
                                            errorBuilder: (BuildContext context, Object error, StackTrace? stackTrace) {
                                              return const Row(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                children: [
                                                  Icon(
                                                    Icons.error,
                                                    color: Colors.red,
                                                    size: 50.0,
                                                  ),
                                                ],
                                              );
                                            },),
                                        )),
                                  )),
                            ),

                            //Wishlist ListView
                            const CustomHorizaontalDivider(title: 'Wishlist'),
                            !_listViewLoaded
                                ? Container(
                                height: screenHeight * 0.20,
                                child: ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    itemCount: 5,
                                    itemBuilder: (BuildContext context,int index){
                                      return CustomListTile();
                                    })
                            )
                                : Container(
                                height: screenHeight * 0.20,
                                child: ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    itemCount: 5,
                                    itemBuilder: (BuildContext context,int index){
                                      return ListViewShimmerEffectForLoading();
                                    })
                            ),
                          ],
                        ),
                      )
                    ]),
              ),
            ),
          ),
        ),
      ],
    );

        //Bottom Navigation Bar
      // bottomNavigationBar: CustomBottomNavBar(),

  }
}
