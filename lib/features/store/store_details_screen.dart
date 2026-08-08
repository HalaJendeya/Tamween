import 'package:flutter/material.dart';

import '../../app/app_colors.dart';
import '../../app/app_strings.dart';
import '../../data/mock_data.dart';
import '../../models/product.dart';
import '../../models/store.dart';
import '../../widgets/app_bottom_nav.dart';
import '../../widgets/product_card.dart';

class StoreDetailsScreen extends StatefulWidget {
  const StoreDetailsScreen({
    required this.store,
    required this.cartCount,
    required this.favoriteIds,
    required this.onAddToCart,
    required this.onFavorite,
    required this.onTabSelected,
    super.key,
  });

  final Store store;
  final int cartCount;
  final Set<int> favoriteIds;
  final ValueChanged<Product> onAddToCart;
  final ValueChanged<Product> onFavorite;
  final ValueChanged<int> onTabSelected;

  @override
  State<StoreDetailsScreen> createState() => _StoreDetailsScreenState();
}

class _StoreDetailsScreenState extends State<StoreDetailsScreen> {
  late final Set<int> _favoriteIds;
  late int _cartCount;

  @override
  void initState() {
    super.initState();
    _favoriteIds = Set<int>.from(widget.favoriteIds);
    _cartCount = widget.cartCount;
  }

  void _toggleFavorite(Product product) {
    setState(() {
      if (!_favoriteIds.add(product.id)) {
        _favoriteIds.remove(product.id);
      }
    });
    widget.onFavorite(product);
  }

  void _addToCart(Product product) {
    setState(() => _cartCount += 1);
    widget.onAddToCart(product);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.fromLTRB(16, 10, 16, 16),
              decoration: const BoxDecoration(
                color: AppColors.primary,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(28),
                  bottomRight: Radius.circular(28),
                ),
              ),
              child: Row(
                children: [
                  IconButton(
                    onPressed: () => Navigator.of(context).pop(),
                    style: IconButton.styleFrom(
                      backgroundColor: Colors.white.withOpacity(0.2),
                      foregroundColor: Colors.white,
                    ),
                    icon: const Icon(Icons.arrow_back),
                  ),
                  const SizedBox(width: 12),
                  Container(
                    width: 54,
                    height: 54,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    padding: const EdgeInsets.all(4),
                    child: ClipOval(
                      child: Image.asset(
                        'assets/images/store_logo.png',
                        fit: BoxFit.contain,
                        filterQuality: FilterQuality.high,
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.store.name,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 2),
                        const Text(
                          AppStrings.storeDetails,
                          style: TextStyle(color: Colors.white70, fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    style: IconButton.styleFrom(
                      backgroundColor: Colors.white.withOpacity(0.2),
                      foregroundColor: Colors.white,
                    ),
                    icon: const Icon(Icons.search),
                  ),
                ],
              ),
            ),
            const _StoreCategories(),
            Expanded(
              child: ListView.builder(
                itemCount: MockData.products.length,
                itemBuilder: (context, index) {
                  final product = MockData.products[index];
                  return ProductCard(
                    product: product,
                    isFavorite: _favoriteIds.contains(product.id),
                    onFavorite: () => _toggleFavorite(product),
                    onAddToCart: () => _addToCart(product),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: AppBottomNav(
        currentIndex: 0,
        cartCount: _cartCount,
        onTap: widget.onTabSelected,
      ),
    );
  }
}

class _StoreCategories extends StatefulWidget {
  const _StoreCategories();

  @override
  State<_StoreCategories> createState() => _StoreCategoriesState();
}

class _StoreCategoriesState extends State<_StoreCategories> {
  int _selectedCategoryIndex = 0;
  final List<String> _categories = [
    AppStrings.categoryAll,
    AppStrings.categoryVegetables,
    AppStrings.categorySnacks,
    AppStrings.categoryMeats,
    AppStrings.categoryFruits,
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 52,
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(bottom: BorderSide(color: Color(0xFFF1F5F9))),
      ),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        itemCount: _categories.length + 1,
        itemBuilder: (context, index) {
          if (index == 0) {
            return Container(
              margin: const EdgeInsets.symmetric(horizontal: 4),
              decoration: BoxDecoration(
                color: const Color(0xFFF1F5F9),
                borderRadius: BorderRadius.circular(20),
              ),
              child: IconButton(
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(),
                onPressed: () {},
                icon: const Icon(Icons.tune_rounded, size: 18, color: AppColors.ink),
              ),
            );
          }
          final catIndex = index - 1;
          final isSelected = catIndex == _selectedCategoryIndex;
          return GestureDetector(
            onTap: () => setState(() => _selectedCategoryIndex = catIndex),
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 4),
              padding: const EdgeInsets.symmetric(horizontal: 18),
              decoration: BoxDecoration(
                color: isSelected ? AppColors.primary : const Color(0xFFF1F5F9),
                borderRadius: BorderRadius.circular(20),
              ),
              alignment: Alignment.center,
              child: Text(
                _categories[catIndex],
                style: TextStyle(
                  color: isSelected ? Colors.white : AppColors.ink,
                  fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
                  fontSize: 13,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
