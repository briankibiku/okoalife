import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:rxdart/rxdart.dart';

class AuthenticationHandler {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();
  SignedInUserCridentials signedInUserCridentials = SignedInUserCridentials();

  Future<bool> signInWithGoogle() async {
    bool signedIn;
    print('🐛🐛  initializing singIn processlogin');
    final GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
    final GoogleSignInAuthentication googleSignInAuthentication =
        await googleSignInAccount.authentication;

    final AuthCredential credential = GoogleAuthProvider.getCredential(
      accessToken: googleSignInAuthentication.accessToken,
      idToken: googleSignInAuthentication.idToken,
    );
    print('🐛🐛  get auth creds');

    final AuthResult authResult = await _auth.signInWithCredential(credential);
    final FirebaseUser user = authResult.user;
    signedInUserCridentials.email.add(user.email);

    assert(!user.isAnonymous);
    assert(await user.getIdToken() != null);

    print('🐛🐛  auth user');

    final FirebaseUser currentUser = await _auth.currentUser();
    assert(user.uid == currentUser.uid);
    // if(user.uid == currentUser.uid) {
    //   signedIn = true;
    // }

    return signedIn;
  }

  void signOutGoogle() async {
    await googleSignIn.signOut();

    print("User Sign Out");
  }
}

class SignedInUserCridentials {
  static final SignedInUserCridentials _singleton =
      SignedInUserCridentials._internal();

  factory SignedInUserCridentials() {
    return _singleton;
  }

  SignedInUserCridentials._internal();

  BehaviorSubject email = BehaviorSubject();
}
