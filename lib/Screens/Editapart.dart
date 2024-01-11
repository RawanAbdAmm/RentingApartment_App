import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:renting/Model/apartments_model.dart';
import 'package:renting/cubit/readallapartments/read_allapart_cubit.dart';
import 'package:renting/widgets/custom_textfield.dart';

class EditApartmentScreen extends StatefulWidget {
  const EditApartmentScreen({
    Key? key,
    required this.apartment,
  }) : super(key: key);

  final Apartments apartment;

  @override
  State<EditApartmentScreen> createState() => _EditApartmentScreenState();
}

class _EditApartmentScreenState extends State<EditApartmentScreen> {
  String? address, apartNum;

double? amount;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 153, 38, 30),
        title: const Text('Edit Apartment'),
      ),
      body: SingleChildScrollView(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                  padding:const EdgeInsets.all(8.0),
                  child: CustomTextField(
                    text: 'Address',
                    onChanged: (data) {
                      address = data;
                    },
                  )),
              const SizedBox(
                height: 8,
              ),
              Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CustomTextField(
                    text: 'Apartment Number',
                    onChanged: (data) {
                      apartNum = data;
                    },
                  )),
              const SizedBox(height: 8),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CustomTextField(
                    text: 'Amount',
                    onChanged: (data) {
                      amount = double.parse(data);
                    },
                  )
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor:
                            const Color.fromARGB(255, 171, 33, 23)),
                    onPressed: () {
                      widget.apartment.address =
                          address ?? widget.apartment.address;
                      widget.apartment.apartmentnumber =
                          apartNum ?? widget.apartment.apartmentnumber;
                            widget.apartment.amount = amount!=null ?amount! : widget.apartment.amount;
                      widget.apartment.save();
                      BlocProvider.of<ReadAllapartCubit>(context)
                          .readAllApartments();
                      Navigator.pop(context);
                    },
                    child: const Text("Save"),
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text(
                        'Cancel',
                        style:
                            TextStyle(color: Color.fromARGB(255, 171, 33, 23)),
                      )),
                ],
              ),
            ]),
      ),
    );
  }
}
