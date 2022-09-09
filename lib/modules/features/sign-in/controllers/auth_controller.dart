import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:foodie/config/themes/theme.dart';
import 'package:foodie/modules/features/sign-in/models/user_model.dart';
import 'package:foodie/modules/features/sign-in/repository/auth_repository.dart';
import 'package:foodie/shared/widgets/snackbar.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthController extends GetxController {
  final isAuth = false.obs;
  final isVisible = false.obs;
  final isLoading = false.obs;

  var nama = ''.obs;
  var email = ''.obs;

  final FirebaseAuth auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  UserModel? _user;

  Future<bool> login({String? email, String? password}) async {
    try {
      if (email != '' || password != '') {
        if (GetUtils.isEmail(email!)) {
          UserModel user = await AuthRepository().login(
            email: email,
            password: password,
          );
          _user = user;
          writeToken(_user!.token.toString());
          print(_user!.token);
          return true;
        } else {
          snackbar(
            'Login Failed',
            'Email tidak valid !',
            backgroundColor,
            SnackPosition.BOTTOM,
            alertColor,
          );
          return false;
        }
      } else {
        snackbar(
          'Form Kosong',
          'Email atau password tidak boleh kosong !',
          backgroundColor,
          SnackPosition.BOTTOM,
          alertColor,
        );

        return false;
      }
    } catch (e) {
      return false;
    }
  }

  Future<void> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleSignInAccount =
          await googleSignIn.signIn();
      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount!.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );
      await auth.signInWithCredential(credential);
      nama.value = auth.currentUser!.displayName!;
      email.value = auth.currentUser!.email!;
      UserModel user = await AuthRepository().loginGoogle(
          email: auth.currentUser!.email, nama: auth.currentUser!.displayName);
      print(user.token);
      writeToken(user.token.toString());
    } on FirebaseAuthException catch (e) {
      print(e.message);
      rethrow;
    }
  }

  Future<void> signOutFromGoogle() async {
    await googleSignIn.signOut();
    await auth.signOut();
    removeToken();
  }

  void writeToken(String token) {
    final box = GetStorage();
    box.write('isLogged', true);
    box.write('token', token);
  }

  String readToken() {
    final box = GetStorage();
    return box.read('token') ?? '';
  }

  void removeToken() {
    final box = GetStorage();
    box.remove('isLogged');
    box.remove('token');
  }
}
