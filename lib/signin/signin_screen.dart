import 'package:e_commerce_task/common/product_info_container.dart';
import 'package:e_commerce_task/signin/cubits/auth_cubits/auth_cubit.dart';
import 'package:e_commerce_task/signin/cubits/auth_cubits/auth_state.dart';
import 'package:e_commerce_task/signin/veryfy_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  TextEditingController txtPhoneNo = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sign In "),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 50,
          ),
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: TextField(
              controller: txtPhoneNo,
              decoration: InputDecoration(
                hintText: "Enter Your Phone Number",
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(7), borderSide: const BorderSide(width: 1.4)),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(7), borderSide: const BorderSide(width: 1.4)),
              ),
            ),
          ),
          const SizedBox(height: 100),
          BlocConsumer<AuthCubit, AuthState>(
            listener: (context, state) {
              if (state is AuthCodeSentState) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Verifi(),
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
                  String phoneNumber = "+91${txtPhoneNo.text}";
                  BlocProvider.of<AuthCubit>(context).sendOtp(phoneNumber);
                },
                child: textCmn(txt: "send otp", size: 20, clr: Colors.black, fontWeight: true, opacity: false),
              );
            },
          ),
        ],
      ),
    );
  }
}
