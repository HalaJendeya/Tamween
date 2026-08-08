import 'package:flutter/material.dart';

import '../../app/app_colors.dart';
import '../../app/app_strings.dart';
import '../../models/product.dart';
import '../../widgets/product_card.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({
    required this.products,
    required this.onFavorite,
    required this.onAddToCart,
    super.key,
  });

  final List<Product> products;
  final ValueChanged<Product> onFavorite;
  final ValueChanged<Product> onAddToCart;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 14, 20, 8),
            child: Row(
              children: [
                const Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(AppStrings.welcome, style: TextStyle(color: AppColors.primary, fontSize: 12)),
                      Text(AppStrings.defaultAddress, style: TextStyle(fontSize: 13)),
                    ],
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  constraints: const BoxConstraints(),
                  padding: EdgeInsets.zero,
                  icon: const Icon(Icons.keyboard_arrow_down),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 5, 16, 8),
            child: TextField(
              readOnly: true,
              decoration: InputDecoration(
                hintText: AppStrings.searchPlaceholder,
                prefixIcon: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.search),
                ),
                fillColor: Colors.white,
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(7)),
              ),
            ),
          ),
          Expanded(
            child: products.isEmpty
                ? const Center(child: Text(AppStrings.noFavorites))
                : ListView.builder(
                    itemCount: products.length,
                    itemBuilder: (context, index) {
                      final product = products[index];
                      return ProductCard(
                        product: product,
                        isFavorite: true,
                        onFavorite: () => onFavorite(product),
                        onAddToCart: () => onAddToCart(product),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
