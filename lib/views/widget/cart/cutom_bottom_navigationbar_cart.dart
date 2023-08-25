
import 'package:flutter/material.dart';

import '../../../core/constant/color.dart';
import 'custom_cart_bottom.dart';

class CustomNavigationBar extends StatelessWidget {
  const CustomNavigationBar({super.key,
   required this.price,
   required this.discound,
   required this.totalPrice, 
   required this.shiping,required this.onPressed,

});
  final String price;
  final String discound;
  final String totalPrice;
  final String shiping;
  final Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return  Container(
      
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [

                  Container(
                    margin: EdgeInsets.symmetric(horizontal:10 ),
                    padding: EdgeInsets.symmetric(vertical: 10),
                    decoration: BoxDecoration(
                      border: Border.all(color: ColorApp.KPrimaryColor,width: 2),
                      borderRadius: BorderRadius.circular(8)
                       ),
                    child: Column(children: [
                      Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 5),
                      child: Text("price",style: TextStyle(fontSize: 16)),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Text('$price \$',style: TextStyle(fontSize: 16)),
                    )
                  ],),
                   Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 5),
                      child: Text("discound",style: TextStyle(fontSize: 16)),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Text('$discound %',style: TextStyle(fontSize: 16)),
                    )
                  ],),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 5),
                      child: Text("Shiping",style: TextStyle(fontSize: 16)),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Text('$shiping \$',style: TextStyle(fontSize: 16)),
                    )
                  ],),
                  Divider(color: Colors.black,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Text("Total Price",style: TextStyle(
                        fontSize: 16,fontWeight: FontWeight.bold,
                        color: ColorApp.KPrimaryColor)),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Text('$totalPrice \$',style: TextStyle(
                        fontSize: 16,fontWeight: FontWeight.bold,
                        color: ColorApp.KPrimaryColor)),
                    )
                  ],),
                    ]),
                  ),
                
                  SizedBox(height: 10,),
                  CustomCartBottom(text: "Order",onPressed: onPressed,),
                ],
              ),
            );
      
  }
}