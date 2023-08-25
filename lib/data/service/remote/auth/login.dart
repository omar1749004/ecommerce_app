import 'package:e_commerce_app/core/class/api.dart';
import 'package:e_commerce_app/link_api.dart';
class LoginData
{

  postData({required String email ,
  required String password ,
  })async{
    var res =await Api().post(uri: linkLogin, body: {
      "email": email ,
      "password": password,
    });
    return res;
  }
}