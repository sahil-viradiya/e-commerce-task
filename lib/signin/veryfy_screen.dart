import 'package:e_commerce_task/common/product_info_container.dart';
import 'package:e_commerce_task/common/text_otp_field.dart';
import 'package:e_commerce_task/screens/product%20list/product_lists_screen.dart';
import 'package:e_commerce_task/signin/cubits/auth_cubits/auth_cubit.dart';
import 'package:e_commerce_task/signin/cubits/auth_cubits/auth_state.dart';
import 'package:e_commerce_task/signin/home.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class Verifi extends StatefulWidget {
  const Verifi({super.key});

  @override
  State<StatefulWidget> createState() {
    return VerifiState();
  }
}

class VerifiState extends State<Verifi> {
  TextEditingController otpController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            const SizedBox(
              height: 50,
            ),
            textCmn(txt: "Enter Your Otp", size: 22, clr: Colors.black, fontWeight: true, opacity: false),
            const SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                OTPWidget(
                  controller: otpController,
                ),
              ],
            ),
            const SizedBox(
              height: 50,
            ),
            BlocConsumer<AuthCubit, AuthState>(
              listener: (context, state) {
                if (state is AuthLoggedInState) {
                  Navigator.popUntil(context, (route) => route.isFirst);
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ProductListScreen(),
                      ));
                } else if (state is AuthErrorState) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      backgroundColor: Colors.red,
                      content: Text(state.erroe),
                      duration: const Duration(milliseconds: 600),
                    ),
                  );
                }
              },
              builder: (context, state) {
                if (state is AuthLoadingState) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                return MaterialButton(
                  onPressed: () {
                    BlocProvider.of<AuthCubit>(context).verifyOtp(otpController.text);
                  },
                  // color: Colors.blue,
                  child: textCmn(txt: "verify", size: 20, clr: Colors.black, fontWeight: false, opacity: false),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
