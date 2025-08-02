import 'package:ecommerce_app/constants/app_colors.dart';
import 'package:ecommerce_app/constants/assets_images.dart';
import 'package:ecommerce_app/models/product_models.dart';
import 'package:ecommerce_app/widgets/category_chip.dart';
import 'package:ecommerce_app/widgets/product_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> listCategoryTitle = ["All Items", "Dress", "T-Shirt", "Pants"];
  List<String> listCategoryImages = [
    AssetsImages.categoryIcon,
    AssetsImages.dressIcon,
    AssetsImages.tshirtIcon,
    AssetsImages.pantsIcon,
  ];
  int selectedIndex = 0;
  TextEditingController searchController = TextEditingController();
  List<ProductModels> filteredProducts = [];

  @override
  void initState() {
    super.initState();
    filteredProducts = productList;
  }

  void _applyFilters() {
    String query = searchController.text.toLowerCase();
    String selectedCategory = listCategoryTitle[selectedIndex];

    setState(() {
      filteredProducts = productList.where((product) {
        final matchesQuery = product.title.toLowerCase().contains(query);
        final matchesCategory =
            selectedCategory == "All Items" ||
            product.category.toLowerCase() == selectedCategory.toLowerCase();

        return matchesQuery && matchesCategory;
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        toolbarHeight: 100,
        actionsPadding: EdgeInsets.only(right: 24),
        titleSpacing: 24,
        backgroundColor: AppColors.white,
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Hello, Welcome 👋",
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    color: AppColors.foundationNeutralGrey4,
                    height: 1.5,
                    fontSize: 12,
                    letterSpacing: 0,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  "Albert Stevano",
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    color: AppColors.foundationNeutralGrey10,
                    height: 1.5,
                    fontSize: 16,
                    letterSpacing: 0,
                  ),
                ),
              ],
            ),
            CircleAvatar(radius: 16, backgroundImage: AssetImage(AssetsImages.profile)),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: searchController,
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        color: AppColors.foundationNeutralGrey13,
                        height: 1.5,
                        letterSpacing: 0,
                      ),
                      onChanged: (value) {
                        setState(() {
                          _applyFilters();
                        });
                      },
                      decoration: InputDecoration(
                        prefixIcon: Padding(
                          padding: EdgeInsetsGeometry.only(left: 8),
                          child: Icon(Icons.search, size: 30),
                        ),
                        prefixIconColor: WidgetStateColor.resolveWith((Set<WidgetState> states) {
                          if (states.contains(WidgetState.focused)) {
                            return AppColors.foundationNeutralGrey13;
                          }
                          return AppColors.foundationNeutralGrey6;
                        }),
                        hintText: "Searcg clothes...",
                        hintStyle: TextStyle(
                          fontWeight: FontWeight.w400,
                          color: AppColors.foundationNeutralGrey6,
                          height: 1.5,
                          letterSpacing: 0,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(color: AppColors.foundationNeutralGrey5, width: 1),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(
                            color: AppColors.foundationNeutralGrey13,
                            width: 2,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 16),
                  Container(
                    padding: EdgeInsets.all(19),
                    decoration: BoxDecoration(
                      color: AppColors.foundationNeutralGrey13,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Image.asset(AssetsImages.mainIcon, height: 20, width: 20),
                  ),
                ],
              ),
            ),
            SizedBox(height: 32),
            SizedBox(
              height: 40,
              child: ListView.builder(
                itemCount: listCategoryTitle.length,
                shrinkWrap: true,
                padding: EdgeInsets.symmetric(horizontal: 24),
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedIndex = index;
                        _applyFilters();
                      });
                    },
                    child: CategoryChip(
                      title: listCategoryTitle[index],
                      image: listCategoryImages[index],
                      isSelected: selectedIndex == index,
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 24),
            filteredProducts.isEmpty
                ? Center(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 60),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.search_off_rounded, size: 64, color: Colors.grey[400]),
                          SizedBox(height: 16),
                          Text(
                            "No products found",
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.grey[700],
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            "Try adjusting your search or filters.",
                            style: TextStyle(fontSize: 14, color: Colors.grey[500]),
                          ),
                        ],
                      ),
                    ),
                  )
                : MasonryGridView.count(
                    crossAxisCount: 2,
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    mainAxisSpacing: 16,
                    padding: EdgeInsets.symmetric(horizontal: 24),
                    crossAxisSpacing: 16,
                    itemCount: filteredProducts.length,
                    itemBuilder: (context, index) {
                      final isShort = index % 4 == 0 || index % 4 == 3;
                      final product = filteredProducts[index];
                      return ProductCard(
                        isShort: isShort,
                        title: product.title,
                        category: product.category,
                        image: product.image,
                        price: product.price,
                        rating: product.rating,
                        isFavorite: product.isFavorite,
                        onTap: () {
                          setState(() {
                            product.isFavorite = !product.isFavorite;
                          });
                        },
                      );
                    },
                  ),
            SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}
