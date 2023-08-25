import 'package:e_commerce_app/core/class/api.dart';
import 'package:e_commerce_app/link_api.dart';
class ResetPasswordData
{
  
  postData({
   required String password ,
   required String email ,
 })async{
    var res =await Api().post(uri: linkResetePass, body: {
      "password": password ,
      "email": email ,
      
    });
    return res;
  }
}