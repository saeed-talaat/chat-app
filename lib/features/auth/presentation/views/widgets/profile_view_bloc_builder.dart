import 'package:chat_app/core/constants/app_constatns.dart';
import 'package:chat_app/core/routes/app_routes.dart';
import 'package:chat_app/core/services/sharedpreferences_service.dart';
import 'package:chat_app/features/auth/presentation/cubits/cubit/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class ProfileViewBlocBuilder extends StatelessWidget {
  const ProfileViewBlocBuilder({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthSuccess) {
            Prefs.setBool(AppConstatns.isLoggedIn, true);
          context.go(AppRoutes.homeView);
        
        } else if (state is AuthFailure) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(state.errorMessage)));
        }
      },
      child: child,
    );
  }
}
