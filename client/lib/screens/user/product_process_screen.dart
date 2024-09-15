import 'dart:ffi';
import 'dart:ui';

import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:client/constants/app_colors.dart';
import 'package:client/screens/widgets/custom_horizaontal_divider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../constants/ui_routes.dart';
import '../widgets/custom_grid_tile.dart';

class ProductProcessScreen extends StatefulWidget {
  static String routeName = UiScreenRoutes.productProcessScreen;
  const ProductProcessScreen({super.key});

  @override
  State<ProductProcessScreen> createState() => _ProductProcessScreenState();
}

class _ProductProcessScreenState extends State<ProductProcessScreen> {


  int _currentIndex=0;

  final List imglist = [
    'https://m.media-amazon.com/images/I/71oR9w5AjbL.jpg',
    'https://images.immediate.co.uk/production/volatile/sites/30/2024/03/Nuts-2def52f.jpg?quality=90&resize=440,400',
    'https://media.istockphoto.com/id/610957954/photo/mixed-nuts-shelled.jpg?s=612x612&w=0&k=20&c=Bg43e5FkTJnOPQwwvy5Qb38H-kShEMGBR3TxzLi3vT8=',
    'https://media.istockphoto.com/id/610957954/photo/mixed-nuts-shelled.jpg?s=612x612&w=0&k=20&c=Bg43e5FkTJnOPQwwvy5Qb38H-kShEMGBR3TxzLi3vT8=',
  ];

  @override
  Widget build(BuildContext context) {

    final screenHeight= MediaQuery.of(context).size.height;
    final screenWidth= MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading:Padding(
          padding: const EdgeInsets.only(left: 10),
          child: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios_rounded,
            ),
          ),
        ),
        title: Text('Product'),
      ),
      body: SingleChildScrollView(
        child: Padding(
            padding: EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children:[
        
                CarouselSlider(
                    items: imglist
                        .map((item) => Container(
                      padding:
                      EdgeInsets.only(top: 10, bottom: 10),
                      margin: EdgeInsets.symmetric(horizontal: 8),
                      child: Container(
                        width:screenWidth*0.90,
                        height: screenHeight*0.45,
                        child: ClipRRect(
                            borderRadius:
                            BorderRadius.circular(25),
                            child: Image.network(item)),
                      ),
                    ))
                        .toList(),
                    options: CarouselOptions(
                        initialPage: 0,
                        aspectRatio: 3/2.5,
                        viewportFraction: 1,
                        autoPlay: false,
                    )),
                Text('Dates, Nuts, .................................',
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 22
                  ),),
                Text('₹500',
                  style:TextStyle(
                    fontSize: 18,
                    color: Colors.green
                  ),),
                SizedBox(height: 15,),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      height: 30,
                      child: OutlinedButton(
                            onPressed: (){},
                            child: Text('350 Gm')),
                    ),
                    SizedBox(width: 8,),
                    Container(
                      height: 30,
                      child: OutlinedButton(
                          onPressed: (){},
                          child: Text('500 Gm')),
                    ),
                    SizedBox(width: 8,),
                    Container(
                      height: 30,
                      child: OutlinedButton(
                          onPressed: (){},
                          child: Text('750 Gm')),
                    ),
        
                  ],
                ),
                  SizedBox(height: 20,),
                          CustomHorizaontalDivider(title: 'Description'),
                          Padding(
                            padding: EdgeInsets.all(10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Nuts are highly nutritious. One ounce (28 grams) of mixed nuts contains ',style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold
                                ),),
                                Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 15),
                                    child: Text('Calories: 173 \nProtein: 5 grams \nFat: 16 grams, including 9 grams of monounsaturated fat\nCarbs: 6 grams \nFiber: 3 grams \nVitamin E: 12% of the RDI \nMagnesium: 16% of the RDI \nPhosphorus: 13% of the RDI \nCopper: 23% of the RDI\nManganese: 26% of the RDI'))
                              ],
                            ),
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Spacer(),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  shape: BeveledRectangleBorder(
                                    borderRadius: BorderRadius.circular(3)
                                  ),
                                  backgroundColor: AppColors.primary,
                                  foregroundColor: Colors.black
                                ),
                                  onPressed: (){},
                                  child: Text('Buy Now')
                              ),
                              Spacer(),
                              ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      shape: BeveledRectangleBorder(
                                          borderRadius: BorderRadius.circular(3)
                                      ),
                                      backgroundColor: AppColors.primary,
                                      foregroundColor: Colors.black
                                  ),
                                  onPressed: (){},
                                  child: Text('Add to Cart'),
                              ),
                              Spacer(),
                            ],
                          ),
                SizedBox(height: 15,),
                CustomHorizaontalDivider(title: 'Similar Products'),
                Center(
                  child: Container(
                    width: screenWidth*0.95,
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
                      itemCount: 8,
                      itemBuilder: (context, index) {
                        return CustomGridTile();
                      },
                    ),
                  ),
                ),
                        ],
                      ),
        ),
      )
    );
  }
}
