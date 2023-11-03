import 'package:attendance_system/features/join/join_screen.dart';
import 'package:attendance_system/features/login/login_screen.dart';
import 'package:go_router/go_router.dart';

final GoRoute router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      name: 'home',
      path: '/',
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      name: 'join',
      path: '/join',
      builder: (context, state) => const JoinScreen(),
    ),
    GoRoute(
      name: 'login',
      path: '/login',
      builder: (context, state) => const LoginScreen(),
    ),
  ],
) as GoRoute;
