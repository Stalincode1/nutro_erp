import 'package:flutter/material.dart';

class CustomHorizaontalDivider extends StatelessWidget {
  const CustomHorizaontalDivider({super.key, required this.title});

  final String title;
  @override
  Widget build(BuildContext context) {

    final screenWidth =MediaQuery.of(context).size.width;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
            width: screenWidth*0.30,
            child: const Divider(thickness: 1.5,)),
        const SizedBox(width: 5,),
        Text(title),
        const SizedBox(width: 5,),
        SizedBox(
            width: screenWidth*0.30,
            child: const Divider(thickness: 1.5,))
      ],
    );
  }
}
