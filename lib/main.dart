import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pml_firebase/app/controllers/auth_controller.dart';
import 'app/utils/error_screen.dart';
import 'app/routes/app_pages.dart';
import 'app/utils/loading_screen.dart';
import 'app/utils/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  final authC = Get.put(AuthController(), permanent: true);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initialization,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return ErrorScreen();
        }

        if (snapshot.connectionState == ConnectionState.done) {
          // return GetMaterialApp(
          //   debugShowCheckedModeBanner: false,
          //   title: "Chat App",
          //   initialRoute: authC.isAuth.isTrue ? Routes.HOME : Routes.LOGIN,
          //   getPages: AppPages.routes,
          // );
          return FutureBuilder(
            future: Future.delayed(Duration(seconds: 2)),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return Obx(
                  () => GetMaterialApp(
                    debugShowCheckedModeBanner: false,
                    title: "Chat App",
                    initialRoute: authC.isSkipIntro.isTrue
                        ? authC.isAuth.isTrue
                            ? Routes.HOME
                            : Routes.LOGIN
                        : Routes.INTRODUCTION,
                    getPages: AppPages.routes,
                  ),
                );
              }
              return FutureBuilder(
                future: authC.firstInitialized(),
                builder: (context, snapshots) => SplashScreen(),
              );
            },
          );
        }

        return LoadingScreen();
      },
    );
  }
}
