import 'package:flutter/material.dart';
import 'package:client/constants/app_colors.dart';
import 'package:client/screens/widgets/image_error_handle.dart';

class WishListProductView extends StatefulWidget {
  List? dataList;
  WishListProductView({super.key, required this.dataList});

  @override
  State<WishListProductView> createState() => _WishListProductViewState();
}

class _WishListProductViewState extends State<WishListProductView> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var textScaleFactor = size.width / 390;

    return GestureDetector(
      onTap: () {
        print("Clicked");
      },
      child: SizedBox(
        width: size.width * 0.5,
        child: Card(
          shape: BeveledRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(5),
                      topRight: Radius.circular(5),
                    ),
                    child: Image.network(
                      'https://images.pexels.com/photos/18876242/pexels-photo-18876242/free-photo-of-closeup-of-cashew-nuts-on-a-table.jpeg',
                      height: size.height * 0.28,
                      width: double.infinity,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return ImageErrorHandle(
                          height: size.height * 0.28,
                          width: double.infinity,
                          iconColor: AppColors.error,
                          iconData: Icons.error,
                          iconSize: 50.0,
                        );
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10, top: 4),
                    child: Text(
                      "Mixed nuts and dried fruit",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 15 * textScaleFactor,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10, top: 4),
                    child: Row(
                      children: [
                        Text(
                          "50%",
                          style: TextStyle(
                            color: const Color.fromARGB(255, 27, 128, 30),
                            fontSize: 18 * textScaleFactor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          "500",
                          style: TextStyle(
                            fontSize: 14 * textScaleFactor,
                            color: Colors.grey,
                            decoration: TextDecoration.lineThrough,
                            decorationColor: Colors.grey,
                            decorationThickness: 3,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Text(
                          "₹250",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 14 * textScaleFactor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Positioned(
                right: 8,
                top: 8,
                child: IconButton(
                  icon: const Icon(
                    Icons.favorite_rounded,
                    color: AppColors.favoriteColor,
                    size: 30,
                  ),
                  onPressed: () {},
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
