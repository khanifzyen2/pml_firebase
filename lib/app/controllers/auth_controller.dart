import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:pml_firebase/app/routes/app_pages.dart';

class AuthController extends GetxController {
  var isSkipIntro = false.obs;
  var isAuth = false.obs;

  final _googleSignIn = GoogleSignIn();
  GoogleSignInAccount? _currentUser;

  Future<void> login() async {
    //Buat fungsi untuk login dengan google
    try {
      //ini untuk handle kebocoran data user sebelum login
      await _googleSignIn.signOut();

      //ini digunakan untuk mendapatkan google account
      _currentUser = await _googleSignIn.signIn();

      //ini untuk mengecek status login user
      final isSignedIn = await _googleSignIn.isSignedIn();

      if (isSignedIn) {
        //kondisi login berhasil
        print("SUDAH BERHASIL LOGIN DENGAN AKUN : ");
        print(_currentUser);

        final googleAuth = await _currentUser!.authentication;

        final _credential = GoogleAuthProvider.credential(
          idToken: googleAuth.idToken,
          accessToken: googleAuth.accessToken,
        );

        final userCredential =
            await FirebaseAuth.instance.signInWithCredential(_credential);

        print("USER CREDENTIALS");
        print(userCredential);

        isAuth.value = true;
        Get.offAllNamed(Routes.HOME);
      } else {
        print("TIDAK BERHASIL LOGIN");
      }
    } catch (error) {
      print(error);
    }
  }

  Future<void> logout() async {
    await _googleSignIn.signOut();
    Get.offAllNamed(Routes.LOGIN);
  }
}
