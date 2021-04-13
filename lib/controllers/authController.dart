import 'package:cadevo/screens/authentication/auth.dart';
import 'package:cadevo/screens/home/home.dart';
import 'package:get/get.dart';

class AuthController extends GetxController{
  static AuthController instance = Get.find();
  RxBool isLoggedIn = false.obs;

  @override
  void onReady(){
    super.onReady();
    _setInitialScreen();
  }
  
  _setInitialScreen(){
   if(!isLoggedIn.value){
        Get.offAll(() => AuthenticationScreen());
      }else{
     Get.offAll(() => HomeScreen());
      }
  }
}
