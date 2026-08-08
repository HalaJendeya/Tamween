import 'package:flutter/material.dart';

import '../../app/app_strings.dart';
import '../../data/mock_data.dart';
import '../../models/product.dart';
import '../../widgets/app_bottom_nav.dart';
import '../cart/cart_screen.dart';
import '../favorites/favorites_screen.dart';
import '../home/home_screen.dart';
import '../orders/orders_screen.dart';
import '../profile/profile_screen.dart';

class AppShell extends StatefulWidget {
  const AppShell({super.key});

  @override
  State<AppShell> createState() => _AppShellState();
}

class _AppShellState extends State<AppShell> {
  int _currentIndex = 0;
  final Set<int> _favoriteIds = {1, 2, 3};
  final Map<int, int> _cartQuantities = {};

  int get _cartCount => _cartQuantities.values.fold(0, (sum, value) => sum + value);

  void _selectTab(int index) => setState(() => _currentIndex = index);

  void _toggleFavorite(Product product) {
    setState(() {
      if (!_favoriteIds.add(product.id)) {
        _favoriteIds.remove(product.id);
      }
    });
  }

  void _addToCart(Product product) {
    setState(() {
      _cartQuantities.update(product.id, (value) => value + 1, ifAbsent: () => 1);
    });
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(SnackBar(content: Text(AppStrings.addedToCart(product.name))));
  }

  void _removeFromCart(Product product) {
    setState(() {
      final quantity = _cartQuantities[product.id] ?? 0;
      if (quantity <= 1) {
        _cartQuantities.remove(product.id);
      } else {
        _cartQuantities[product.id] = quantity - 1;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final favorites = MockData.products.where((item) => _favoriteIds.contains(item.id)).toList();
    final cartProducts = MockData.products.where((item) => _cartQuantities.containsKey(item.id)).toList();

    final pages = [
      HomeScreen(
        cartCount: _cartCount,
        favoriteIds: _favoriteIds,
        onAddToCart: _addToCart,
        onFavorite: _toggleFavorite,
        onTabSelected: _selectTab,
      ),
      OrdersScreen(onStartShopping: () => _selectTab(0)),
      CartScreen(
        products: cartProducts,
        quantities: _cartQuantities,
        onAdd: _addToCart,
        onRemove: _removeFromCart,
        onStartShopping: () => _selectTab(0),
      ),
      FavoritesScreen(
        products: favorites,
        onFavorite: _toggleFavorite,
        onAddToCart: _addToCart,
      ),
      const ProfileScreen(),
    ];

    return Scaffold(
      body: IndexedStack(index: _currentIndex, children: pages),
      bottomNavigationBar: AppBottomNav(
        currentIndex: _currentIndex,
        cartCount: _cartCount,
        onTap: _selectTab,
      ),
    );
  }
}
