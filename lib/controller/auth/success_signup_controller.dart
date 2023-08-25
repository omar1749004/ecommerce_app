
import 'package:e_commerce_app/views/screen/auth/login_page.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';




abstract class SuccessSignupController extends GetxController
{
  
  gotologin();
}
class SuccessSignupControllerImp extends SuccessSignupController
{
  @override
  gotologin() {
    Get.offAllNamed(LoginPage.loginId);
  }

 

 

}