import 'package:flutter/material.dart';
import 'package:renting/Model/apartments_model.dart';

class EditApartmentScreen extends StatelessWidget {
  const EditApartmentScreen({
    Key? key,
    required this.apartment,
  }) : super(key: key);

  final Apartments apartment;

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
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  // controller: _nameController,
                  decoration:  InputDecoration(
                    label: Text('Address'),
                  ),
                ),
              ),
              const SizedBox(
                height: 8,
              ),
               Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  // controller: _monthsController,
                  decoration: const InputDecoration(
                    label: Text('Appartment Number'),
                  ),
                ),
              ),
              const SizedBox(height: 8),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  // controller: _paidController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    prefixText: '\$  ',
                    label: Text('Amount'),
                  ),
                ),
              ),
               Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 171, 33, 23)),
                  onPressed: (){},
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
      ),
    );
  }
}
