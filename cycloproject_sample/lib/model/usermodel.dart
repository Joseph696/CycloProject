import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  String? id, email, Username;
  UserModel({this.email, this.Username, this.id});
  factory UserModel.fromMap(DocumentSnapshot map) {
    return UserModel(
        email: map["email"], Username: map["username"], id: map.id);
  }
  Map<String, dynamic> toMap() {
    return {//"id": id,
     "email": email, "username": Username};
  }
}
