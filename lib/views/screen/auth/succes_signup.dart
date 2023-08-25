import 'package:e_commerce_app/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/auth/success_signup_controller.dart';
import '../../widget/auth/costome_text_title.dart';
import '../../widget/auth/custome_bottone_auth.dart';

class SuccessSignUp extends StatelessWidget {
  const SuccessSignUp({super.key});
  static final String successSignUpId = "/successSignUpId";
  @override
  Widget build(BuildContext context) {
    SuccessSignupControllerImp controller =Get.put(SuccessSignupControllerImp());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        elevation: 0.0,
        title: Text("Success",style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 20,
              color: Color.fromARGB(255, 94, 89, 89)
             ),),
        automaticallyImplyLeading: true,
      ),
      body: Container(
        padding: EdgeInsets.only(top: 100),
        child: Column(
          
          children: [
            
          Center(child: Icon(Icons.check_circle_outline,size: 200,color: ColorApp.KPrimaryColor,)),
          SizedBox(height: 20,),
          CustomeTitleAuth(title: "congratulations",),
          SizedBox(height: 10,),
          Text( "successfully registered",style: TextStyle(color: ColorApp.gray),),
          Spacer(),
          Container(
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18),
              child: CustomBottoneAuth(text: "Go To Login", ontap:() {controller.gotologin();},),
            )),
            SizedBox(height: 30,)
        ],),
      ),
    );
  }
}