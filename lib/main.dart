import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:platzi_store/Platzi%20Store/view/Screen/HomeScreen.dart';
import 'package:platzi_store/Platzi%20Store/view/Screen/Login_page.dart';
import 'package:platzi_store/Platzi%20Store/view_models/bloc/platzi_product_bloc.dart';

void main() {
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => PlatziProductBloc()..add(PlatziProductSuccess()),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      home: BlocProvider(
        create: (context) => PlatziProductBloc(),
        child: Homescreen(),
      ),
    );
  }
}
