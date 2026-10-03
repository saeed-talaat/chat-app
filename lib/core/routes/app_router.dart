import 'package:chat_app/core/routes/app_routes.dart';
import 'package:chat_app/core/services/service_locator.dart';
import 'package:chat_app/features/auth/presentation/cubits/cubit/auth_cubit.dart';
import 'package:chat_app/features/auth/presentation/views/enter_code_view.dart';
import 'package:chat_app/features/auth/presentation/views/enter_phone_view.dart';
import 'package:chat_app/features/auth/presentation/views/profile_view.dart';
import 'package:chat_app/features/contacts/presentation/cubits/cubit/contact_cubit.dart';
import 'package:chat_app/features/contacts/presentation/views/add_contact_view.dart';
import 'package:chat_app/features/home/presentation/views/home_view.dart';
import 'package:chat_app/features/onboarding/presentation/views/onboarding_view.dart';
import 'package:chat_app/features/splash/presentation/views/splash_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: AppRoutes.splashView,
  routes: [
    GoRoute(
      path: AppRoutes.splashView,
      builder: (context, state) => const SplashView(),
    ),

    GoRoute(
      path: AppRoutes.onboardingView,
      builder: (context, state) => const OnboardingView(),
    ),

    ShellRoute(
      builder: (context, state, child) {
        return BlocProvider(
          create: (context) => getIt<AuthCubit>(),
          child: child,
        );
      },
      routes: [
        GoRoute(
          path: AppRoutes.enterPhoneView,
          builder: (context, state) => const EnterPhoneView(),
        ),

        GoRoute(
          path: AppRoutes.enterCodeView,
          builder: (context, state) => const EnterCodeView(),
        ),
      ],
    ),

    GoRoute(
      path: AppRoutes.profileView,
      builder: (context, state) => BlocProvider(
        create: (context) => getIt<AuthCubit>(),
        child: const ProfileView(),
      ),
    ),

    GoRoute(
      path: AppRoutes.homeView,
      builder: (context, state) => const HomeView(),
    ),

    GoRoute(
      path: AppRoutes.addContactView,
      builder: (context, state) => BlocProvider(
        create: (context) => getIt<ContactCubit>(),
        child: const AddContactView(),
      ),
    ),
  ],
);
