import 'package:e_commerce_task/common/product_info_container.dart';
import 'package:e_commerce_task/signin/cubits/auth_cubits/auth_cubit.dart';
import 'package:e_commerce_task/signin/cubits/auth_cubits/auth_state.dart';
import 'package:e_commerce_task/signin/signin_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            // mainAxisSize: MainAxisSize.min,
            children: [
              textCmn(txt: "Hello, Sahil...", size: 20, clr: Colors.black, fontWeight: true, opacity: false),
              const SizedBox(height: 300),
              BlocConsumer<AuthCubit, AuthState>(
                listener: (context, state) {
                  if (state is AuthLoggedOutState) {
                    Navigator.popUntil(context, (route) => route.isFirst);

                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SignInScreen(),
                      ),
                    );
                  }
                },
                builder: (context, state) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      MaterialButton(
                        onPressed: () {
                          BlocProvider.of<AuthCubit>(context).logOut();
                        },
                        child: textCmn(txt: "logout", size: 22, clr: Colors.black, fontWeight: false, opacity: false),
                      ),
                    ],
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
