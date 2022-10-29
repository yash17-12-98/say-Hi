import 'package:get/get.dart';
import '../bindings/binding.dart';
import '../screens/chat_screen.dart';
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
    name: Routes.home,
    page: () => const HomeScreen(),
    binding: HomeBinding(),
  ),
  GetPage(
    name: Routes.searchUser,
    page: () => const SearchUser(),
    binding: SearchUserBinding(),
  ),
  GetPage(
    name: Routes.profile,
    page: () => const ProfileScreen(),
    binding: ProfileBinding(),
  ),
  GetPage(
    name: Routes.chat,
    page: () => const ChatScreen(),
    binding: ChatBinding(),
  ),
];
