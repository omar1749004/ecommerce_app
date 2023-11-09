
import 'package:e_commerce_app/core/constant/styles.dart';
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
                      OrderInfoItem(text: "Price", value: price),
                     OrderInfoItem(text: "Discound", value: discound),
                     OrderInfoItem(text: "Shiping", value: "30"),
                 
                 const Divider(color: Colors.black,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                  const  Padding(
                      padding:  EdgeInsets.symmetric(horizontal: 20),
                      child: Text("Total Price",style: Styles.style18),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Text('$totalPrice \$',style: Styles.style18),
                    )
                  ],),
                    ]),
                  ),
                
                 const SizedBox(height: 10,),
                  CustomCartBottom(text: "Order",onPressed: onPressed,),
                ],
              ),
            );
      
  }
}
//"discound"
class OrderInfoItem extends StatelessWidget {
  const OrderInfoItem({super.key, required this.text, required this.value});
final String text ,value;

  @override
  Widget build(BuildContext context) {
    return  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 5),
                      child: Text(text,style:const TextStyle(fontSize: 16)),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Text('$value\$',style:const TextStyle(fontSize: 16)),
                    )
                  ],);
  }
}