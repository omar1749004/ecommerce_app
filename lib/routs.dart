import 'package:e_commerce_app/views/address/address_add.dart';
import 'package:e_commerce_app/views/address/address_add_details.dart';
import 'package:e_commerce_app/views/address/view.dart';
import 'package:e_commerce_app/views/screen/auth/fogetpassword/check_email.dart';
import 'package:e_commerce_app/views/screen/auth/login_page.dart';
import 'package:e_commerce_app/views/screen/auth/fogetpassword/reset_pass.dart';
import 'package:e_commerce_app/views/screen/auth/signup_page.dart';
import 'package:e_commerce_app/views/screen/auth/succes_signup.dart';
import 'package:e_commerce_app/views/screen/auth/fogetpassword/sucsess_reset.dart';
import 'package:e_commerce_app/views/screen/auth/fogetpassword/verfy_code.dart';
import 'package:e_commerce_app/views/screen/auth/vrefycode_signup.dart';
import 'package:e_commerce_app/views/screen/cart_page.dart';
import 'package:e_commerce_app/views/screen/checkout_page.dart';
import 'package:e_commerce_app/views/screen/home.dart';
import 'package:e_commerce_app/views/screen/home_screen.dart';
import 'package:e_commerce_app/views/screen/item.dart';
import 'package:e_commerce_app/views/screen/language.dart';
import 'package:e_commerce_app/views/screen/myfavorite.dart';
import 'package:e_commerce_app/views/screen/notifi_page.dart';
import 'package:e_commerce_app/views/screen/onboarding.dart';
import 'package:e_commerce_app/views/screen/orders/archive.dart';
import 'package:e_commerce_app/views/screen/orders/details.dart';
import 'package:e_commerce_app/views/screen/orders/pending.dart';
import 'package:e_commerce_app/views/screen/payment_details.dart';
import 'package:e_commerce_app/views/screen/product_details.dart';
import 'package:e_commerce_app/views/screen/success_payment.dart';

import 'package:get/get.dart';

import 'core/middleware/mymiddleware.dart';

List<GetPage<dynamic>>? routss = [
 GetPage(name: "/", page: ()=> const LanguagePage(),
 middlewares: [MyMiddleWare()] 
  ),
  //auth
  GetPage(name: LoginPage.loginId, page: ()=>const LoginPage()),
  GetPage(name: OnBoarding.onboardingId, page:()=> const OnBoarding()),
 GetPage(name: SignUp.signUpId, page: ()=>const SignUp()),
 GetPage(name: CheckEmail.checkEmailId, page: ()=>const CheckEmail()),
 GetPage(name: Verfycode.verfyid, page: ()=>const Verfycode()),
 GetPage(name: ResetPass.resetId, page: ()=>const ResetPass()),
 GetPage(name: SuccessResetPass.successResetId, page: ()=>const SuccessResetPass()),
 GetPage(name: SuccessSignUp.successSignUpId, page: ()=>const SuccessSignUp()),
 GetPage(name: VeryfyCodeSignUp.veryfyCodeSignUpId, page: ()=>const VeryfyCodeSignUp()),

 //home
GetPage(name: HomePage.homepageId, page: ()=>const HomeScreen()),
//product
GetPage(name: Items.itemsId, page: ()=> const Items()),
//product details
GetPage(name: ProductDetails.productDetailsId, page: ()=> const ProductDetails()),
//my favorite
GetPage(name: MyFavorite.myFavoriteId, page: ()=> const MyFavorite()),
//cart
GetPage(name: Cart.cartId, page: ()=> const Cart()),
//address
GetPage(name: AddressView.addressViewid, page: ()=> const AddressView()),
GetPage(name: AddressAdd.addressAddid, page: ()=> const AddressAdd()),
GetPage(name: AdressAddDetails.adressAddDetailsid, page: ()=> const AdressAddDetails()),
//checkout
GetPage(name: CheckOut.checkOutid, page: ()=> const CheckOut()),
GetPage(name: PaymentDatails.paymentDatailsId, page: ()=> const PaymentDatails()),
GetPage(name: SuccessPayment.successPaymentId, page: ()=> const SuccessPayment()),
//orders 
GetPage(name: OrdersPending.ordersPendingid, page: ()=> const OrdersPending()),
GetPage(name: OrderDetails.orderDetailsid, page: ()=> const OrderDetails()),
GetPage(name: OrdersArchive.ordersArchiveid, page: ()=> const OrdersArchive()),

//notification
GetPage(name: NotificationPage.notificationId, page: ()=> const NotificationPage()),
// offer page

  


];

// Map<String, Widget Function(BuildContext)> routs ={
   
//    //onBording
//    OnBoarding.onboardingId :(context) => OnBoarding(),
   
//   //auth
//   LoginPage.loginId : (context) =>LoginPage(),
//   SignUp.signUpId:(context)=>SignUp(),
   
//    ForgetPass.forgetpassId : (context)=>ForgetPass(),
//    Verfycode.verfyid : (context)=>Verfycode(),
//    ResetPass.resetId: (context)=>ResetPass(),
//    SuccessResetPass.successResetId:(context)=>SuccessResetPass(),
//    SuccessSignUp.successSignUpId:(context)=>SuccessSignUp(),
//    VeryfyCodeSignUp.veryfyCodeSignUpId:(context) => VeryfyCodeSignUp()
   
// };