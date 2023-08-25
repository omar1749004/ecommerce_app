import 'package:e_commerce_app/core/class/api.dart';
import 'package:e_commerce_app/link_api.dart';

class CheckoutData 
{

  checkout(Map data)async{
    
    var res =await Api().post
    (uri: linkCheckout, body: data);
    
    return res;
  }
}