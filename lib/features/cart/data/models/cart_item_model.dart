import 'package:home4u/features/cart/data/models/shop_now_response_model.dart';

class CartItemModel {
  final ShopNowContent product;
  final int quantity;

  CartItemModel({
    required this.product,
    required this.quantity,
  });

  CartItemModel copyWith({
    ShopNowContent? product,
    int? quantity,
  }) {
    return CartItemModel(
      product: product ?? this.product,
      quantity: quantity ?? this.quantity,
    );
  }
}
