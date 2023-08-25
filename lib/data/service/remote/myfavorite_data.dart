import 'package:e_commerce_app/core/class/api.dart';
import 'package:e_commerce_app/link_api.dart';

class MyFavoriteData 
{

  getData(String userid)async{
    var res =await Api().post(uri: linkMyfavorite, body: {"id" : userid});
    return res;
  }
  deleteFavorite(String favoriteId)async{
    var res =await Api().post(uri: linkremoveFromMyfav, body: {"favorite_id" : favoriteId});
    return res;
  }

}