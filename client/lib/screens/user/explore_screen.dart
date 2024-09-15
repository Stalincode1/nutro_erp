import 'package:client/constants/ui_routes.dart';
import 'package:flutter/material.dart';

import '../widgets/custom_grid_tile.dart';
import '../widgets/custom_search_bar.dart';

class ExploreScreen extends StatefulWidget {
  static String routeName = UiScreenRoutes.exploreScreen;
  const ExploreScreen({super.key});

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {



  @override
  Widget build(BuildContext context) {

    final screenWidth=MediaQuery.of(context).size.width;
    final screenHeight=MediaQuery.of(context).size.height;
    return Column(
      children: [
        Center(
          child: CustomSearchBar(),
        ),
        Expanded(
          child: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage('assets/images/back_ground.png',),
                    opacity: 0.5
                )
            ),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Column(
                    children: [
                      Container(
                        // width: screenWidth*0.80,
                        height: screenHeight,
                        padding: const EdgeInsets.only(
                            top: 6, bottom: 10, left: 10, right: 10),
                        child: GridView.builder(
                          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 8.0,
                            mainAxisSpacing: 10.0,
                            // childAspectRatio: 0.7,
                          ),
                          itemCount: 25,
                          itemBuilder: (context, index) {
                            return CustomGridTile();
                          },
                        ),
                      ),
                    ],
                  ),

                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
