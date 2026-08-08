import 'package:flutter/material.dart';

import '../app/app_colors.dart';

class AppBottomNav extends StatelessWidget {
  const AppBottomNav({
    required this.currentIndex,
    required this.onTap,
    this.cartCount = 0,
    super.key,
  });

  final int currentIndex;
  final ValueChanged<int> onTap;
  final int cartCount;

  static const _items = [
    (Icons.home_outlined, Icons.home, 'الرئيسية'),
    (Icons.receipt_long_outlined, Icons.receipt_long, 'الطلبات'),
    (Icons.shopping_cart_outlined, Icons.shopping_cart, 'سلة الشراء'),
    (Icons.favorite_border, Icons.favorite, 'المفضلة'),
    (Icons.person_outline, Icons.person, 'الحساب'),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          border: Border(top: BorderSide(color: Color(0xFFE8ECEE))),
        ),
        child: Row(
          children: List.generate(_items.length, (index) {
            final item = _items[index];
            final selected = index == currentIndex;
            final icon = selected ? item.$2 : item.$1;
            return Expanded(
              child: InkWell(
                onTap: () => onTap(index),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Badge(
                        isLabelVisible: index == 2 && cartCount > 0,
                        label: Text('$cartCount'),
                        backgroundColor: AppColors.orange,
                        child: Icon(
                          icon,
                          color: selected ? AppColors.primary : AppColors.ink,
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        item.$3,
                        maxLines: 1,
                        style: TextStyle(
                          fontSize: 10,
                          color: selected ? AppColors.primary : AppColors.ink,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}
