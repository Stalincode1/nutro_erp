import 'package:client/constants/app_colors.dart';
import 'package:client/constants/ui_routes.dart';
import 'package:client/screens/widgets/image_error_handle.dart';
import 'package:client/screens/widgets/user_order_traker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class OrderPreviewScreen extends StatefulWidget {
  static String routeName = UiScreenRoutes.userOrderPreviewScreen;
  const OrderPreviewScreen({super.key});

  @override
  State<OrderPreviewScreen> createState() => _OrderPreviewScreenState();
}

class _OrderPreviewScreenState extends State<OrderPreviewScreen> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        scrolledUnderElevation: 0,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarBrightness: Brightness.light,
          statusBarColor: Color.fromARGB(230, 194, 191, 191),
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
        title: const Text("Order Details"),
        backgroundColor: Colors.white,
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              orderDetail("Order ID ", "734737464128", Colors.black),
              const SizedBox(height: 5),
              orderDetail("Order Date ", "20/07/2024", Colors.black),
              const SizedBox(
                height: 5,
              ),
              Container(
                decoration: BoxDecoration(
                    border: Border.all(
                      color: const Color.fromARGB(230, 216, 213, 213),
                    ),
                    borderRadius: BorderRadius.circular(6)),
                height: size.height * 0.27,
                width: double.infinity,
                child: Image.network(
                    'https://media.istockphoto.com/id/610957954/photo/mixed-nuts-shelled.jpg?s=612x612&w=0&k=20&c=Bg43e5FkTJnOPQwwvy5Qb38H-kShEMGBR3TxzLi3vT8=',
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
              const SizedBox(
                height: 8,
              ),
              Text(
                "Almonds, walnuts, pecans, cashews, hazelnuts, peanuts",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: size.height * 0.02,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text(
                          "₹",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: size.width * 0.06,
                              fontWeight: FontWeight.w600),
                        ),
                        Text(
                          "250",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: size.width * 0.06,
                              fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                    const Row(
                      children: [
                        Text(
                          "Quantity: ",
                          style: TextStyle(
                              color: Colors.black87,
                              fontSize: 12,
                              fontWeight: FontWeight.w600),
                        ),
                        Text(
                          "2",
                          style: TextStyle(
                              color: Colors.black87,
                              fontSize: 12,
                              fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const Divider(
                color: Color.fromARGB(230, 185, 182, 182),
                indent: 10,
                endIndent: 10,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: CustomOrderTracker(
                  trackerData: [
                    TrackerData(
                        title: "Order Placed",
                        date: "Mon, 12 Jul 2024",
                        trackerDetails: [
                          TrackerDetails(
                            title: "Your order was placed successfully",
                            datetime: "Mon, 12 Jul 2024 - 17:17",
                          ),
                        ],
                        status: true),
                    TrackerData(
                      title: "Order Shipped",
                      date: "Tues, 13 Jul 2024",
                      trackerDetails: [
                        TrackerDetails(
                          title: "Your order was shipped successfully",
                          datetime: "Tues, 13 Jul 2024 - 17:50",
                        ),
                      ],
                      status: true,
                    ),
                    TrackerData(
                        title: "Order Out For Delivery",
                        date: "Wed, 14 Jul 2024",
                        trackerDetails: [
                          TrackerDetails(
                            title: "Your order is now out for delivery",
                            datetime: "Wed, 14 Jul 2024 - 17:51",
                          ),
                        ],
                        status: true),
                    TrackerData(
                        title: "Order Delivered",
                        date: "Thurs, 15 Jul 2024",
                        trackerDetails: [
                          TrackerDetails(
                            title:
                                "You received your order successfully, Thank You.",
                            datetime: "Thurs, 15 Jul 2024 - 17:51",
                          ),
                        ],
                        status: false),
                  ],
                ),
              ),
              const Divider(
                color: Color.fromARGB(230, 185, 182, 182),
                indent: 10,
                endIndent: 10,
              ),
              const Text(
                "Product Price Details",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 6,
              ),
              const Padding(
                padding: EdgeInsets.only(
                  top: 3,
                  left: 10,
                  right: 10,
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  "Actual Price ",
                                  style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w700),
                                ),
                              ),
                              Align(
                                alignment: Alignment.centerRight,
                                child: Text(
                                  "₹500",
                                  style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 8),
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  "Sell Price ",
                                  style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w700),
                                ),
                              ),
                              Align(
                                alignment: Alignment.centerRight,
                                child: Text(
                                  "₹250",
                                  style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 8),
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  "Total Amount Price ",
                                  style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w700),
                                ),
                              ),
                              Align(
                                alignment: Alignment.centerRight,
                                child: Text(
                                  "₹250",
                                  style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w700),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const Divider(
                color: Color.fromARGB(230, 185, 182, 182),
                indent: 10,
                endIndent: 10,
              ),
              const Text(
                "Shipping Details",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 6,
              ),
              const Padding(
                padding:
                    EdgeInsets.only(top: 3, left: 10, right: 10, bottom: 5),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          "Name : ",
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w600),
                        ),
                        Text(
                          "Gokul kannan M",
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Align(
                        alignment: Alignment.bottomLeft,
                        child: Text(
                          "Delivery Address",
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w600),
                        )),
                    Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: Text(
                          "12, New Market Road Gole Market New Delhi Delhi 110001 India",
                          style: TextStyle(
                              fontSize: 13, fontWeight: FontWeight.w400),
                        )),
                    const Divider(
                      color: Color.fromARGB(230, 185, 182, 182),
                      indent: 10,
                      endIndent: 10,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget orderDetail(String fieldName, String value, Color color) {
    return Row(
      children: [
        Expanded(
          flex: 7,
          child: Text(
            fieldName,
            style: const TextStyle(
                color: Colors.black, fontSize: 12, fontWeight: FontWeight.w600),
          ),
        ),
        const Center(
          child: Text(
            ":  ",
            style: TextStyle(
                color: Colors.black, fontSize: 12, fontWeight: FontWeight.bold),
          ),
        ),
        Expanded(
          flex: 20,
          child: Text(
            value,
            style: TextStyle(
                color: color, fontSize: 12, fontWeight: FontWeight.w400),
          ),
        ),
      ],
    );
  }
}
