import 'package:flutter/material.dart';

import '../../constants/app_colors.dart';
import '../user/product_process_screen.dart';

class CustomGridTile extends StatefulWidget {
  const CustomGridTile({Key? key}) : super(key: key);

  @override
  State<CustomGridTile> createState() => _CustomGridTileState();
}

class _CustomGridTileState extends State<CustomGridTile> {
  bool _wishlistButtonPressed = false;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return GestureDetector(
      onTap: () {
        print('Tile Clicked');
        Navigator.pushNamed(context, ProductProcessScreen.routeName);
      },
      child: SizedBox(
        width: screenWidth * 0.33,
        child: Card(
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
                        aspectRatio: 3 / 2,
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
                      style: TextStyle(fontSize: screenWidth * 0.0335),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 8),
                    child: Text(
                      overflow: TextOverflow.ellipsis,
                      '₹500',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          color: Colors.green, fontSize: screenWidth * 0.0335),
                    ),
                  ),
                ],
              ),
              Positioned(
                top: -5,
                right: -5,
                child: IconButton(
                  color: _wishlistButtonPressed
                      ? AppColors.favoriteColor
                      : Colors.black45,
                  onPressed: () {
                    setState(() {
                      _wishlistButtonPressed = !_wishlistButtonPressed;
                    });
                  },
                  icon: Icon(
                    _wishlistButtonPressed
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
