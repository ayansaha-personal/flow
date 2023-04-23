import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:google_sign_in/google_sign_in.dart';

Future<UserCredential> signInWithGitHub() async {
  GithubAuthProvider githubProvider = GithubAuthProvider();
  if (kIsWeb) {
    return await FirebaseAuth.instance.signInWithPopup(githubProvider);
  } else {
    return await FirebaseAuth.instance.signInWithProvider(githubProvider);
  }
}

Future<UserCredential> signInWithGoogle() async {
  if (kIsWeb) {
    GoogleAuthProvider googleProvider = GoogleAuthProvider();

    googleProvider.addScope('https://www.googleapis.com/auth/cloud-platform');
    googleProvider.setCustomParameters({
      'login_hint': 'user@example.com'
    });
    return await FirebaseAuth.instance.signInWithPopup(googleProvider);
  } else {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;
    OAuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    return await FirebaseAuth.instance.signInWithCredential(credential);
  }
}


