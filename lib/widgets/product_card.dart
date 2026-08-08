import 'package:flutter/material.dart';

import '../app/app_colors.dart';
import '../app/app_strings.dart';
import '../models/product.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    required this.product,
    required this.isFavorite,
    required this.onFavorite,
    required this.onAddToCart,
    super.key,
  });

  final Product product;
  final bool isFavorite;
  final VoidCallback onFavorite;
  final VoidCallback onAddToCart;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Card(
          margin: const EdgeInsets.fromLTRB(16, 8, 16, 8),
          elevation: 0,
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
            side: const BorderSide(color: Color(0xFFF1F5F9)),
          ),
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 104,
                  height: 104,
                  decoration: BoxDecoration(
                    color: const Color(0xFFF8FAFC),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding: const EdgeInsets.all(8),
                  child: Image.asset(
                    'assets/images/lemon.png',
                    fit: BoxFit.contain,
                    filterQuality: FilterQuality.high,
                  ),
                ),
                const SizedBox(width: 14),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        product.name,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: AppColors.ink,
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 6),
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                        decoration: BoxDecoration(
                          color: AppColors.orange.withOpacity(0.09),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Text(
                          product.unit,
                          style: const TextStyle(
                            color: AppColors.orange,
                            fontSize: 11,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            AppStrings.price(product.price),
                            style: const TextStyle(
                              color: AppColors.primary,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(width: 8),
                          Text(
                            AppStrings.price(product.oldPrice),
                            style: const TextStyle(
                              color: AppColors.muted,
                              fontSize: 12,
                              decoration: TextDecoration.lineThrough,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      SizedBox(
                        height: 38,
                        width: double.infinity,
                        child: FilledButton.icon(
                          onPressed: onAddToCart,
                          style: FilledButton.styleFrom(
                            backgroundColor: AppColors.primary.withOpacity(0.08),
                            foregroundColor: AppColors.primary,
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          icon: const Icon(Icons.add_shopping_cart, size: 16),
                          label: const Text(
                            AppStrings.addToCart,
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        Positioned(
          right: 24,
          top: 16,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.08),
                  blurRadius: 4,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: IconButton(
              onPressed: onFavorite,
              padding: EdgeInsets.zero,
              constraints: const BoxConstraints(),
              icon: Padding(
                padding: const EdgeInsets.all(8),
                child: Icon(
                  isFavorite ? Icons.favorite : Icons.favorite_border,
                  color: AppColors.primary,
                  size: 18,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
