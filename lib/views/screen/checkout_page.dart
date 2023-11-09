import 'package:e_commerce_app/controller/checkout_controller.dart';
import 'package:e_commerce_app/core/class/handle_data.dart';
import 'package:e_commerce_app/core/constant/color.dart';
import 'package:e_commerce_app/core/constant/image_asset.dart';
import 'package:e_commerce_app/core/constant/styles.dart';
import 'package:e_commerce_app/core/shared/custom_bottom.dart';
import 'package:e_commerce_app/views/address/address_add.dart';
import 'package:e_commerce_app/views/widget/cart/custom_cart_bottom.dart';
import 'package:e_commerce_app/views/widget/checkout/card_adress.dart';
import 'package:e_commerce_app/views/widget/checkout/card_dalivery_type.dart';
import 'package:e_commerce_app/views/widget/checkout/card_payment_method.dart';
import 'package:e_commerce_app/core/shared/payment_method_listview.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CheckOut extends StatelessWidget {
  const CheckOut({super.key});
  static const checkOutid = "/checkOutid";
  @override
  Widget build(BuildContext context) {
    CheckoutControllerImp contrller = Get.put(CheckoutControllerImp());
    return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.black),
          title: Text("Checkout", style: Styles.style25),
          backgroundColor: Colors.grey[50],
        ),
        bottomNavigationBar: CustomCartBottom(
          text: "Checkout",
          onPressed: () {
            contrller.cheackout();

           
          },
        ),
        body: GetBuilder<CheckoutControllerImp>(
          builder: (controller) => HandlingDataView(
              statusRequs: contrller.statusRequs,
              widget: Container(
                  padding: const EdgeInsets.all(20),
                  child: ListView(
                    children: [
                      Text(
                        "Chouse Payment Method",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: ColorApp.secondColor),
                      ),
                      InkWell(
                          onTap: () {
                            contrller.chousePaymentMethod("0"); //cash
                          },
                          child: CardPaymentMethod(
                              text: "Cash On Delivery",
                              isActive: contrller.paymentMethod == "0"
                                  ? true
                                  : false)),
                      InkWell(
                        onTap: () {
                          contrller.chousePaymentMethod("1"); //card
                        },
                        child: CardPaymentMethod(
                            text: "Payment Card",
                            isActive:
                                contrller.paymentMethod == "1" ? true : false),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Chouse Delivery type",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: ColorApp.secondColor),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          InkWell(
                            onTap: () {
                              contrller.chouseDeliveryType("0"); //0 =>delivery
                            },
                            child: CardDeliveryType(
                                imageNmae: ImageAsset.delivry,
                                title: "Delivery",
                                isActive: contrller.deliveryType == "0"
                                    ? true
                                    : false),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          InkWell(
                            onTap: () {
                              contrller.chouseDeliveryType("1"); // 1 =>recive
                            },
                            child: CardDeliveryType(
                                imageNmae: ImageAsset.delivreytThru,
                                title: "Drive Thru",
                                isActive: contrller.deliveryType == "1"
                                    ? true
                                    : false),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      if (contrller.deliveryType == "0")
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            if (contrller.dataAdress.isNotEmpty)
                              Text(
                                "Shipping Adress",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                    color: ColorApp.secondColor),
                              ),
                            SizedBox(
                              height: 10,
                            ),
                            if (contrller.dataAdress.isEmpty)
                              InkWell(
                                onTap: () {
                                  Get.toNamed(AddressAdd.addressAddid);
                                },
                                child: Container(
                                  child: Center(
                                      child: Text(
                                    "please Add shiping Asress \n click here",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: ColorApp.KPrimaryColor,
                                        fontWeight: FontWeight.bold),
                                  )),
                                ),
                              ),
                            ...List.generate(
                              contrller.dataAdress.length,
                              (index) => InkWell(
                                onTap: () {
                                  contrller.chouseAddressid(
                                      contrller.dataAdress[index].addressid);
                                },
                                child: CardAdress(
                                    title: contrller.dataAdress[index].name,
                                    body:
                                        "${contrller.dataAdress[index].city}  ${contrller.dataAdress[index].street}",
                                    isActive: contrller.addressid ==
                                            contrller
                                                .dataAdress[index].addressid
                                        ? true
                                        : false),
                              ),
                            )
                          ],
                        )
                    ],
                  ))),
        ));
  }
}
