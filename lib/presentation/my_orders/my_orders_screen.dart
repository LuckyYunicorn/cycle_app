import 'package:bloc_project/core/constants/image_constants.dart';
import 'package:bloc_project/core/navigation/navigation_service.dart';
import 'package:bloc_project/data/models/my_orders_model.dart';
import 'package:bloc_project/logic/my_orders/my_order_bloc.dart';
import 'package:bloc_project/logic/my_orders/my_order_state.dart';
import 'package:bloc_project/routes/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/colors/colors.dart';
import '../../core/constants/string_constants.dart';
import '../../core/themes/app_text_style.dart';
import '../../core/widgets/common_widgets.dart';

class MyOrdersScreen extends StatelessWidget {
  const MyOrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backGroundColor,
      resizeToAvoidBottomInset: false,
      appBar: CommonWidgets.appBar(title: StringConstants.myOrders),
      body: SafeArea(
        child: BlocBuilder<MyOrderBloc, MyOrderState>(
          builder: (context, state) {
            if (state is MyOrderAddedState) {
              if (state.myOrderModelList.isNotEmpty) {
                return ListView.builder(
                  itemCount: state.myOrderModelList.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      onTap: () {
                        //TODO: Navigate to order details screen
                        NavigationService.pushNamed(
                          AppRoutes.myOrderStatus,
                          arguments: {
                            "status": state.myOrderModelList[index].status,
                          },
                        );
                      },
                      leading: Container(
                        clipBehavior: Clip.hardEdge,
                        width: 80,
                        height: 50,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(ImageConstants.imgBannerBg),
                            fit: BoxFit.cover,
                          ),
                        ),
                        child: Image.asset(state.myOrderModelList[index].image),
                      ),
                      title: Text(
                        state.myOrderModelList[index].title,
                        style: AppTextStyle.titleStyle16bw,
                      ),
                      subtitle: Text(
                        "${state.myOrderModelList[index].date}",
                        style: AppTextStyle.titleStyle14gr,
                      ),
                      trailing: Column(
                        children: [
                          Text(
                            "${state.myOrderModelList[index].status}",
                            style: AppTextStyle.titleStyle14gr,
                          ),
                          Text(
                            "${state.myOrderModelList[index].price}",
                            style: AppTextStyle.titleStyle14gr,
                          ),
                        ],
                      ),
                    );
                  },
                );
              } else {
                return Center(child: Text("No data Found"));
              }
            } else {
              return Center(child: Text("No data"));
            }
          },
        ),
      ),
    );
  }
}
