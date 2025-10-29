import 'package:flutter/material.dart';
import '../../core/colors/colors.dart';
import '../../core/constants/string_constants.dart';
import '../../core/themes/app_text_style.dart';
import '../../core/widgets/common_widgets.dart';

class MyOrderStatusScreen extends StatefulWidget {
  final Object? status;
  const MyOrderStatusScreen({super.key, required this.status});

  @override
  State<MyOrderStatusScreen> createState() => _MyOrderStatusScreenState();
}

class _MyOrderStatusScreenState extends State<MyOrderStatusScreen> {
  int _currentStep = 0;

  @override
  Widget build(BuildContext context) {
    Object? data = widget.status;

    print("${data}  ob");

    final map = data as Map<String, dynamic>;
    if (map['status'] == "dispatch") {
      _currentStep = 1;
      print("$_currentStep  ${map['status']}");
    } else if (map['status'] == "out_of_delivery") {
      _currentStep = 2;
      print("$_currentStep  ${map['status']}");
    } else {
      _currentStep = 0;
      print("$_currentStep  ${map['status']}");
    }
    print(map['status']); // ✅ dispatch

    return Scaffold(
      backgroundColor: AppColors.backGroundColor,
      resizeToAvoidBottomInset: false,
      appBar: CommonWidgets.appBar(title: StringConstants.myOrdersStatus),
      body: SafeArea(
        child: Stepper(
          type: StepperType.vertical,
          currentStep: _currentStep,

          steps: [
            Step(
              title: Text("Shipping", style: AppTextStyle.titleStyle16bw),
              content: Text(
                "Your order has been shipped from the warehouse.",
                style: AppTextStyle.titleStyle14gr,
              ),
              isActive: _currentStep >= 0,
              state: _currentStep > 0 ? StepState.complete : StepState.indexed,
            ),
            Step(
              title: Text("Dispatch", style: AppTextStyle.titleStyle16bw),
              content: Text(
                "Your order is dispatched and on the way.",
                style: AppTextStyle.titleStyle14gr,
              ),
              isActive: _currentStep >= 1,
              state: _currentStep > 1 ? StepState.complete : StepState.indexed,
            ),
            Step(
              title: Text(
                "Out of Delivery",
                style: AppTextStyle.titleStyle16bw,
              ),
              content: Text(
                "Your order is out for delivery and will arrive soon.",
                style: AppTextStyle.titleStyle14gr,
              ),
              isActive: _currentStep >= 2,
              state: _currentStep == 2 ? StepState.complete : StepState.indexed,
            ),
          ],
        ),
      ),
    );
  }
}
