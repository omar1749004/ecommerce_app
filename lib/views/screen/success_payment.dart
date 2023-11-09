import 'package:e_commerce_app/core/constant/styles.dart';
import 'package:e_commerce_app/core/shared/dash_line.dart';
import 'package:e_commerce_app/views/widget/thank_you/custom_check_icon.dart';
import 'package:e_commerce_app/views/widget/thank_you/thank_you_card.dart';
import 'package:flutter/material.dart';

class SuccessPayment extends StatelessWidget {
  const SuccessPayment({super.key});
  static String successPaymentId = "/successPaymentId";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black ,size: 30),
        title: const Text("", style: Styles.style25),
        backgroundColor: Colors.transparent,
      ),
      body: Transform.translate(
        offset:const Offset(0 , -16),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              ThankyouCard(),
      
              Positioned(
               bottom: MediaQuery.sizeOf(context).height * .225,
               left: 5,
                child:const DashLisne(),
              ),
              Positioned(
                bottom: MediaQuery.sizeOf(context).height * .2,
                left: -20,
                child: CircleAvatar(backgroundColor: Colors.white,)),
                Positioned(
                bottom: MediaQuery.sizeOf(context).height * .2,
                right: -20,
                child: CircleAvatar(backgroundColor: Colors.white,)),
                Positioned(
               left: 0,
               right: 0,
               top: -50,
                child: CustomCheckIcon()),
            ],
          ),
        ),
      ),
    );
  }
}

