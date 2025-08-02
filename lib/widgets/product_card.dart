import 'package:ecommerce_app/constants/app_colors.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatefulWidget {
  final bool isShort;
  final String title;
  final String image;
  final String category;
  final double price;
  final double rating;
  final bool isFavorite;
  final void Function()? onTap;

  const ProductCard({
    super.key,
    required this.isShort,
    required this.title,
    required this.image,
    required this.category,
    required this.price,
    required this.rating,
    required this.isFavorite,
    required this.onTap,
  });

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12)),
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.asset(
                  widget.image,
                  height: widget.isShort ? 216 : 250,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.title,
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                        color: AppColors.foundationNeutralGrey10,
                        height: 1.5,
                        letterSpacing: 0,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      widget.category,
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                        color: AppColors.foundationNeutralGrey4,
                        height: 1.5,
                        letterSpacing: 0,
                      ),
                    ),
                    SizedBox(height: 12),
                    Row(
                      children: [
                        Text(
                          "\$${widget.price}",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 14,
                            color: AppColors.foundationNeutralGrey13,
                            height: 1.5,
                            letterSpacing: 0,
                          ),
                        ),
                        SizedBox(width: 24),
                        Icon(Icons.star, color: Colors.amber, size: 18),
                        SizedBox(width: 4),
                        Text(
                          widget.rating.toString(),
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 12,
                            color: AppColors.foundationNeutralGrey13,
                            height: 1.5,
                            letterSpacing: 0,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          Positioned(
            right: 14,
            top: 14,
            child: GestureDetector(
              onTap: widget.onTap,
              child: CircleAvatar(
                radius: 13,
                backgroundColor: AppColors.foundationNeutralGrey13,
                child: widget.isFavorite
                    ? Icon(Icons.favorite, color: AppColors.white, size: 16)
                    : Icon(Icons.favorite_border_outlined, color: AppColors.white, size: 16),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
