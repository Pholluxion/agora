import 'package:agora/data/data.dart';
import 'package:agora/pages/pages.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

final router = GoRouter(
  initialLocation: '/login',
  routes: [
    GoRoute(
      path: '/login',
      builder: (context, state) => const LoginPage(),
      redirect: (context, state) {
        return context.read<UserCubit>().state.isComplete ? '/' : '/login';
      },
    ),
    GoRoute(
      path: '/',
      builder: (context, state) => const HomePage(),
      routes: [
        GoRoute(
          path: 'form',
          builder: (context, state) => const FormPage(),
        ),
        GoRoute(
          path: 'meeting',
          builder: (context, state) => const MeetingPage(),
        ),
      ],
    ),
  ],
);
