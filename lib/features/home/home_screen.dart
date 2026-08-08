import 'package:flutter/material.dart';

import '../../app/app_colors.dart';
import '../../app/app_strings.dart';
import '../../data/mock_data.dart';
import '../../models/product.dart';
import '../store/store_details_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    required this.cartCount,
    required this.favoriteIds,
    required this.onAddToCart,
    required this.onFavorite,
    required this.onTabSelected,
    super.key,
  });

  final int cartCount;
  final Set<int> favoriteIds;
  final ValueChanged<Product> onAddToCart;
  final ValueChanged<Product> onFavorite;
  final ValueChanged<int> onTabSelected;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              children: [
                const _LocationHeader(),
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 6, 16, 12),
                  child: TextField(
                    readOnly: true,
                    decoration: InputDecoration(
                      hintText: AppStrings.searchPlaceholder,
                      prefixIcon: IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.search, color: AppColors.ink),
                      ),
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(color: Color(0xFFE2E8F0)),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(color: Color(0xFFE2E8F0)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(color: AppColors.primary, width: 1.5),
                      ),
                      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: AspectRatio(
                    aspectRatio: 2.3,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: Image.asset(
                        'assets/images/promo_banner.png',
                        fit: BoxFit.cover,
                        filterQuality: FilterQuality.high,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                const _Categories(),
                const SizedBox(height: 8),
              ],
            ),
          ),
          SliverList.builder(
            itemCount: MockData.stores.length,
            itemBuilder: (context, index) {
              final store = MockData.stores[index];
              return InkWell(
                onTap: () => Navigator.of(context).push(
                  MaterialPageRoute<void>(
                    builder: (_) => StoreDetailsScreen(
                      store: store,
                      cartCount: cartCount,
                      favoriteIds: favoriteIds,
                      onAddToCart: onAddToCart,
                      onFavorite: onFavorite,
                      onTabSelected: (tab) {
                        Navigator.of(context).pop();
                        onTabSelected(tab);
                      },
                    ),
                  ),
                ),
                child: Card(
                  margin: const EdgeInsets.fromLTRB(16, 7, 16, 7),
                  elevation: 0,
                  color: Colors.white,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.asset(
                            'assets/images/store_market.png',
                            width: 132,
                            height: 100,
                            fit: BoxFit.cover,
                            filterQuality: FilterQuality.high,
                          ),
                        ),
                        const SizedBox(width: 14),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(store.name, style: const TextStyle(fontSize: 16)),
                              const SizedBox(height: 5),
                              Text(store.subtitle, style: const TextStyle(fontSize: 13)),
                              const SizedBox(height: 16),
                              Row(
                                children: [
                                  const Icon(Icons.star, color: AppColors.star, size: 18),
                                  Text('${store.rating}'),
                                  const Spacer(),
                                  Text(store.distance, style: const TextStyle(color: AppColors.muted)),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 20)),
        ],
      ),
    );
  }
}

class _LocationHeader extends StatelessWidget {
  const _LocationHeader();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 12, 16, 8),
      child: Row(
        children: [
          Container(
            width: 38,
            height: 38,
            decoration: BoxDecoration(
              color: AppColors.primary.withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.location_on_rounded,
              color: AppColors.primary,
              size: 20,
            ),
          ),
          const SizedBox(width: 12),
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  AppStrings.deliverTo,
                  style: TextStyle(color: AppColors.muted, fontSize: 11, fontWeight: FontWeight.w500),
                ),
                SizedBox(height: 2),
                Text(
                  AppStrings.defaultAddress,
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: AppColors.ink),
                ),
              ],
            ),
          ),
          IconButton(
            onPressed: () {},
            constraints: const BoxConstraints(),
            padding: EdgeInsets.zero,
            icon: const Icon(Icons.keyboard_arrow_down_rounded, color: AppColors.ink),
          ),
        ],
      ),
    );
  }
}

class _Categories extends StatelessWidget {
  const _Categories();

  static const categories = [
    (Icons.grid_view_rounded, AppStrings.categoryAll),
    (Icons.local_florist_rounded, AppStrings.categoryVegetables),
    (Icons.fastfood_rounded, AppStrings.categorySnacks),
    (Icons.dinner_dining_rounded, AppStrings.categoryMeats),
    (Icons.cookie_rounded, AppStrings.categorySweets),
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 104,
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        separatorBuilder: (_, __) => const SizedBox(width: 14),
        itemBuilder: (context, index) {
          final category = categories[index];
          final selected = index == 0;
          return Column(
            children: [
              Container(
                width: 68,
                height: 68,
                decoration: BoxDecoration(
                  color: selected ? AppColors.primary : const Color(0xFFF1F5F9),
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: selected
                      ? [
                          BoxShadow(
                            color: AppColors.primary.withOpacity(0.3),
                            blurRadius: 8,
                            offset: const Offset(0, 4),
                          )
                        ]
                      : null,
                ),
                child: IconButton(
                  onPressed: () {},
                  padding: EdgeInsets.zero,
                  icon: Icon(
                    category.$1,
                    color: selected ? Colors.white : AppColors.ink,
                    size: 28,
                  ),
                ),
              ),
              const SizedBox(height: 6),
              Text(
                category.$2,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: selected ? FontWeight.bold : FontWeight.w500,
                  color: selected ? AppColors.primary : AppColors.ink,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
