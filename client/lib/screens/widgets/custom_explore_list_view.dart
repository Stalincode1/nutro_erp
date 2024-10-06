import 'package:flutter/material.dart';

class CustomExploreListView extends StatelessWidget {
  final List<String> images;

  CustomExploreListView({super.key, required this.images});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: Center(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Spacer(),
              // Square Tile
              if (images.isNotEmpty)
                Container(
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
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.amber, width: 1),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Stack(
                      fit: StackFit.expand,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.network(
                            images[0],
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) {
                              return Container(
                                color: Colors.grey.shade100,
                              );
                            },
                          ),
                        ),
                        Positioned(
                            bottom: 0,
                            child: Container(
                              height: screenSize.height * 0.4,
                              width: screenSize.width,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                gradient: LinearGradient(
                                  begin: Alignment
                                      .bottomCenter, // Starting from right
                                  end: Alignment.center, // Ending at left
                                  colors: [
                                    Colors.white, // White color
                                    Colors.transparent, // Transparent
                                  ],
                                ),
                              ),
                            )),
                        Positioned(
                            bottom: 1,
                            left: 1,
                            right: 1,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 5),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    'Nuts, Dates, Pistachio, Cashew',
                                    style: TextStyle(
                                      fontSize: screenSize.width * 0.0335,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  Text(
                                    '₹500',
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
                ),
              Spacer(),
              // Column for Rectangles
              if (images.length > 1) ...[
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // First Rectangle
                    Container(
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
                                images[1],
                                fit: BoxFit.cover,
                                errorBuilder: (context, error, stackTrace) {
                                  return Container(
                                    color: Colors.grey.shade100,
                                  );
                                },
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
                                    begin: Alignment
                                        .bottomCenter, // Starting from right
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
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(
                                        'Nuts, Dates, Pistachio, Cashew',
                                        style: TextStyle(
                                          fontSize: screenSize.width * 0.0335,
                                        ),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      Text(
                                        '₹500',
                                        style: TextStyle(
                                            color: Colors.green,
                                            fontSize:
                                                screenSize.width * 0.0335),
                                      )
                                    ],
                                  ),
                                ))
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 18),
                    // Second Rectangle
                    if (images.length > 2)
                      Container(
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
                          border: Border.all(color: Colors.amber, width: 1),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Stack(
                            fit: StackFit.expand,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.network(
                                  images[2],
                                  fit: BoxFit.cover,
                                  errorBuilder: (context, error, stackTrace) {
                                    return Container(
                                      color: Colors.grey.shade100,
                                    );
                                  },
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
                                      begin: Alignment
                                          .bottomCenter, // Starting from right
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
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Text(
                                          'Nuts, Dates, Pistachio, Cashew',
                                          style: TextStyle(
                                            fontSize: screenSize.width * 0.0335,
                                          ),
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                        Text(
                                          '₹500',
                                          style: TextStyle(
                                              color: Colors.green,
                                              fontSize:
                                                  screenSize.width * 0.0335),
                                        )
                                      ],
                                    ),
                                  ))
                            ],
                          ),
                        ),
                      ),
                  ],
                ),
              ],
              Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}

// import 'package:flutter/material.dart';

// class CustomExploreListView extends StatelessWidget {
//   final List<String> images;

//   CustomExploreListView({super.key, required this.images});

//   @override
//   Widget build(BuildContext context) {
//     final screenSize = MediaQuery.of(context).size;
//     int imageCount = images.length;

//     return SliverToBoxAdapter(
//       child: Center(
//         child: Padding(
//           padding: const EdgeInsets.only(top: 20.0),
//           child: Row(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Spacer(),
//               // Square Tile
//               if (imageCount > 0)
//                 _buildSquareTile(images[imageCount - 1], screenSize),
//               Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Spacer(),
//                   // First Rectangle
//                   if (imageCount > 1)
//                     _buildImageContainer(images[imageCount - 2],
//                         Colors.grey.shade100, screenSize),
//                   SizedBox(height: 18),
//                   // Second Rectangle
//                   if (imageCount > 2)
//                     _buildImageContainer(images[imageCount - 3],
//                         Colors.grey.shade100, screenSize),
//                 ],
//               ),
//               Spacer(),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildImageContainer(String imageUrl, Color color, Size screenSize) {
//     return Container(
//       width: screenSize.width * 0.4,
//       height: screenSize.height * 0.12,
//       decoration: BoxDecoration(
//         color: color,
//         borderRadius: BorderRadius.circular(10),
//       ),
//       child: ClipRRect(
//         borderRadius: BorderRadius.circular(10),
//         child: imageUrl.isNotEmpty
//             ? Image.network(
//                 imageUrl,
//                 fit: BoxFit.cover,
//               )
//             : Container(
//                 color: Colors.grey, // Disabled state
//               ),
//       ),
//     );
//   }

//   Widget _buildSquareTile(String imageUrl, Size screenSize) {
//     return Container(
//       width: screenSize.width * 0.45,
//       height: screenSize.height * 0.265,
//       decoration: BoxDecoration(
//         color: Colors.grey.shade100,
//         borderRadius: BorderRadius.circular(10),
//       ),
//       child: ClipRRect(
//         borderRadius: BorderRadius.circular(10),
//         child: Image.network(
//           imageUrl,
//           fit: BoxFit.cover,
//         ),
//       ),
//     );
//   }
// }
