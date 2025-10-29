import 'package:bloc_project/data/models/my_orders_model.dart';
import 'package:bloc_project/logic/my_orders/my_order_event.dart';
import 'package:bloc_project/logic/my_orders/my_order_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyOrderBloc extends Bloc<MyOrderEvent, MyOrderState> {
  MyOrderBloc() : super(MyOrderStateInitial()) {
    on<AddCheckoutDataEvent>(_addMyCheckoutData);
  }
  void _addMyCheckoutData(
    AddCheckoutDataEvent event,
    Emitter<MyOrderState> emit,
  ) {

    // Emit new state with combined list
    emit(MyOrderAddedState(myOrderModelList: updatedList));
    // emit(MyOrderAddedState(myOrderModelList: list));
  }
}
