import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:registration/Core/core.dart';
import 'package:registration/Model/user_model.dart';

Future<bool> addUser(UserModel u)async{
  print(u.userGender);
  final UserCredential userCredential = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(
            email: u.userEmail, password: u.userPassword);
  try{if(userCredential!=null){
  final firebaseInstance=await FirebaseFirestore.instance.collection('users').doc(userCredential.user!.uid).set({
    'user_name':u.userName,
    'user_email':u.userEmail,
    'usergender':u.userGender,
    'user_address':u.userAddress
  });
  return Future.value(true);
  }
  else{
    return Future.value(false);
  }}
  catch(e){
    print('string');
    return Future.value(false);
  }
}

Future <bool> checkLogin(UserModel u) async{
  print(u.userEmail);
  final UserCredential userCredential=await FirebaseAuth.instance.signInWithEmailAndPassword(email: u.userEmail, password: u.userPassword);
  try{
    if(userCredential!=null){
    currentUser=userCredential.user!.uid;
    return Future.value(true);
  }
  else{
    return Future.value(false);
  }}
  catch(e){
    print(e.toString());
    return Future.value(false);
  }
}

Future<bool> editUser(UserModel user) async {
  try {
    final String uid = FirebaseAuth.instance.currentUser!.uid;

    await FirebaseFirestore.instance.collection('users').doc(uid).set({
  'user_name': user.userName,         // ✅ match loadUser()
      'user_email': user.userEmail,
      'usergender': user.userGender,
      'user_address': user.userAddress,
}, SetOptions(merge: true));


    return true;
  } catch (e) {
    print('Edit error: ${e.toString()}');
    return false;
  }
}

Future<UserModel> loadUser(String userID) async{
  print(currentUser);
  final firebaseInstance= await FirebaseFirestore.instance.collection('users').doc(currentUser).get();
  final userData=firebaseInstance.data();
  UserModel u=UserModel(
    '',
    userData!['user_name'], 
    userData['user_email'],     
    userData['usergender'], 
    '',
    userData['user_address']);

  return Future.value(u);
}