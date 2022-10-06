import 'package:flutter_app_template/screens/home_screen.dart';
import 'package:flutter_app_template/screens/quiz_screen.dart';
import 'package:flutter_app_template/screens/splash_screen.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';

class Routes {
  static const String splashScreen = '/splash_screen';
  static const String homeScreen = '/home_screen';
  static const String quizScreen = '/quiz_screen';

   static var list = [
    GetPage(
        name: Routes.splashScreen,
        page: () => const SplashScreen(),
        transition: Transition.rightToLeft),
    GetPage(
        name: Routes.homeScreen,
        page: () => const HomeScreen(),
        transition: Transition.rightToLeft),
    GetPage(
        name: Routes.quizScreen,
        page: () =>  QuizScreen(),
        transition: Transition.rightToLeft),
    
  ];
}
