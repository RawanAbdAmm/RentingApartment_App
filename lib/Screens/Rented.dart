import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:renting/Model/apartments_model.dart';
import 'package:renting/cubit/readallapartments/read_allapart_cubit.dart';
import 'package:renting/widgets/custom_textfield.dart';

class Rented extends StatefulWidget {
  const Rented({super.key, required this.apartment});
  final Apartments apartment;

  @override
  State<Rented> createState() {
    return _Rented();
  }
}

class _Rented extends State<Rented> {
  String? name, month, paid;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: double.infinity,
      child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
                padding: const EdgeInsets.all(8.0),
                child: CustomTextField(
                  onChanged: (data) {
                    name = data;
                  },
                  text: 'Enter Name:',
                )),
            const SizedBox(
              height: 8,
            ),
            Padding(
                padding: const EdgeInsets.all(8.0),
                child: CustomTextField(
                  onChanged: (data) {
                    month = data;
                  },
                  text: 'Months',
                )),
            const SizedBox(height: 8),
            Padding(
                padding: const EdgeInsets.all(8.0),
                child: CustomTextField(
                  onChanged: (data) {
                    paid = data;
                  },
                  text: 'Paid ',
                )),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 171, 33, 23)),
                  onPressed: () {
                    widget.apartment.name = name ?? widget.apartment.name;
                    widget.apartment.months =
                        double.parse(month!) ?? widget.apartment.months;
                    widget.apartment.paid =
                        double.parse(paid!) ?? widget.apartment.paid;
                        widget.apartment.rented=true;
                        
                    widget.apartment.save();
                    BlocProvider.of<ReadAllapartCubit>(context)
                        .readAllApartments();
                    Navigator.of(context).pop();
                  },
                  child: const Text("Save"),
                ),
                TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text(
                      'Cancel',
                      style: TextStyle(color: Color.fromARGB(255, 171, 33, 23)),
                    )),
              ],
            ),
          ]),
    );
  }
}
