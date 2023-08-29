import 'package:e_commerce_app/core/class/api.dart';
import 'package:e_commerce_app/link_api.dart';

class OffersData 
{

  getData(String id)async{
    var res =await Api().post(uri: linkOffer, body: {
      "id" :id
    });
    return res;
  }

}