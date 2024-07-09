import 'package:e_commerce_task/model/product_model.dart';
import 'package:e_commerce_task/screens/product%20list/product_lists_screen.dart';
import 'package:e_commerce_task/signin/cubits/auth_cubits/auth_cubit.dart';
import 'package:e_commerce_task/signin/cubits/auth_cubits/auth_state.dart';
import 'package:e_commerce_task/signin/signin_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const MyAppp());
}

class MyAppp extends StatelessWidget {
  const MyAppp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: BlocBuilder<AuthCubit, AuthState>(
          buildWhen: (oldState, newState) {
            return oldState is AuthIntialState;
          },
          builder: (context, state) {
            if (state is AuthLoggedInState) {
              return const ProductListScreen();
            } else if (state is AuthLoggedOutState) {
              return const SignInScreen();
            } else {
              return const ProductListScreen();
            }
          },
        ),
      ),
    );
  }
}
