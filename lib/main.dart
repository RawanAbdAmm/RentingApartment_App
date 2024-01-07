import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:renting/Model/apartments_model.dart';
import 'package:renting/constants/constant.dart';
import 'package:renting/cubit/readallapartments/read_allapart_cubit.dart';

import 'Screens/Login.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(ApartmentsAdapter());
  Hive.openBox<Apartments>(kBox);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  BlocProvider(
      create: (context) => ReadAllapartCubit(),
      child:const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Login(),
      ),
    );
  }
}
