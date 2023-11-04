import 'package:attendance_system/features/home/home_screen.dart';
import 'package:attendance_system/features/join/join_screen.dart';
import 'package:attendance_system/features/login/login_screen.dart';
import 'package:go_router/go_router.dart';

final router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      name: 'home',
      path: '/home',
      builder: (context, state) => const HomeScreens(),
    ),
    GoRoute(
      name: 'join',
      path: '/join',
      builder: (context, state) => const JoinScreen(),
    ),
    GoRoute(
      name: 'login',
      path: '/',
      builder: (context, state) => const LoginScreen(),
    ),
  ],
);
