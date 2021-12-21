import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mentor_codetivate_hackathon/Models/user_data.dart';

class FireStore {
  ///create a CollectionRefrence called  _user that refereces the firestore collection
  final CollectionReference _user =
      FirebaseFirestore.instance.collection('user');

  ///create a CollectionRefrence called  _user that refereces the firestore collection
  final CollectionReference _program =
      FirebaseFirestore.instance.collection('program');

  Future<void> createNewUser(UserModel data, String uid) {
    return _user
        .doc(uid)
        .set({
          "email": data.email,
        })
        // ignore: avoid_print
        .then((value) => print("User added"))
        // ignore: avoid_print
        .catchError((error) => print("Failed: $error"));
  }

  Future<void> updateUser(UserModel data) {
    return _user
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .update({
          "email": data.email,
          "name": data.name,
          "image": data.image,
        })
        // ignore: avoid_print
        .then((value) => print("User updated"))
        // ignore: avoid_print
        .catchError((error) => print("Failed: $error"));
  }



  ///Register a new user
  Future signUpMemberWithEmailAndPassword(String email, String password) async {
    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      // ignore: avoid_print
      print(e.code);
    } catch (e) {
      // ignore: avoid_print
      print(e);
    }
  }

  ///Sign In an existing user
  Future signInMemberWithEmailAndPassword(String email, String password) async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      // ignore: avoid_print
      print(e.code);
    } catch (e) {
      // ignore: avoid_print
      print(e);
    }
  }

  Stream<DocumentSnapshot<UserModel>> listenUserData() {
    return _user
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .withConverter<UserModel>(
            fromFirestore: (snapshot, _) =>
                UserModel.fromJson(snapshot.data()!),
            toFirestore: (user, _) => user.toJson())
        .snapshots();
  }

  Stream<QuerySnapshot> listenProgram(String name) {
    return _program.where('publisher', isEqualTo: name).snapshots();
  }
}
