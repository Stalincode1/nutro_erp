import 'package:flutter/material.dart';

class CustomListTile extends StatelessWidget {
  const CustomListTile({super.key});

  @override
  Widget build(BuildContext context) {

    final screenHeight =MediaQuery.of(context).size.height;
    final screenWidth =MediaQuery.of(context).size.width;

    return GestureDetector(
      onTap: (){
        print("CLicked");
      },
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Container(

            width: screenWidth*0.30,
            height: screenHeight*0.17,
            decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(7),
                border: Border.all(color: Colors.black12)
            ),
            padding: const EdgeInsets.all(5),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.network('https://media.istockphoto.com/id/610957954/photo/mixed-nuts-shelled.jpg?s=612x612&w=0&k=20&c=Bg43e5FkTJnOPQwwvy5Qb38H-kShEMGBR3TxzLi3vT8='),
                const Spacer(),
                const Text('Dates'),
                const Spacer(),
              ],
            )
        ),
      ),
    );
  }
}
