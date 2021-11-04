import '../pages/coba/coba_view.dart';
import '../pages/coba/coba_binding.dart';
import 'package:get/get.dart';

part 'app_routes.dart';

class AppPages {
  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: Routes.COBA, 
      page:()=> CobaView(), 
      binding: CobaBinding(),
    ),
  ];
}