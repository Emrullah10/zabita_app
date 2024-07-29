import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:zdestek/models/navigate_page.dart';

class AuthService {
  Future<void> signUp(
      String email, String password, BuildContext context) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      print('Kayıt başarılı: ${userCredential.user}');
      NavigationPage.navigateToPage(context, '/home');
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('Şifre çok zayıf.');
      } else if (e.code == 'email-already-in-use') {
        print('Bu email zaten kullanılıyor.');
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> signIn(String email, String password) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      print('Giriş başarılı: ${userCredential.user}');
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('Kullanıcı bulunamadı.');
      } else if (e.code == 'wrong-password') {
        print('Şifre yanlış.');
      }
    }
  }

  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
  }
}
