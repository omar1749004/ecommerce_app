import 'package:e_commerce_app/core/class/api.dart';
import 'package:e_commerce_app/link_api.dart';

class NotifyData 
{

  getData(String userid)async{
    var res =await Api().post(uri: linkNotifi, body: {"id" : userid});
    return res;
  }

}