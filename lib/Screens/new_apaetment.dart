import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:renting/cubit/add_apart/add_apart_cubit.dart';
import 'package:renting/cubit/readallapartments/read_allapart_cubit.dart';
import 'package:renting/widgets/new-apatmentbody.dart';

class NewApartment extends StatelessWidget {
  const NewApartment({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddNewApartmentCubit(),
      child: BlocConsumer<AddNewApartmentCubit, AddNewApartmentStates>(
        listener: (context, state) {
          if (state is AddNewApartmentFailure) {}
          if (state is AddNewApartmentSuccess) {
            BlocProvider.of<ReadAllapartCubit>(context).readAllApartments();
            Navigator.pop(context);
          }
          ;
        },
        builder: (context, state) {
          return const SizedBox(
            height: double.infinity,
            child: new_apartmentbody(),
          );
        },
      ),
    );
  }
}
