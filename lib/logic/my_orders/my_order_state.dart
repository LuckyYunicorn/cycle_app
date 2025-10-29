import 'package:bloc_project/data/models/my_orders_model.dart';
import 'package:equatable/equatable.dart';

sealed class MyOrderState extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class MyOrderStateInitial extends MyOrderState {}

class MyOrderAddedState extends MyOrderState {
  final List<MyOrdersModel> myOrderModelList;
  MyOrderAddedState({required this.myOrderModelList});

  @override
  // TODO: implement props
  List<Object?> get props => [myOrderModelList];
}
