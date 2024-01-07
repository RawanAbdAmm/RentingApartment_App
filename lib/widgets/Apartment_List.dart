import 'package:flutter/material.dart';
import 'package:renting/Model/apartments_model.dart';
import 'package:renting/cubit/readallapartments/read_allapart_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:renting/widgets/Apartment_trait.dart';

class ApartmentList extends StatefulWidget {
  const ApartmentList({
    super.key,
  });

  @override
  State<ApartmentList> createState() => _ApartmentListState();
}

class _ApartmentListState extends State<ApartmentList> {
  @override
  void initState() {
    BlocProvider.of<ReadAllapartCubit>(context).readAllApartments();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReadAllapartCubit, ReadAllapartState>(
      builder: (context, state) {
        List<Apartments> apartment =
            BlocProvider.of<ReadAllapartCubit>(context).apartment!;
        return ListView.builder(
          
            itemCount: apartment.length,
            itemBuilder: (ctx, index) {
              return ApartmentTrait(
                apartments: apartment[index],
              );
            });
      },
    );
  }
}
