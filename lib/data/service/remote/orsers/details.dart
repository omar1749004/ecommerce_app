import 'package:e_commerce_app/core/class/api.dart';
import 'package:e_commerce_app/link_api.dart';

class DetailsOrdersData 
{
 
  DetailsOrdersData();
  getData(String id)async{
    var res =await Api().post(uri: linkDetailsOrder, body: {
      "id" :id
    });
    return res;
  }
}