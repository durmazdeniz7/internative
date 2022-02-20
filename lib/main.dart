import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inter_native/cubit/blog_cubit.dart';
import 'package:inter_native/cubit/cateogry_cubit.dart';
import 'package:inter_native/cubit/sign_up_cubit.dart';
import 'package:inter_native/views/login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => BlogCubit()),
        BlocProvider(create: (context) => CategoryCubit()),
        BlocProvider(create: (context) => SignUpCubit()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.grey,
        ),
        home: const LoginPage(),
      ),
    );
  }
}
