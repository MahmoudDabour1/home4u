import 'package:home4u/features/cart/data/models/shop_now_response_model.dart';

class CartItemModel {
  final ShopNowContent product;
  int quantity;

  CartItemModel({
    required this.product,
    this.quantity = 1,
  });
}
