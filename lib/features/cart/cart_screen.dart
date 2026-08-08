import 'package:flutter/material.dart';

import '../../app/app_colors.dart';
import '../../app/app_strings.dart';
import '../../models/product.dart';
import '../../widgets/primary_button.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({
    required this.products,
    required this.quantities,
    required this.onAdd,
    required this.onRemove,
    required this.onStartShopping,
    super.key,
  });

  final List<Product> products;
  final Map<int, int> quantities;
  final ValueChanged<Product> onAdd;
  final ValueChanged<Product> onRemove;
  final VoidCallback onStartShopping;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Column(
        children: [
          Container(
            height: 70,
            padding: const EdgeInsets.symmetric(horizontal: 14),
            color: Colors.white,
            child: Row(
              children: [
                const Expanded(child: Center(child: Text(AppStrings.cartTitle, style: TextStyle(fontSize: 20)))),
                IconButton.filledTonal(
                  onPressed: products.isEmpty ? null : () {
                    for (final product in List<Product>.from(products)) {
                      final count = quantities[product.id] ?? 0;
                      for (var i = 0; i < count; i++) {
                        onRemove(product);
                      }
                    }
                  },
                  icon: const Icon(Icons.delete_outline),
                ),
              ],
            ),
          ),
          Expanded(
            child: products.isEmpty
                ? Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 55),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Image.asset(
                            'assets/images/empty_cart.png',
                            width: 210,
                            height: 200,
                            fit: BoxFit.contain,
                            filterQuality: FilterQuality.high,
                          ),
                          const SizedBox(height: 16),
                          const Text(AppStrings.cartEmpty, style: TextStyle(fontSize: 24)),
                          const SizedBox(height: 6),
                          const Text(AppStrings.startShoppingSubtitle),
                          const SizedBox(height: 28),
                          PrimaryButton(label: AppStrings.startShopping, onPressed: onStartShopping),
                        ],
                      ),
                    ),
                  )
                : ListView.builder(
                    padding: const EdgeInsets.only(top: 10),
                    itemCount: products.length,
                    itemBuilder: (context, index) {
                      final product = products[index];
                      final quantity = quantities[product.id] ?? 1;
                      return Card(
                        margin: const EdgeInsets.fromLTRB(16, 8, 16, 8),
                        color: Colors.white,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                          side: const BorderSide(color: Color(0xFFF1F5F9)),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(12),
                          child: Row(
                            children: [
                              Container(
                                width: 80,
                                height: 80,
                                decoration: BoxDecoration(
                                  color: const Color(0xFFF8FAFC),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                padding: const EdgeInsets.all(6),
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
                                    const SizedBox(height: 4),
                                    Text(
                                      AppStrings.price(product.price),
                                      style: const TextStyle(
                                        color: AppColors.primary,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15,
                                      ),
                                    ),
                                    const SizedBox(height: 8),
                                    Container(
                                      decoration: BoxDecoration(
                                        color: const Color(0xFFF8FAFC),
                                        borderRadius: BorderRadius.circular(20),
                                        border: Border.all(color: const Color(0xFFE2E8F0)),
                                      ),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          IconButton(
                                            onPressed: () => onAdd(product),
                                            icon: const Icon(Icons.add, size: 16, color: AppColors.primary),
                                            constraints: const BoxConstraints(),
                                            padding: const EdgeInsets.all(8),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(horizontal: 10),
                                            child: Text(
                                              '$quantity',
                                              style: const TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.bold,
                                                color: AppColors.ink,
                                              ),
                                            ),
                                          ),
                                          IconButton(
                                            onPressed: () => onRemove(product),
                                            icon: const Icon(Icons.remove, size: 16, color: AppColors.primary),
                                            constraints: const BoxConstraints(),
                                            padding: const EdgeInsets.all(8),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
