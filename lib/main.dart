import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app/src/data/food_app/food_app_cubit.dart';
import 'package:food_app/src/presentation/food_layout.dart';

void main() => runApp(const BlocFoodApp());

class BlocFoodApp extends StatelessWidget {
  const BlocFoodApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FoodAppCubit()..getApp(),
      child: const MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Food app',
      home: FoodLayout(),
    );
  }
}
