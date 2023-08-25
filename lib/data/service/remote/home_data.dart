import 'package:e_commerce_app/core/class/api.dart';
import 'package:e_commerce_app/link_api.dart';

class HomeData 
{

  getData()async{
    var res =await Api().post(uri: linkHomePage, body: {});
    return res;
  }
  searchData(String search)async{
    var res =await Api().post(uri: linkSearch, body: {
      "search" : search
    });
    return res;
  }
}