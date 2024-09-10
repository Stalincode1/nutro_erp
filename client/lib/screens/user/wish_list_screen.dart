import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:client/constants/ui_routes.dart';
import 'package:client/screens/widgets/wish_list_product_view.dart';
import 'package:shimmer/shimmer.dart';

class WishList extends StatefulWidget {
  static String routeName = UiScreenRoutes.wishlistScreen;
  const WishList({super.key});

  @override
  State<WishList> createState() => _WishListState();
}

class _WishListState extends State<WishList> {
  final ScrollController _scrollController = ScrollController();
  bool _isAtTop = true;
  List dataList = [];

  @override
  void initState() {
    super.initState();
    initializeFavoriteList();

    _scrollController.addListener(() {
      if (_scrollController.position.pixels == 0) {
        if (!_isAtTop) {
          setState(() {
            _isAtTop = true;
          });
        }
      } else {
        if (_isAtTop) {
          setState(() {
            _isAtTop = false;
          });
        }
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  Future<void> initializeFavoriteList() async {
    await Future.delayed(const Duration(seconds: 2));

    setState(() {
      dataList.length = 15;
    });
  }

  Widget shimmerEffectForLoading() {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: Colors.grey[300],
        ),
        width: 100,
        height: 100,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: _isAtTop
              ? const Color.fromARGB(255, 255, 245, 216)
              : Colors.transparent,
        ),
        leading: Padding(
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
        automaticallyImplyLeading: false,
        centerTitle: false,
        title: const Text("Wishlist"),
      ),
      body: dataList.isEmpty
          ? Padding(
              padding: const EdgeInsets.only(
                  top: 6, bottom: 10, left: 10, right: 10),
              child: GridView.builder(
                controller: _scrollController,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10.0,
                  mainAxisSpacing: 8.0,
                  childAspectRatio: 0.7,
                ),
                itemCount: 10,
                itemBuilder: (context, index) {
                  return shimmerEffectForLoading();
                },
              ),
            )
          : Padding(
              padding: const EdgeInsets.only(
                  top: 6, bottom: 10, left: 10, right: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Text(
                      "Liked Products",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  const Padding(padding: EdgeInsets.only(top: 5)),
                  Expanded(
                    child: GridView.builder(
                      controller: _scrollController,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 6.0,
                        mainAxisSpacing: 7.0,
                        childAspectRatio: 0.6,
                      ),
                      itemCount: dataList.length,
                      itemBuilder: (context, index) {
                        return WishListProductView(
                          dataList: dataList,
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
