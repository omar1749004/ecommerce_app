import 'package:e_commerce_app/core/class/api.dart';
import 'package:e_commerce_app/link_api.dart';

class FavoritData 
{

  addFavorite(String itemsId ,String userid)async{
    
    var res =await Api().post(uri: linkAddFavorite, body: {"favorite_itemid":itemsId ,"userid" : userid});
    
    return res;
  }
  deleteFavorite(String itemsId ,String userid)async{
    var res =await Api().post(uri: linkRemoveFavorite, body: {"favorite_itemid":itemsId ,"userid" : userid});
    return res;
  }
  
}