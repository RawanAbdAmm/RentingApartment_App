import 'package:flutter/material.dart';
import 'package:renting/Model/apartments_model.dart';


class NewApartment extends StatefulWidget {
  NewApartment({super.key, required this.onAddApartment});
  final Function(Apartments apartments) onAddApartment;

  @override
  State<NewApartment> createState() {
    return _NewApartment();
  }
}

class _NewApartment extends State<NewApartment> {
  final _amountController = TextEditingController();
  final _addressController = TextEditingController();
  final _apartmentController = TextEditingController();

  

  void _save() {
    final _enteredAmount = double.tryParse(_amountController.text);

    final amountIsInvalid = _enteredAmount == null || _enteredAmount <= 0;
    if (_addressController.text.trim().isEmpty ||
        _apartmentController.text.trim().isEmpty ||
        amountIsInvalid) {
      showDialog(
          context: context,
          builder: (ctx) => AlertDialog(
                shape:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                title: const Text('Invalid Input'),
                content: const Text('Please make sure all inputs are valid'),
                actions: [
                  TextButton(
                      onPressed: () {
                        Navigator.pop(ctx);
                      },
                      child: const Text('Ok')),
                ],
              ));
      return;
    }
    widget.onAddApartment(Apartments(
        adress: _addressController.text,
        amount: _enteredAmount,
        apartmentnumber: _apartmentController.text,
        ));
    Navigator.pop(context);
  }

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
              child: TextField(
                controller: _addressController,
                decoration: const InputDecoration(
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
                controller: _apartmentController,
                decoration: const InputDecoration(
                  label: Text('Apartment Number'),
                ),
              ),
            ),
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: _amountController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  prefixText: '\$  ',
                  label: Text('Amount'),
                ),
              ),
            ),
            
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 171, 33, 23)),
                  onPressed: _save,
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
