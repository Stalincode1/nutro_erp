import 'package:client/constants/app_colors.dart';
import 'package:client/screens/user/product_process_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CustomListTile extends StatefulWidget {
  const CustomListTile({super.key});

  @override
  State<CustomListTile> createState() => _CustomListTileState();
}

class _CustomListTileState extends State<CustomListTile> {
  bool _wishlist_button_pressed = false;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return GestureDetector(
      onTap: () {
        print('Tile Clicked');
        Navigator.pushNamed(context, ProductProcessScreen.routeName);
      },
      child: SizedBox(
        width: screenWidth * 0.33,
        child: Card(
          color: Colors.white,
          elevation: 5,
          shape: BeveledRectangleBorder(
            side: BorderSide(
              color: Colors.amber, // Border color
              width: 1, // Border width
            ),
            borderRadius: BorderRadius.circular(6),
          ),
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(7),
                    child: Container(
                      padding: const EdgeInsets.all(5),
                      child: AspectRatio(
                        aspectRatio: 3 / 2.75,
                        child: Image.network(
                          'https://images.immediate.co.uk/production/volatile/sites/30/2024/03/Nuts-2def52f.jpg?quality=90&resize=440,400',
                          errorBuilder: (BuildContext context, Object error,
                              StackTrace? stackTrace) {
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
                          },
                          width: double.infinity,
                          height: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 5, right: 3),
                    child: Text(
                      'Nuts, Dates, Pistachio, Cashew',
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontSize: screenWidth * 0.032),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 8),
                    child: Text(
                      overflow: TextOverflow.ellipsis,
                      '₹500',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          fontSize: screenWidth * 0.032, color: Colors.green),
                    ),
                  ),
                ],
              ),
              Positioned(
                top: -5,
                right: -5,
                child: IconButton(
                  color: _wishlist_button_pressed
                      ? AppColors.favoriteColor
                      : Colors.black45,
                  onPressed: () {
                    setState(() {
                      _wishlist_button_pressed = !_wishlist_button_pressed;
                    });
                  },
                  icon: Icon(
                    _wishlist_button_pressed
                        ? Icons.favorite
                        : Icons.favorite_border,
                    size: 20,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
