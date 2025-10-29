import 'package:bloc_project/data/models/my_orders_model.dart';
import 'package:equatable/equatable.dart';

import '../../data/models/get_product_model.dart';

abstract class CartEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class AddProductToCart extends CartEvent {
  final Product product;

  AddProductToCart(this.product);

  @override
  List<Object?> get props => [product];
}

class RemoveProductFromCart extends CartEvent {
  final int productId;

  RemoveProductFromCart(this.productId);

  @override
  List<Object?> get props => [productId];
}

class IncreaseQuantity extends CartEvent {
  final int productId;
  IncreaseQuantity(this.productId);
  @override
  List<Object?> get props => [productId];
}

class DecreaseQuantity extends CartEvent {
  final int productId;
  DecreaseQuantity(this.productId);
  @override
  List<Object?> get props => [productId];
}

class TransferDataToMyOrder extends CartEvent {
  final List<Product> productList;
  TransferDataToMyOrder({required this.productList});

}

class ClearCart extends CartEvent {}
