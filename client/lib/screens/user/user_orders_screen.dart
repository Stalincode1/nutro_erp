import 'package:client/constants/app_colors.dart';
import 'package:client/constants/ui_routes.dart';
import 'package:client/screens/user/user_order_preview_screen.dart';
import 'package:client/screens/widgets/image_error_handle.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class UserOrderScreen extends StatefulWidget {
  static String routeName = UiScreenRoutes.userOrderScreen;
  const UserOrderScreen({super.key});

  @override
  State<UserOrderScreen> createState() => _UserOrderScreenState();
}

class _UserOrderScreenState extends State<UserOrderScreen> {
  List orderList = [];

  List<String> filterSelectedList = [];

  @override
  void initState() {
    super.initState();
    orderList.length = 20;
  }

  Widget filterSelectButton(Size size, String filterName) {
    return Center(
      child: InkWell(
        onTap: () {
          setState(() {
            if (!filterSelectedList.contains(filterName)) {
              filterSelectedList.add(filterName);
            } else {
              filterSelectedList.remove(filterName);
            }
            print(
                "the filter list is the :::::::::   ${filterSelectedList.toString()}");
          });
        },
        child: Container(
          width: size.width * 0.20,
          height: size.height * 0.03,
          decoration: BoxDecoration(
            color: filterSelectedList.contains(filterName)
                ? const Color.fromARGB(255, 19, 67, 150)
                : null,
            borderRadius: BorderRadius.circular(6),
            border: Border.all(
              color: const Color.fromARGB(230, 194, 191, 191),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                filterName,
                style: TextStyle(
                    color: filterSelectedList.contains(filterName)
                        ? Colors.white
                        : Colors.black,
                    fontSize: 12),
              ),
              const SizedBox(width: 4.0),
              if (!filterSelectedList.contains(filterName))
                const Text(
                  "+",
                  style: TextStyle(color: Colors.grey, fontSize: 12),
                )
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Color.fromARGB(230, 241, 238, 238),
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
        title: const Text("Orders"),
        backgroundColor: Colors.white,
      ),
      backgroundColor: Colors.white,
      drawer: Align(
        alignment: Alignment.centerLeft,
        child: SizedBox(
          height: size.height * 0.45,
          width: size.width * 0.5,
          child: Drawer(
            child: Container(
              color: Colors.grey[200],
              child: Padding(
                padding: const EdgeInsets.only(
                    top: 16, left: 5, right: 5, bottom: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(right: 10),
                      child: Center(
                        child: Text(
                          'Filters',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    const SizedBox(height: 15),
                    const Padding(
                      padding: EdgeInsets.only(left: 6),
                      child: Text(
                        "Order Status",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    const SizedBox(
                      height: 13,
                    ),
                    filterSelectButton(size, "All"),
                    const SizedBox(
                      height: 10,
                    ),
                    filterSelectButton(size, "Today"),
                    const SizedBox(
                      height: 10,
                    ),
                    filterSelectButton(size, "Delivered"),
                    const SizedBox(
                      height: 10,
                    ),
                    filterSelectButton(size, "Return"),
                    const SizedBox(
                      height: 10,
                    ),
                    filterSelectButton(size, "Canceled"),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: size.height * 0.04,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey, width: 2)),
                          child: MaterialButton(
                            onPressed: () {
                              setState(() {
                                filterSelectedList.clear();
                              });
                            },
                            child: const Text(
                              "Clear",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 12,
                              ),
                            ),
                          ),
                        ),
                        Builder(builder: (context) {
                          return Container(
                            height: size.height * 0.04,
                            decoration: BoxDecoration(
                              border: Border.all(
                                  color: AppColors.primary, width: 2),
                              color: const Color.fromARGB(255, 255, 224, 137),
                            ),
                            child: MaterialButton(
                              onPressed: () {
                                Scaffold.of(context).closeDrawer();
                              },
                              child: const Text("Filter",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold)),
                            ),
                          );
                        })
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  padding: const EdgeInsets.only(left: 15, right: 8),
                  width: size.width * 0.8,
                  height: size.height * 0.05,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      border: Border.all(color: Colors.black38),
                      color: Colors.grey.shade200),
                  child: TextFormField(
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      suffixIcon: Icon(Icons.search),
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                      hintText: 'Search',
                    ),
                  ),
                ),
                const SizedBox(),
                Builder(
                  builder: (context) {
                    return InkWell(
                      onTap: () {
                        Scaffold.of(context).openDrawer();
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: const Color.fromARGB(230, 194, 191, 191)),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        width: size.width * 0.15,
                        height: size.height * 0.05,
                        child: const Center(
                          child: Text(
                            "Filter",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 13,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: orderList.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(
                            context, OrderPreviewScreen.routeName);
                      },
                      child: Container(
                        //height: size.height * 0.17,
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: const Color.fromARGB(230, 235, 231, 231)),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Row(
                          children: [
                            Container(
                              width: size.width * 0.3,
                              height: size.height * 0.15,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Image.network(
                                'https://media.istockphoto.com/id/610957954/photo/mixed-nuts-shelled.jpg?s=612x612&w=0&k=20&c=Bg43e5FkTJnOPQwwvy5Qb38H-kShEMGBR3TxzLi3vT8=',
                                fit: BoxFit.fill,
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
                            const SizedBox(width: 8),
                            Expanded(
                              flex: 6,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Delivered on Jul 13, 2024",
                                    style: TextStyle(
                                      fontSize: size.width * 0.03,
                                      color: Colors.black,
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    "Mixed Fruits and nuts",
                                    style: TextStyle(
                                      fontSize: size.width * 0.03,
                                      color: Color.fromARGB(255, 177, 177, 177),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Row(
                                    children: [
                                      Container(
                                        width: 10,
                                        height: 10,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          boxShadow: [
                                            BoxShadow(
                                              color:
                                                  Colors.green.withOpacity(0.6),
                                              spreadRadius: 0.7,
                                              blurRadius: 3,
                                              offset: const Offset(0, 1),
                                            ),
                                          ],
                                        ),
                                        child: const Center(
                                          child: Icon(
                                            Icons.circle_rounded,
                                            color: Colors.green,
                                            size: 7,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 2,
                                      ),
                                      Text(
                                        "Delivered",
                                        style: TextStyle(
                                          fontSize: size.width * 0.02,
                                        ),
                                      )
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Text(
                                        "Order Date : ",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: size.width * 0.02,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      Text(
                                        "Jul 10, 2024 ",
                                        style: TextStyle(
                                            color: Colors.grey,
                                            fontSize: size.width * 0.02,
                                            fontWeight: FontWeight.w600),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                            SizedBox(
                              width: size.width * 0.1,
                              child: Center(
                                child: Icon(
                                  Icons.arrow_forward_ios_sharp,
                                  size: size.width * 0.04,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
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
