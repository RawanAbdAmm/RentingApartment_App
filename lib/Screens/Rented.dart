import 'package:flutter/material.dart';
import 'package:renting/Model/apartments_model.dart';

class Rented extends StatefulWidget {
  const Rented({super.key, required this.apartment});
    final Apartments apartment;



  @override
  State<Rented> createState() {
    return _Rented();
  }
}

class _Rented extends State<Rented> {
  final _paidController = TextEditingController();
  final _nameController = TextEditingController();
  final _monthsController = TextEditingController();
  final val = false;
  void _save() {
    final _enteredpaid = double.tryParse(_paidController.text);
    final _enteredmoths = double.tryParse(_monthsController.text);

    final amountIsInvalid = _enteredmoths == null || _enteredmoths <= 0;
    if (_nameController.text.trim().isEmpty || amountIsInvalid) {
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
  widget.apartment.name!=_nameController.text;
  widget.apartment.months!=_monthsController;
  widget.apartment.paid!=_paidController;
     
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
                controller: _nameController,
                decoration: const InputDecoration(
                  label: Text('Name'),
                ),
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: _monthsController,
                decoration: const InputDecoration(
                  label: Text('Months'),
                ),
              ),
            ),
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: _paidController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  prefixText: '\$  ',
                  label: Text('Paid'),
                ),
              ),
            ),
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
            ),
          ]),
    );
  }
}
