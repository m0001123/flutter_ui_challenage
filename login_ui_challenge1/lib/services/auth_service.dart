import "package:firebase_auth/firebase_auth.dart";
import "package:google_sign_in/google_sign_in.dart";

class AuthService {
  static final AuthService _instance = AuthService._internal();

  factory AuthService() {
    return _instance;
  }

  AuthService._internal();

  final FirebaseAuth _auth = FirebaseAuth.instance;

  //current auth status
  Stream<User?> get authStatus => _auth.authStateChanges();

  User? get currentUser => _auth.currentUser;

  //emain sign in
  Future<String?> emailSignIn(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      return ('success');
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        return ('找不到此用戶');
      } else if (e.code == 'wrong-password') {
        return ('密碼錯誤');
      } else {
        return ('登入失敗');
      }
    }
  }

  //google sign in
  Future<String?> googleSignIn() async {
    //google sign in process
    final GoogleSignInAccount? googleSignInAccount =
        await GoogleSignIn().signIn();

    //if user cancel signIn
    if (googleSignInAccount == null) {
      return 'cancel signIn';
    }

    //get authentication
    final GoogleSignInAuthentication googleSignInAuthentication =
        await googleSignInAccount.authentication;

    //create credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleSignInAuthentication.accessToken,
      idToken: googleSignInAuthentication.idToken,
    );
    try {
      _auth.signInWithCredential(credential);
      return 'success';
    } catch (e) {
      return '登入失敗';
    }
  }

  //sign out
  Future<void> signOut() async {
    await _auth.signOut();
  }

  // register
  Future<String?> register(String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      return 'success';
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        return ('密碼太弱');
      } else if (e.code == 'email-already-in-use') {
        return ('帳號已存在');
      } else {
        return '註冊失敗，再試一次';
      }
    }
  }
}
