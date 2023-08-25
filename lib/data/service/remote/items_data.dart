import 'package:e_commerce_app/core/class/api.dart';
import 'package:e_commerce_app/link_api.dart';

class ItemsData 
{

  getData(String id ,String userid)async{
    var res =await Api().post(uri: linkItemPage, body: {"id":id ,"userid" : userid});
    return res;
  }
}