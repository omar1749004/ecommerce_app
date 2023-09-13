
import 'package:e_commerce_app/controller/cart_controller.dart';
import 'package:e_commerce_app/core/class/handle_data.dart';
import 'package:e_commerce_app/core/constant/color.dart';
import 'package:e_commerce_app/views/widget/cart/custom_cottom_coupon.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../widget/cart/custom_item_card.dart';
import '../widget/cart/cutom_bottom_navigationbar_cart.dart';
import '../widget/cart/top_cart.dart';

class Cart extends StatelessWidget {
  const Cart({super.key});
  static const String cartId = "/cartId";
  @override
  Widget build(BuildContext context) {
    Get.put(CartControllerImp());
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        title: Text("My Cart",
        style: TextStyle(
          color: Colors.black,
          fontSize: 25, fontWeight: FontWeight.w700),),
        backgroundColor: Colors.grey[50],
      ),
      bottomNavigationBar:GetBuilder<CartControllerImp>(builder: (controller) =>
       CustomNavigationBar(
        onPressed: (){controller.gotoPagecheckout();},
        shiping: "30",
        price: controller.totalprice,
        discound: "${controller.discoundCoupon}",
        totalPrice: "${controller.gettotalPrice()}",),),
      body:  Padding(
        padding: const EdgeInsets.symmetric(vertical:5),
        child: Column(
          children: [
               GetBuilder<CartControllerImp>(builder: (controller) => HandlingDataView(
        statusRequs: controller.statusRequs, widget:
            Expanded(
              child: ListView(
                padding: EdgeInsets.only(top: 10,),
                children: [
                 
               TopCart(count: int.parse(controller.totalcount),),
             
                  
                  ...List.generate(controller.items.length, (index) =>
                    CustomItemCard(
                      itemsCount:  controller.items[index].itemsCount,
                      add: ()async{
                       await controller.add(controller.items[index].itemId.toString());
                       controller.refresgPage();
                      },
                      delete: ()async{
                       await controller.delete(controller.items[index].itemId.toString());
                         controller.refresgPage();
                      },
                      cartmodel: controller.items[index],)),
                      
                       Container(
                      
                          padding: EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                          child: controller.couponName ==null ? Row(
                            children: [
                            Expanded(
                              flex: 3,
                              child: TextFormField(
                                
                                controller: controller.coupon!,
                                decoration:const InputDecoration(
                                  
                                  hintText: "Coupon Code",
                                  hintStyle: TextStyle(),
                                  isDense: true,
                                  contentPadding: EdgeInsets.symmetric(vertical:6,horizontal: 5),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.zero
                                  )
                                ),
                              )),
                             // SizedBox(width: 5,),
                            Expanded(
                              flex: 1,
                              child: CustomBottomCoupon(text: "apply",
                              onPressed: (){
                                controller.checkCoupon();
                              },))
                          ],) : Text("Coupon Code ${controller.couponName!}",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: ColorApp.KPrimaryColor),
                          )
                            ),     
                ]
                  ),
            )) ),
          ],
        ),
      ),);
    
  }
}
