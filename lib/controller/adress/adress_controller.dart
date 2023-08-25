
import 'package:e_commerce_app/core/class/statuscode.dart';
import 'package:e_commerce_app/views/address/address_add_details.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:open_street_map_search_and_pick/open_street_map_search_and_pick.dart';

abstract class AdressController extends GetxController
{

}
class AdressControllerImp extends AdressController
{
  StatusRequst statusRequst =StatusRequst.loading;
   Position? position;
  List<Marker> marker = [];
  double? lat;
  double? long;
   LatLong latLong =LatLong(30.174446890728998, 31.17310522602764);

  void savelocation(PickedData pickedData) {
        lat =pickedData.latLong.latitude;
        long =pickedData.latLong.longitude;
        Get.toNamed(AdressAddDetails.adressAddDetailsid,arguments: {
          "lat" : lat.toString(),
          "long":long.toString()
        });
   }

   getCurrentLocation()async{
     position =await  Geolocator.getCurrentPosition();
     
     if(position != null)
     {
      latLong =LatLong(position!.latitude,position!.longitude);
     statusRequst =StatusRequst.non;
     update();
     return  
     await LatLng(position!.latitude,position!.longitude);
     }
    
  }


      @override
  void onInit() {
     getCurrentLocation();
     super.onInit();
  }
}
 //  Completer<GoogleMapController>? completerController ;

  //     CameraPosition kGooglePlex = CameraPosition(
  //   target: LatLng(37.42796133580664, -122.085749655962),
  //   zoom: 14.4746,
  // );

  // static const CameraPosition kLake = CameraPosition(
  //     bearing: 192.8334901395799,
  //     target: LatLng(37.43296265331129, -122.08832357078792),
  //     tilt: 59.440717697143555,
  //     zoom: 19.151926040649414);