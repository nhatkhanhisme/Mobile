import 'package:go_router/go_router.dart';
import 'package:lacquer/presentation/pages/auth/forgot_password_page.dart';
import 'package:lacquer/presentation/pages/auth/login_page.dart';
import 'package:lacquer/presentation/pages/auth/verify_page.dart';
import 'package:lacquer/presentation/pages/camera/camera_page.dart';
import 'package:lacquer/presentation/pages/chatBot/chat_bot_page.dart';
import 'package:lacquer/presentation/pages/home/home_page.dart';
import 'package:lacquer/presentation/pages/profile/profile_page.dart';

class RouteName {
  static const String home = '/';
  static const String login = '/login';
  static const String forgotPassword = '/forgot-password';
  static const String verify = '/verify';
  static const String register = '/register';
  static const String chatBot = '/chatbot';
  static const String camera = '/camera';
  static const String profile = '/profile';

  static const publicRoutes = [login, forgotPassword, verify, register];
}

final router = GoRouter(
  redirect: (context, state) {
    if (RouteName.publicRoutes.contains(state.fullPath)) {
      return null;
    }
    // If the user is not logged in, redirect to the login page
    return RouteName.login;
  },
  routes: [
    GoRoute(path: RouteName.home, builder: (context, state) => HomePage()),
    GoRoute(path: RouteName.login, builder: (context, state) => LoginPage()),
    GoRoute(
      path: RouteName.chatBot,
      builder: (context, state) => ChatBotPage(),
    ),
    GoRoute(path: RouteName.camera, builder: (context, state) => CameraPage()),
    GoRoute(
      path: RouteName.profile,
      builder: (context, state) => ProfilePage(),
    ),
    GoRoute(
      path: RouteName.forgotPassword,
      builder: (context, state) => ForgotPasswordPage(),
    ),
    GoRoute(
      path: RouteName.verify,
      builder: (context, state) => VerifyEmailPage(),
    ),
  ],
);
