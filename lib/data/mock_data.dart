import '../models/product.dart';
import '../models/store.dart';

abstract final class MockData {
  static const stores = [
    Store(
      id: 1,
      name: 'أسواق الرياض مولات التجارية',
      subtitle: 'للعطور والأحذية الراقية',
      rating: 4.5,
      distance: '1.2 كم',
    ),
    Store(
      id: 2,
      name: 'أسواق برافو',
      subtitle: 'مواد تموينية ومنتجات طازجة',
      rating: 4.8,
      distance: '2.0 كم',
    ),
  ];

  static const products = [
    Product(
      id: 1,
      name: 'ليمون طازج فاخر',
      unit: '01 كجم',
      price: 89.50,
      oldPrice: 150.50,
    ),
    Product(
      id: 2,
      name: 'ليمون أخضر طازج',
      unit: '01 كجم',
      price: 74.75,
      oldPrice: 115.00,
    ),
    Product(
      id: 3,
      name: 'ليمون بنزهير',
      unit: '01 كجم',
      price: 92.00,
      oldPrice: 135.50,
    ),
  ];
}
