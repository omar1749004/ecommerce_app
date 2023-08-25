import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../../controller/auth/success_signup_controller.dart';
import '../../../../core/constant/color.dart';
import '../../../widget/auth/costome_text_title.dart';
import '../../../widget/auth/custome_bottone_auth.dart';

class SuccessResetPass
 extends StatelessWidget {
   const SuccessResetPass ({super.key});
   static final String successResetId = "/successResetId";
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
        padding: EdgeInsets.all(15),
        child: Column(
          
          children: [
            
          Center(child: Icon(Icons.check_circle_outline,size: 200,color: ColorApp.KPrimaryColor,)),
         CustomeTitleAuth(title: "congratulations",),
          SizedBox(height: 10,),
          Text( "Password has been reset successfully",style: TextStyle(color: ColorApp.gray),),
          Spacer(),
          Container(
            width: double.infinity,
            child: CustomBottoneAuth(text: "Go To Login", ontap:() {controller.gotologin();},)),
            SizedBox(height: 30,)
        ],),
      ),
    );
  }
}