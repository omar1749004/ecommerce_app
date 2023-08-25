import 'package:e_commerce_app/core/class/api.dart';
import 'package:e_commerce_app/link_api.dart';

class TestData 
{
  Api api ;
  TestData(this.api);


  getData()async{
    var res =await api.post(uri: linkReadData, body: {});
    return res;
  }
}