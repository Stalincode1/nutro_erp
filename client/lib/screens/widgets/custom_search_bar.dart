import 'package:flutter/material.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Container(
      padding: const EdgeInsets.only(
        left: 15,
      ),
      width: screenWidth * 0.8,
      height: screenHeight * 0.057,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.black38),
          color: Color.fromARGB(255, 251, 247, 229)),
      child: TextFormField(
        decoration: const InputDecoration(
            border: InputBorder.none,
            suffixIcon: Icon(Icons.search),
            floatingLabelBehavior: FloatingLabelBehavior.never,
            hintText: 'Search'
            // contentPadding: EdgeInsets.only(left: 5,top:5.5)
            ),
      ),
    );
  }
}
