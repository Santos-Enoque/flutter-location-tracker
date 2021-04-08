import 'package:cadevo/constants/firebase.dart';
import 'package:cadevo/models/user.dart';

class UserServices {
  String collection = "users";

  void createUser({
    String id,
    String name,
    String email,
  }) {
    firebaseFirestore
        .collection(collection)
        .doc(id)
        .set({"name": name, "id": id, "email": email, "status": "pending"});
  }

  void updateUserData(Map<String, dynamic> values) {
    firebaseFirestore.collection(collection).doc(values['id']).update(values);
  }

  Future<UserModel> getUserById(String id) =>
      firebaseFirestore.collection(collection).doc(id).get().then((doc) {
        return UserModel.fromSnapshot(doc);
      });
}