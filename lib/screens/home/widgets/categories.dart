import 'package:flutter/material.dart';
import 'package:launder_land/screens/home/products_screen.dart';
import 'package:launder_land/models/category_model/category_model.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';

class Categories extends StatelessWidget {
  const Categories({super.key, required this.categories});
  final List<CategoryModel> categories;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      decoration: BoxDecoration(
        color: theme.primaryColor,
        borderRadius: BorderRadius.circular(13),
      ),
      child: GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        padding: const EdgeInsets.all(12), // Adjust padding to match the gap
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 12, // Adjust spacing to match the gap
          mainAxisSpacing: 12, // Adjust spacing to match the gap
          childAspectRatio: 111 / 134, // Adjust aspect ratio to match the width and height
        ),
        itemBuilder: (_, index) => GridTile(
          child: GestureDetector(
            onTap: () {
              pushScreenWithoutNavBar(context, ProductsScreen(category: categories[index], categories: categories));
            },
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(13), // Rounded rectangle border
                boxShadow: [
                  BoxShadow(
                    // ignore: deprecated_member_use
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              // padding: const EdgeInsets.fromLTRB(12, 23, 12, 12), // Adjust padding to match the measurements
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.network(
                    categories[index].mediaUrls!.images![0].image!,
                    height: 75,
                    width: 75,
                    fit: BoxFit.cover,
                    color: theme.colorScheme.onSecondary,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    categories[index].title!,
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF21295A), // Adjust text color to match the image
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        itemCount: categories.length,
      ),
    );
  }
}
