import 'package:e_commerce_app/core/class/api.dart';
import 'package:e_commerce_app/link_api.dart';
class CheckEmail
{

  postData({
  required String email ,
 })async{
    var res =await Api().post(uri: linkCheckEmail, body: {
      "email": email ,
      
    });
    return res;
  }
}