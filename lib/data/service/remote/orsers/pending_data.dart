import 'package:e_commerce_app/core/class/api.dart';
import 'package:e_commerce_app/link_api.dart';

class PendingOrdersData 
{
 
  PendingOrdersData();
  getData(String id)async{
    var res =await Api().post(uri: linkPendingOrder, body: {
      "id" :id
    });
    return res;
  }
  deleteData(String orderid)async{
    var res =await Api().post(uri: linkDeleteOrder, body: {
      "id" :orderid
    });
    return res;
  }
}