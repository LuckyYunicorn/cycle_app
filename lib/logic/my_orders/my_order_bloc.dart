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
    // 1️⃣ Convert incoming product list to MyOrdersModel list
    final List<MyOrdersModel> list = event.productList.map((e) {
      return MyOrdersModel(
        id: e.id,
        title: e.title,
        price: e.price,
        quantity: e.quantity,
        image: e.image,
        date: DateTime.now(),
        status: "shipping",
        isFavorite: e.isFavorite,
      );
    }).toList();

    // 2️⃣ Get old list safely
    List<MyOrdersModel> previousList = [];

    if (state is MyOrderAddedState) {
      previousList = List.from((state as MyOrderAddedState).myOrderModelList);
    }

    // 3️⃣ Combine both lists
    final List<MyOrdersModel> updatedList = [...previousList, ...list];

    // 4️⃣ Emit new state
    emit(MyOrderAddedState(myOrderModelList: updatedList));
  }
}
