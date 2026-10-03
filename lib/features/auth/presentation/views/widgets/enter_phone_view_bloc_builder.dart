import 'package:chat_app/core/routes/app_routes.dart';
import 'package:chat_app/features/auth/presentation/cubits/cubit/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class EnterPhoneViewBlocBuilder extends StatefulWidget {
  const EnterPhoneViewBlocBuilder({super.key, required this.child});
  final Widget child;
  @override
  State<EnterPhoneViewBlocBuilder> createState() =>
      _EnterPhoneViewBlocBuilderState();
}

class _EnterPhoneViewBlocBuilderState extends State<EnterPhoneViewBlocBuilder> {
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthLoading) {
          setState(() {
            isLoading = true;
          });
        } else if (state is AuthSuccess) {
          setState(() {
            isLoading = false;
          });
          context.push(AppRoutes.enterCodeView);
        } else {
          setState(() {
            isLoading = false;
          });
        }
      },
      child: isLoading
          ? Center(child: CircularProgressIndicator())
          : widget.child,
    );
  }
}
