import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:pml_firebase/app/routes/app_pages.dart';

class AuthController extends GetxController {
  var isSkipIntro = false.obs;
  var isAuth = false.obs;

  GoogleSignIn _googleSignIn = GoogleSignIn();
  GoogleSignInAccount? _currentUser;

  Future<void> login() async {
    //Buat fungsi untuk login dengan google
    try {
      await _googleSignIn.signOut();
      await _googleSignIn.signIn().then((value) => _currentUser = value);
      await _googleSignIn.isSignedIn().then((value) {
        if (value) {
          //kondisi login berhasil
          print("SUDAH BERHASIL LOGIN DENGAN AKUN : ");
          print(_currentUser);
          isAuth.value = true;
          Get.offAllNamed(Routes.HOME);
        } else {
          print("TIDAK BERHASIL LOGIN");
        }
      });
    } catch (error) {
      print(error);
    }
  }

  Future<void> logout() async {
    await _googleSignIn.signOut();
    Get.offAllNamed(Routes.LOGIN);
  }
}
