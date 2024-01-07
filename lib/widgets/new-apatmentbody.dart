import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:renting/Model/apartments_model.dart';
import 'package:renting/cubit/add_apart/add_apart_cubit.dart';
import 'package:renting/widgets/custom_textfield.dart';

class new_apartmentbody extends StatefulWidget {
  const new_apartmentbody({
    super.key,
  });

  @override
  State<new_apartmentbody> createState() => _new_apartmentbodyState();
}

class _new_apartmentbodyState extends State<new_apartmentbody> {
  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> formkey = GlobalKey();
    AutovalidateMode autovalidate = AutovalidateMode.disabled;

    String? address, apartNum, amout;

    return Form(
      key: formkey,
      child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
                padding: const EdgeInsets.all(8.0),
                child: CustomTextField(
                  onsaved: (data) {
                    address = data;
                  },
                  text: 'Address',
                )),
            const SizedBox(
              height: 8,
            ),
            Padding(
                padding: const EdgeInsets.all(8.0),
                child: CustomTextField(
                  onsaved: (data) {
                    apartNum = data;
                  },
                  text: 'Apartment Number',
                )),
            const SizedBox(height: 8),
            Padding(
                padding: const EdgeInsets.all(8.0),
                child: CustomTextField(
                  text: 'Amount',
                  onsaved: (data) {
                    amout = data;
                  },
                )),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 171, 33, 23)),
                  onPressed: () {
                    if (formkey.currentState!.validate()) {
                      formkey.currentState!.save();

                      var apartment = Apartments(address: address!, amount: double.parse(amout!), apartmentnumber: apartNum!, rented: false);
                      BlocProvider.of<AddNewApartmentCubit>(context)
                          .addNewApart(apartment);
                    } else {
                      autovalidate = AutovalidateMode.always;
                      setState(() {});
                    }
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
            )
          ]),
    );
  }
}
