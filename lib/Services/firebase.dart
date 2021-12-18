//a clss to carry methods to be called all over the app when needed
//methods include:

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mentor_codetivate_hackathon/Models/user_data.dart';

class FireStore {
  //create a CollectionRefrence called  trivia that refereces the firestore collection
  final CollectionReference _user = FirebaseFirestore.instance.collection('user');
  //These method creates a trivia with the given parameters
  //the trivia is added in the trivia collection
  ///name:the person who has set the trivia retrieved from collection user
  ///a number of questions with their answers
  /// the number of questions i.e whether 5,10 or 15
  /// a list of users who can view and take these trivia
  /// the method builds on the trivia data model
  ///parameters are in the Triviamodel
  Future<void> createNewUser(UserModel data) {
    //returns a document reference with data from TriviaModel
    //if succesfel prints the document refernce to string
    // on error prints the error
    
      return _user
          .doc()
          .set({
            
          })
          // ignore: avoid_print
          .then((value) => print("User added"))
          // ignore: avoid_print
          .catchError((error) => print("Failed: $error"));
    } 
  }


  