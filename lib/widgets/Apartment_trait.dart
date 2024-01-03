import 'package:flutter/material.dart';
import 'package:renting/Model/apartments_model.dart';
import 'package:renting/Screens/apartdetal.dart';
import 'package:renting/widgets/Apartmenttrait.dart';

class ApartmentTrait extends StatelessWidget {
  const ApartmentTrait(this.apartments, {super.key});
  final Apartments apartments;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      clipBehavior: Clip.hardEdge,
      elevation: 2,
      child: InkWell(
        onTap: (){ Navigator.of(context).push(MaterialPageRoute(
        builder: (ctx) => Appartdetail(
              apartment: apartments,
            )));},
        child: Apartmenttrait(
          address: apartments.adress!,
          amount: apartments.amount!, rented: apartments.rented.toString(),
        ),
      ),
    );
  }
}
