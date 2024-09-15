import 'package:client/constants/ui_routes.dart';
import 'package:client/screens/user/Category_ProductScreen.dart';
import 'package:flutter/material.dart';

class Categories extends StatelessWidget {
  Categories({super.key});
  static String routeName = UiScreenRoutes.categories; // Direct static access

  // Sample list of categories with image URLs and labels
  final List<Map<String, String>> categories = [
    {
      "name": "Dates",
      "image":
          "https://images.immediate.co.uk/production/volatile/sites/30/2024/03/Nuts-2def52f.jpg?quality=90&resize=440,400"
    },
    {
      "name": "Nuts",
      "image":
          "https://images.immediate.co.uk/production/volatile/sites/30/2024/03/Nuts-2def52f.jpg?quality=90&resize=440,400"
    },
    {
      "name": "Fruits",
      "image":
          "https://media.istockphoto.com/id/610957954/photo/mixed-nuts-shelled.jpg?s=612x612&w=0&k=20&c=Bg43e5FkTJnOPQwwvy5Qb38H-kShEMGBR3TxzLi3vT8="
    },
    {
      "name": "Vegetables",
      "image":
          "https://images.immediate.co.uk/production/volatile/sites/30/2024/03/Nuts-2def52f.jpg?quality=90&resize=440,400"
    },
    {
      "name": "Spices",
      "image":
          "https://images.immediate.co.uk/production/volatile/sites/30/2024/03/Nuts-2def52f.jpg?quality=90&resize=440,400"
    },
    {
      "name": "Beverages",
      "image":
          "https://images.immediate.co.uk/production/volatile/sites/30/2024/03/Nuts-2def52f.jpg?quality=90&resize=440,400"
    },
    {
      "name": "Snacks",
      "image":
          "https://images.immediate.co.uk/production/volatile/sites/30/2024/03/Nuts-2def52f.jpg?quality=90&resize=440,400"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Categories'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Banner Image
            Container(
              margin: const EdgeInsets.all(10),
              height: 200,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                image: const DecorationImage(
                  image: NetworkImage(
                    'https://images.immediate.co.uk/production/volatile/sites/30/2024/03/Nuts-2def52f.jpg?quality=90&resize=440,400',
                  ),
                  fit: BoxFit.cover,
                ),
              ),
              child: const Center(
                child: Text(
                  '',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    shadows: [
                      Shadow(
                        blurRadius: 10.0,
                        color: Colors.black,
                        offset: Offset(3, 3),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            // Grid of Categories
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GridView.builder(
                shrinkWrap: true,
                physics:
                    const NeverScrollableScrollPhysics(), // Prevents grid from scrolling independently
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // 2 items per row
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  return CategoryCard(
                    categoryName: categories[index]['name']!,
                    imageUrl: categories[index]['image']!,
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

class CategoryCard extends StatelessWidget {
  final String categoryName;
  final String imageUrl;

  const CategoryCard({
    super.key,
    required this.categoryName,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // Navigate to ProductListScreen with categoryName
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductListScreen(categoryName: categoryName),
          ),
        );
      },
      child: Stack(
        children: [
          // Background image
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              image: DecorationImage(
                image: NetworkImage(imageUrl),
                fit: BoxFit.cover, // Cover the entire area
              ),
            ),
          ),
          // Text overlay
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              gradient: LinearGradient(
                colors: [
                  const Color.fromARGB(255, 125, 139, 66).withOpacity(0.5),
                  const Color.fromARGB(0, 0, 0, 0),
                ],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
              ),
            ),
          ),
          // Positioned text
          Positioned(
            bottom: 10,
            left: 10,
            child: Text(
              categoryName,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
                shadows: [
                  Shadow(
                    blurRadius: 5.0,
                    color: Colors.black,
                    offset: Offset(2, 2),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
