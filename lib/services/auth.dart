import 'package:brew_crew/models/user.dart';
import 'package:brew_crew/services/database.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {

  final FirebaseAuth _auth = FirebaseAuth.instance;

  // create user obj based on FirebaseUser
  User _userFromFirebaseUser( FirebaseUser user) {
   return user != null ? User(uid: user.uid) : null ;
  }

  // auth change user stream
  Stream <User> get user {
    return _auth.onAuthStateChanged.map(_userFromFirebaseUser);
    //.map((FirebaseUser user) => _userFromFirebaseUser(user));
  }

  //  sign ins anon
  Future signInAnon() async {
    try {
      AuthResult result =  await _auth.signInAnonymously();
      FirebaseUser user =result.user;
      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  // @todo sign in with email & password

  Future signInWithEmailPass(String email, String password) async{
    try {
      AuthResult result = await _auth.signInWithEmailAndPassword(email: email, password: password);
      FirebaseUser user =result.user;
      return _userFromFirebaseUser(user);
    } catch(e){
      print(e.toString());
      return null;
    }
  }

  // @todo Register with email & password
  Future registerWithEmailPass(String email, String password) async{
    try {
      AuthResult result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      FirebaseUser user =result.user;
      // create a new document for the register user
      await DatabaseService(uid: user.uid).updateUserData('0', 'new crew member', 100);
      return _userFromFirebaseUser(user);
    } catch(e){
      print(e.toString());
      return null;
    }
  }

  // @todo sign in with phone

  // @todo sign out
  Future signOut()async {
    try {
      return await _auth.signOut();
    } catch(e){
      print(e.toString());
      return null;
    }
  }



}