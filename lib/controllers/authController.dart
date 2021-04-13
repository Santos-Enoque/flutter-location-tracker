import 'package:cadevo/constants/firebase.dart';
import 'package:cadevo/models/user.dart';
import 'package:cadevo/screens/authentication/auth.dart';
import 'package:cadevo/screens/home/home.dart';
import 'package:cadevo/utils/helpers/loading.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthController extends GetxController{
  static AuthController instance = Get.find();
  FirebaseAuth _auth = FirebaseAuth.instance;
  Rx<User> firebaseUser;
  var userModel = UserModel().obs;
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  final String userCollection = "users";


  @override
  void onReady() {
    super.onReady();
    firebaseUser = Rx<User>(_auth.currentUser);
    firebaseUser.bindStream(_auth.userChanges());
    ever(firebaseUser,_setInitialScreen);
  }

  _setInitialScreen(User user){
   if(user == null){
        Get.offAll(() => AuthenticationScreen());
      }else{
     Get.offAll(() => HomeScreen());
      }
  }

  singIn()async{
    try{
      showLoadingWidget();
      _auth.signInWithEmailAndPassword(email: email.text.trim(), password: password.text.trim());
      dismissLoadingWidget();
    }catch(e){
      dismissLoadingWidget();
      debugPrint(e.message);
      Get.snackbar("Sign in failed", "check your credentials");
    }
  }

  signUp()async{
      try{
      showLoadingWidget();
      _auth.createUserWithEmailAndPassword(email: email.text.trim(), password: password.text.trim()).then((result)async{
        String _userId = result.user.uid;
            firebaseFirestore
        .collection(userCollection)
        .doc(result.user.uid)
        .set({"name": name.text.trim(), "id": _userId, "email": email.text.trim(),});
      userModel.value = await getUserById(_userId);

      });
      dismissLoadingWidget();
    }catch(e){
      dismissLoadingWidget();
      debugPrint(e.message);
      Get.snackbar("Sign up failed", e.message, snackPosition: SnackPosition.BOTTOM);
    }
  }

  signOut()async{
      _auth.signOut();
  }

    Future<UserModel> getUserById(String id) =>
      firebaseFirestore.collection(userCollection).doc(id).get().then((doc) {
        return UserModel.fromSnapshot(doc);
      });
}
