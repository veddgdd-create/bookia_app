import 'package:bookia_app/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:bookia_app/features/auth/presentation/change_password/page/change_password_screen.dart';
import 'package:bookia_app/features/auth/presentation/forgot_password/page/forgot_password_screen.dart';
import 'package:bookia_app/features/auth/presentation/login/page/login_screen.dart';
import 'package:bookia_app/features/auth/presentation/new_password/page/new_password_screen.dart';
import 'package:bookia_app/features/auth/presentation/otp/page/otp_screen.dart';
import 'package:bookia_app/features/auth/presentation/register/page/register_screen.dart';
import 'package:bookia_app/features/auth/presentation/success/success_change_password.dart';
import 'package:bookia_app/features/main/main_app_screen.dart';
import 'package:bookia_app/features/splash/splash_screen.dart';
import 'package:bookia_app/features/welcome/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

// global key
final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class Routes {
  static const String splashScreen = '/';
  static const String welcome = '/welcome';
  static const String login = '/login';
  static const String register = '/register';
  static const String forgotPassword = '/forgot-password';
  static const String otp = '/otp';
  static const String newPassword = '/new-password';
  static const String changePassword = '/change-password';
  static const String successChangePassword = '/success-change-password';
  static const String main = '/main';
  static const String details = '/details';
  static const String placeOrder = '/PlaceOrderScreen';

  static GoRouter routes = GoRouter(
    // initialLocation: splashScreen,
    navigatorKey: navigatorKey,
    routes: [
      GoRoute(
        path: splashScreen,
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: welcome,
        builder: (context, state) => const WelcomeScreen(),
      ),
      GoRoute(
        path: login,
        builder: (context, state) => BlocProvider(
          create: (context) => AuthCubit(),
          child: const LoginScreen(),
        ),
      ),
      GoRoute(
        path: register,
        builder: (context, state) => BlocProvider(
          create: (context) => AuthCubit(),
          child: const RegisterScreen(),
        ),
      ),
      GoRoute(
        path: forgotPassword,
        builder: (context, state) => const ForgotPasswordScreen(),
      ),
      GoRoute(path: otp, builder: (context, state) => const OtpScreen()),
      GoRoute(
        path: newPassword,
        builder: (context, state) => const NewPasswordScreen(),
      ),
      GoRoute(
        path: changePassword,
        builder: (context, state) => const ChangePasswordScreen(),
      ),
      GoRoute(
        path: main,
        builder: (context, state) => MainAppScreen(index: state.extra as int?),
      ),
      GoRoute(
        path: successChangePassword,
        builder: (context, state) => const SuccessChangePassword(),
      ),
    ],
  );
}
