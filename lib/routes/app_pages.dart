import 'package:get/get.dart';
import '../bindings/binding.dart';
import '../screens/screen.dart';
import 'page_routes.dart';

List<GetPage> pages = [
  GetPage(
    name: Routes.splash,
    page: () => const SplashScreen(),
    binding: SplashBinding(),
  ),
  GetPage(
    name: Routes.login,
    page: () => const LoginScreen(),
    binding: LoginBinding(),
  ),
  GetPage(
    name: Routes.signup,
    page: () => const SignupScreen(),
    binding: SignupBinding(),
  ),
  GetPage(
    name: Routes.profile,
    page: () => const ProfileScreen(),
    binding: ProfileBinding(),
  ),
];
