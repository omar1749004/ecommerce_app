import 'package:e_commerce_app/core/class/api.dart';
import 'package:e_commerce_app/link_api.dart';
class VerfyCodeForgetData
{

  postData({
  required String email ,
  required String verfycode
 })async{
    var res =await Api().post(uri: linkFVryfycode, body: {
      "email": email ,
      "verfycode": verfycode,
      
    });
    return res;
  }
}