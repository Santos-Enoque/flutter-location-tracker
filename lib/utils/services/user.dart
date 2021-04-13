import 'package:cadevo/constants/firebase.dart';

class UserServices {
  String collection = "users";

  void createUser({
    String id,
    String name,
    String email,
  }) {

  }

  void updateUserData(Map<String, dynamic> values) {
    firebaseFirestore.collection(collection).doc(values['id']).update(values);
  }


}