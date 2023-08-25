import 'package:e_commerce_app/core/class/api.dart';
import 'package:e_commerce_app/link_api.dart';
class SignupData 
{

  postData({required String name ,
  required String email ,
  required String phone,required String password})async{
    var res =await Api().post(uri: linkSignup, body: {
      "name": name,
      "email": email ,
      "phone": phone,
      "password": password,
    });
    return res;
  }
}