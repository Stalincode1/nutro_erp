import 'package:flutter/material.dart';

class CustomInverseExploreListView extends StatelessWidget {
  final List<String> images;

  CustomInverseExploreListView({super.key, required this.images});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    int imageCount = images.length;

    return SliverToBoxAdapter(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Spacer(),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // First Rectangle
                  if (imageCount > 0)
                    _buildImageContainer(
                        images[imageCount - 1],
                        Colors.grey.shade100,
                        screenSize,
                        'Nuts, Dates, Pistachio, Cashew',
                        '₹500'),
                  SizedBox(height: 18),
                  // Second Rectangle
                  if (imageCount > 1)
                    _buildImageContainer(
                        images[imageCount - 2],
                        Colors.grey.shade100,
                        screenSize,
                        'Nuts, Dates, Pistachio, Cashew',
                        '₹500'),
                ],
              ),
              Spacer(),
              // Square Tile
              if (imageCount > 2)
                _buildSquareTile(images[imageCount - 3], screenSize,
                    'Nuts, Dates, Pistachio, Cashew', '₹500'),
              Spacer(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildImageContainer(String imageUrl, Color color, Size screenSize,
      String productName, String amount) {
    return Container(
      width: screenSize.width * 0.4,
      height: screenSize.height * 0.12,
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.3),
              offset: Offset(1, 2),
              blurRadius: 5,
              spreadRadius: 2,
            ),
          ],
          color: color,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.amber, width: 1)),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Stack(
          fit: StackFit.expand,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: imageUrl.isNotEmpty
                  ? Image.network(
                      imageUrl,
                      fit: BoxFit.cover,
                    )
                  : Container(
                      color: Colors.grey, // Disabled state
                    ),
            ),
            Positioned(
              left: 0,
              bottom: 1,
              right: 0,
              child: Container(
                height: screenSize.height * 0.19,
                width: screenSize.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter, // Starting from right
                    end: Alignment.center, // Ending at left
                    colors: [
                      Colors.white, // White color
                      Colors.transparent, // Transparent
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
                bottom: 1,
                left: 1,
                right: 1,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        productName,
                        style: TextStyle(
                          fontSize: screenSize.width * 0.0335,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        amount,
                        style: TextStyle(
                            color: Colors.green,
                            fontSize: screenSize.width * 0.0335),
                      )
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }

  Widget _buildSquareTile(
      String imageUrl, Size screenSize, String productName, String amount) {
    return Container(
      width: screenSize.width * 0.45,
      height: screenSize.height * 0.265,
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.3),
              offset: Offset(1, 2),
              blurRadius: 5,
              spreadRadius: 2,
            ),
          ],
          color: Colors.grey.shade100,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.amber, width: 1)),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Stack(
          fit: StackFit.expand,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              left: 0,
              bottom: 1,
              right: 0,
              child: Container(
                height: screenSize.height * 0.19,
                width: screenSize.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter, // Starting from right
                    end: Alignment.center, // Ending at left
                    colors: [
                      Colors.white, // White color
                      Colors.transparent, // Transparent
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
                bottom: 1,
                left: 1,
                right: 1,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        productName,
                        style: TextStyle(
                          fontSize: screenSize.width * 0.0335,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        amount,
                        style: TextStyle(
                            color: Colors.green,
                            fontSize: screenSize.width * 0.0335),
                      )
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
