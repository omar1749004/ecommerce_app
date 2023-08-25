import 'package:e_commerce_app/core/class/statuscode.dart';
import 'package:e_commerce_app/core/functions/checkinternet.dart';
import 'package:e_commerce_app/core/services/services.dart';
import 'package:e_commerce_app/data/models/addres_model.dart';
import 'package:e_commerce_app/data/service/remote/address_data.dart';
import 'package:get/get.dart';

abstract class AdressViewController extends GetxController
{

}
class AdressViewControllerImp extends AdressViewController
{
  StatusRequst statusRequs =StatusRequst.non ;
    List<AddresModels> data =[];
    MyServices myServices  =Get.find();
    deleteAddress(int addressid){
      AddressData().deleteadress(addressid.toString());
      data.removeWhere((element) => element.addressid ==addressid );
      update();
    }
  view() async{
    
     statusRequs = StatusRequst.loading;
      update();
      
  if(await checkinternet() )
  {   
    
     var res = await AddressData().getadress(
      myServices.sharedPreferences.getString("id")!);
    
      if(res == null)
      {
        
        statusRequs = StatusRequst.failure;
        
      }
     else if(res["status"] =="success")
     {
       
      for(int i =0;i< res["data"].length;i++)
      {
           data.add(AddresModels.fromjsone(res["data"][i]) );
      }
   
      statusRequs =StatusRequst.sucsess;
      
     }else{
      
      statusRequs = StatusRequst.failure;
     }  
    }
   update(); 
  
  }

  @override
  void onInit() {
    view();
    super.onInit();
  }
}