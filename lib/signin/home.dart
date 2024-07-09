
import 'package:e_commerce_task/signin/cubits/auth_cubits/auth_cubit.dart';
import 'package:e_commerce_task/signin/cubits/auth_cubits/auth_state.dart';
import 'package:e_commerce_task/signin/signin_screen.dart';
import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Wel-Come Home"),
      ),
      body: Center(
        child: BlocConsumer<AuthCubit, AuthState>(
          listener: (context, state) {
            if (state is AuthLoggedOutState) {
              Navigator.popUntil(context, (route) => route.isFirst);

              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => SignInScreen(),
                ),
              );
            }
          },
          builder: (context, state) => TextButton(
            onPressed: () {
              BlocProvider.of<AuthCubit>(context).logOut();
            },
            child: const Text("Logout"),
          ),
        ),
      ),
    );
  }
}
