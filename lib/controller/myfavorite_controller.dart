import 'package:e_commerce_app/core/services/services.dart';
import 'package:e_commerce_app/data/models/myfavorite_model.dart';
import 'package:e_commerce_app/data/service/remote/myfavorite_data.dart';
import 'package:get/get.dart';
import '../core/class/statuscode.dart';
import '../core/functions/checkinternet.dart';



abstract class MyFavoritController extends GetxController
{
   initialData();

   getItems();

}
class MyFavoritControllerImp extends MyFavoritController 
{
  List categories = [];
  int? selectCar;
  String? categoriyId;
   late StatusRequst statusRequs;
   List<MyFavoriteModel> items =[];
  MyServices myServices =Get.find();

@override
  void onInit() {
    initialData();
    
    super.onInit();
  }
   @override
  initialData() {
    
   
   getItems();

  }

  
  getItems() async{
     statusRequs = StatusRequst.loading;
      update();
      
  if(await checkinternet() )
  {   
    
     var res = await MyFavoriteData().getData(
      myServices.sharedPreferences.getString("id")!);
    
      if(res == null)
      {
        
        statusRequs = StatusRequst.failure;
        
      }
     else if(res["status"] =="success")
     {

      for(int i =0;i< res["data"].length;i++)
      {
           items.add(MyFavoriteModel.fromjsone(res["data"][i]) );
      }
      
      statusRequs =StatusRequst.sucsess;

     }else{
      
      statusRequs = StatusRequst.failure;
     }  
    }
   update(); 
  }
  deletData(String favId)  {
   
    
     var res =  MyFavoriteData().deleteFavorite(
      favId
     );
    
      if(res == null)
      {
        statusRequs = StatusRequst.failure;
        
      }
     else 
     {
 
      items.removeWhere((element) => element.favorite_id.toString() == favId);
      
      statusRequs =StatusRequst.sucsess;

     }
    
       update(); 
  }
}
