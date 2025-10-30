import 'package:bloc_project/data/models/get_product_model.dart';
import 'package:bloc_project/data/models/my_orders_model.dart';
import 'package:equatable/equatable.dart';

sealed class MyOrderEvent extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class AddCheckoutDataEvent extends MyOrderEvent {
  final List<dynamic> productList;
  AddCheckoutDataEvent({required this.productList});

  @override
  // TODO: implement props
  List<dynamic> get props => [productList];
}
