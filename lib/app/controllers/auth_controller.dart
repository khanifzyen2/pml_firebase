import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:pml_firebase/app/routes/app_pages.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AuthController extends GetxController {
  var isSkipIntro = false.obs;
  var isAuth = false.obs;

  final _googleSignIn = GoogleSignIn();
  GoogleSignInAccount? _currentUser;

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<void> firstInitialized() async {
    await autologin().then((value) {
      if (value) {
        isAuth.value = true;
      }
    });

    await skipIntro().then((value) {
      if (value) {
        isSkipIntro.value = true;
      }
    });
  }

  Future<bool> autologin() async {
    //mengubah isAuth menjadi true => autologin
    try {
      final isSignedIn = await _googleSignIn.isSignedIn();
      if (isSignedIn) {
        return true;
      }
      return false;
    } catch (err) {
      return false;
    }
  }

  Future<bool> skipIntro() async {
    //mengubah skipIntro menjadi true;
    final box = GetStorage();
    if (box.read("skipIntro") != null || box.read("skipIntro") == true) {
      return true;
    }
    return false;
  }

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

        //simpan status user bahwa sudah pernah login dan tidak akan menampilkan introduction kembali.
        final box = GetStorage();
        if (box.read("skipIntro") != null) {
          box.remove("skipIntro");
        }
        box.write('skipIntro', true);

        //simpan users ke dalam firestore...
        CollectionReference users = firestore.collection('users');
        users.doc(_currentUser!.email).set({
          "uid": userCredential.user!.uid,
          "name": _currentUser!.displayName,
          "email": _currentUser!.email,
          "photoUrl": _currentUser!.photoUrl,
          "status": "",
          "creationTime":
              userCredential.user!.metadata.creationTime!.toIso8601String(),
          "updatedTime": DateTime.now().toIso8601String(),
        });

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
    await _googleSignIn.disconnect();
    await _googleSignIn.signOut();
    Get.offAllNamed(Routes.LOGIN);
  }
}
