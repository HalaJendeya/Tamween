import 'package:flutter/material.dart';

import '../../app/app_colors.dart';
import '../../app/app_strings.dart';
import '../../widgets/primary_button.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({required this.onStartShopping, super.key});

  final VoidCallback onStartShopping;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Column(
        children: [
          Container(
            height: 62,
            color: Colors.white,
            child: const Row(
              children: [
                Expanded(
                  child: Center(
                    child: Text(
                      AppStrings.currentOrders,
                      style: TextStyle(color: AppColors.primary, fontSize: 17),
                    ),
                  ),
                ),
                Expanded(
                  child: Center(
                    child: Text(
                      AppStrings.completedOrders,
                      style: TextStyle(fontSize: 17),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: FractionallySizedBox(
              widthFactor: .5,
              child: Container(height: 2, color: AppColors.primary),
            ),
          ),
          Expanded(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 55),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset(
                      'assets/images/empty_orders.png',
                      width: 200,
                      height: 210,
                      fit: BoxFit.contain,
                      filterQuality: FilterQuality.high,
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      AppStrings.noCurrentOrders,
                      style: TextStyle(fontSize: 24),
                    ),
                    const SizedBox(height: 6),
                    const Text(
                      AppStrings.startShoppingSubtitle,
                      style: TextStyle(fontSize: 14),
                    ),
                    const SizedBox(height: 28),
                    PrimaryButton(label: AppStrings.startShopping, onPressed: onStartShopping),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
