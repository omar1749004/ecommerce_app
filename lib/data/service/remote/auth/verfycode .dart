import 'package:e_commerce_app/core/class/api.dart';
import 'package:e_commerce_app/link_api.dart';
class VerfyCodeData
{

  postData({
  required String email ,
  required String verfycode
 })async{
    var res =await Api().post(uri: linkVerfycode, body: {
      "email": email ,
      "verfycode": verfycode,
      
    });
    return res;
  }
  resendData({required String email })async
  {
     await Api().post(uri: linkResend, body: {
      "email": email ,});
    
  }
}