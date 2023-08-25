import 'package:e_commerce_app/core/class/api.dart';
import 'package:e_commerce_app/link_api.dart';

class CartData 
{

  addCart(String itemsId ,String userid)async{
    
    var res =await Api().post
    (uri: linkAddCart, body: {"itemid":itemsId ,"userid" : userid});
    
    return res;
  }
  deleteCart(String itemsId ,String userid)async{
    var res =await Api().post(
      uri: linkDeleteCart, body: {"itemid":itemsId ,"userid" : userid});
    return res;
  }
  getCountCart(String itemsId ,String userid)async{
    var res =await Api().post(
      uri: linkGetCountCart, body: {"itemid":itemsId ,"userid" : userid});
    return res;
  }
  
  viewCart(String userid)async{
    
    var res =await Api().post
    (uri: linkViewCart, body: {"userid" : userid});
    
    return res;
  }
  checkCoupon(String couponNme)async{
    
    var res =await Api().post
    (uri: linkCheckCoupon, body: {"couponName" : couponNme});
    
    return res;
  }
  
}