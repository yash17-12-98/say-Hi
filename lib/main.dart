import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'bindings/binding.dart';
import 'firebase_options.dart';
import 'routes/route.dart';
import 'screens/splash_screen.dart';
import 'utils/util.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: Common.projectName,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      defaultTransition: Transition.fade,
      initialRoute: Routes.splash,
      initialBinding: SplashBinding(),
      getPages: pages,
      home: const SplashScreen(),
    );
  }
}
