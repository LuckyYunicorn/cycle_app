import 'package:bloc_project/data/models/my_orders_model.dart';
import 'package:equatable/equatable.dart';

sealed class MyOrderEvent extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class AddCheckoutDataEvent extends MyOrderEvent {
  final List<MyOrdersModel> myOrderModelList;
  AddCheckoutDataEvent({required this.myOrderModelList});

  @override
  // TODO: implement props
  List<Object?> get props => [myOrderModelList];
}
