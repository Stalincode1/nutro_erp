import 'package:client/constants/ui_routes.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import '../widgets/custom_grid_tile.dart';
import '../widgets/custom_explore_list_view.dart';
import '../widgets/custom_inverse_explore_list_view.dart';
import '../widgets/custom_search_bar.dart';

class ExploreScreen extends StatefulWidget {
  static String routeName = UiScreenRoutes.exploreScreen;
  const ExploreScreen({super.key});

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  int _currentIndex = 0;

  // List<List<T>> splitList<T>(List<T> list, int chunkSize) {
  //   List<List<T>> chunks = [];
  //   for (int i = 0; i < list.length; i += chunkSize) {
  //     int end = (i + chunkSize < list.length) ? i + chunkSize : list.length;
  //     chunks.add(list.sublist(i, end));
  //   }
  //   return chunks;
  // }

  List<List<T>> splitList<T>(List<T> list, int chunkSize) {
    List<List<T>> chunks = [];
    for (int i = 0; i + chunkSize <= list.length; i += chunkSize) {
      chunks.add(list.sublist(i, i + chunkSize));
    }
    return chunks;
  }

  final List<String> images = [
    'https://www.eatingwell.com/thmb/WHQTHrHyDSDmA6_IqewIcFvgO8g=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/what-happens-to-your-body-when-you-eat-nuts-every-day-090a0325cc0641159c2728496a489a4f.jpg',
    'https://t4.ftcdn.net/jpg/00/46/34/51/360_F_46345101_Q1y4CNprygAy1qnMcWGCvGWukwk4OCJe.jpg',
    'https://www.eatingwell.com/thmb/WHQTHrHyDSDmA6_IqewIcFvgO8g=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/what-happens-to-your-body-when-you-eat-nuts-every-day-090a0325cc0641159c2728496a489a4f.jpg',
    'https://www.eatingwell.com/thmb/WHQTHrHyDSDmA6_IqewIcFvgO8g=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/what-happens-to-your-body-when-you-eat-nuts-every-day-090a0325cc0641159c2728496a489a4f.jpg',
    'https://www.eatingwell.com/thmb/WHQTHrHyDSDmA6_IqewIcFvgO8g=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/what-happens-to-your-body-when-you-eat-nuts-every-day-090a0325cc0641159c2728496a489a4f.jpg',
    'https://www.eatingwell.com/thmb/WHQTHrHyDSDmA6_IqewIcFvgO8g=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/what-happens-to-your-body-when-you-eat-nuts-every-day-090a0325cc0641159c2728496a489a4f.jpg',
    'https://t4.ftcdn.net/jpg/00/46/34/51/360_F_46345101_Q1y4CNprygAy1qnMcWGCvGWukwk4OCJe.jpg',
    'https://www.eatingwell.com/thmb/WHQTHrHyDSDmA6_IqewIcFvgO8g=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/what-happens-to-your-body-when-you-eat-nuts-every-day-090a0325cc0641159c2728496a489a4f.jpg',
    'https://www.eatingwell.com/thmb/WHQTHrHyDSDmA6_IqewIcFvgO8g=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/what-happens-to-your-body-when-you-eat-nuts-every-day-090a0325cc0641159c2728496a489a4f.jpg',
    'https://www.eatingwell.com/thmb/WHQTHrHyDSDmA6_IqewIcFvgO8g=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/what-happens-to-your-body-when-you-eat-nuts-every-day-090a0325cc0641159c2728496a489a4f.jpg',
    'https://www.eatingwell.com/thmb/WHQTHrHyDSDmA6_IqewIcFvgO8g=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/what-happens-to-your-body-when-you-eat-nuts-every-day-090a0325cc0641159c2728496a489a4f.jpg',
    'https://www.eatingwell.com/thmb/WHQTHrHyDSDmA6_IqewIcFvgO8g=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/what-happens-to-your-body-when-you-eat-nuts-every-day-090a0325cc0641159c2728496a489a4f.jpg',
    'https://www.eatingwell.com/thmb/WHQTHrHyDSDmA6_IqewIcFvgO8g=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/what-happens-to-your-body-when-you-eat-nuts-every-day-090a0325cc0641159c2728496a489a4f.jpg',
    'https://www.eatingwell.com/thmb/WHQTHrHyDSDmA6_IqewIcFvgO8g=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/what-happens-to-your-body-when-you-eat-nuts-every-day-090a0325cc0641159c2728496a489a4f.jpg',
    'https://www.eatingwell.com/thmb/WHQTHrHyDSDmA6_IqewIcFvgO8g=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/what-happens-to-your-body-when-you-eat-nuts-every-day-090a0325cc0641159c2728496a489a4f.jpg',
    'https://www.eatingwell.com/thmb/WHQTHrHyDSDmA6_IqewIcFvgO8g=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/what-happens-to-your-body-when-you-eat-nuts-every-day-090a0325cc0641159c2728496a489a4f.jpg',
    'https://t4.ftcdn.net/jpg/00/46/34/51/360_F_46345101_Q1y4CNprygAy1qnMcWGCvGWukwk4OCJe.jpg',
    'https://www.eatingwell.com/thmb/WHQTHrHyDSDmA6_IqewIcFvgO8g=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/what-happens-to-your-body-when-you-eat-nuts-every-day-090a0325cc0641159c2728496a489a4f.jpg',
    'https://www.eatingwell.com/thmb/WHQTHrHyDSDmA6_IqewIcFvgO8g=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/what-happens-to-your-body-when-you-eat-nuts-every-day-090a0325cc0641159c2728496a489a4f.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    List<List<String>> chunks = splitList(images, 3);
    List<String> chunk = [''];

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Center(
          child: CustomSearchBar(),
        ),
        SizedBox(
          height: 10,
        ),
        Expanded(
          child: Container(
            padding: EdgeInsets.only(top: 1),
            decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(color: Colors.grey),
                  left: BorderSide(color: Colors.grey),
                  right: BorderSide(color: Colors.grey),
                ),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30)),
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(
                      'assets/images/back_ground.png',
                    ),
                    opacity: 0.5)),
            child: SingleChildScrollView(
                child: Container(
              height: screenHeight * 0.76,
              child: CustomScrollView(
                slivers: [
                  for (int i = 0; i < chunks.length; i++) ...[
                    i % 2 == 0
                        ? CustomExploreListView(images: chunks[i])
                        : CustomInverseExploreListView(images: chunks[i]),
                  ]
                ],
              ),
            )),
          ),
        ),
      ],
    );
  }
}
