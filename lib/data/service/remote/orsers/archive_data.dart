import 'package:e_commerce_app/core/class/api.dart';
import 'package:e_commerce_app/link_api.dart';

class AchiveOrdersData 
{
 
  AchiveOrdersData();
  getData(String id)async{
    var res =await Api().post(uri: linkArchiveOrder, body: {
      "id" :id
    });
    return res;
  }
  rating(String orderid ,String rating, String ratingNote)async{
    var res =await Api().post(uri: linkRatingOrder, body: {
      "orderid" :orderid ,
      "rating" : rating ,
      "ratingNote" :ratingNote
    });
    return res;
  }
}