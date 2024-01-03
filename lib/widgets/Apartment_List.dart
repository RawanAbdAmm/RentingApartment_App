import 'package:flutter/material.dart';
import 'package:renting/Model/apartments_model.dart';
import 'package:renting/widgets/Apartment_trait.dart';

class Apartment_List extends StatelessWidget {
  final List<Apartments> apatment;
  final void Function(Apartments apatment)? onRemoveApartment;

  const Apartment_List(
      {super.key, required this.apatment, this.onRemoveApartment});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      
      itemCount: apatment.length,
      itemBuilder: (ctx, index) => Dismissible(
        key: ValueKey(apatment[index]),
        onDismissed: (direction) {
          onRemoveApartment!(apatment[index]);
        },
        child: ApartmentTrait(apatment[index]),
      ),
    );
  }
}
