import 'package:ecommerce_app/constants/app_colors.dart';
import 'package:flutter/material.dart';

class CategoryChip extends StatelessWidget {
  final String image;
  final String title;
  final bool isSelected;
  const CategoryChip({
    super.key,
    required this.image,
    required this.title,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 16),
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: isSelected ? AppColors.foundationNeutralGrey13 : AppColors.white,
        border: Border.all(
          color: isSelected ? AppColors.foundationNeutralGrey13 : AppColors.foundationNeutralGrey5,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Image.asset(image),
          SizedBox(width: 4),
          Text(
            title,
            style: TextStyle(
              color: isSelected ? AppColors.white : AppColors.foundationNeutralGrey13,
            ),
          ),
        ],
      ),
    );
  }
}
