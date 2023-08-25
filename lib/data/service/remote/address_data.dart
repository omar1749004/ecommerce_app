import 'package:e_commerce_app/core/class/api.dart';
import 'package:e_commerce_app/link_api.dart';

class AddressData 
{

  addadress(String userid ,
  String name,
  String city,
  String street
  ,String lat,
  String long, )async{
    
    var res =await Api().post
    (uri: linkAddressAdd, body: {
      "userid" : userid,
      "name" : name,
      "city" : city,
      "street" : street,
      "lat" : lat,
      "long" : long,


      });
    
    return res;
  }
  getadress(String userid)async{
    
    var res =await Api().post
    (uri: linkAddressView, body: {"userid" : userid});
    
    return res;
  }
  deleteadress(String addressid )async{
    var res =await Api().post(
      uri: linkAddressDelete, body: {"address_id" : addressid});
    return res;
  }
}