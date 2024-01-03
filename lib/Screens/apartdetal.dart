import 'package:flutter/material.dart';
import 'package:renting/Model/apartments_model.dart';
import 'package:renting/Screens/Editapart.dart';
import 'package:renting/Screens/Rented.dart';
import 'package:renting/data/apartments.dart';

class Appartdetail extends StatefulWidget {
  const Appartdetail({
    super.key,
    required this.apartment,
  });
  final Apartments apartment;

  @override
  State<Appartdetail> createState() => _AppartdetailState();
}

class _AppartdetailState extends State<Appartdetail> {
  void _addApartment(Apartments apartments) {
    setState(() {
      availableCategories.add(apartments);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 153, 38, 30),
          title: Text(widget.apartment.adress!),
        ),
        body: SingleChildScrollView(
            child: Column(
          children: [
            const Text(
              'Appartment Details ',
              style: TextStyle(fontSize: 20),
            ),
            const SizedBox(
              height: 14,
            ),
            Card(
              child: ListTile(
                leading: const Icon(
                  Icons.location_city_outlined,
                  size: 30,
                ),
                subtitle: Text('Rented :${widget.apartment.rented}'),
                trailing: Text(widget.apartment.adress!),
                title: Text(' ${widget.apartment.amount} Jd'),
              ),
            ),
            const SizedBox(
              height: 14,
            ),
            Card(
              child: ListTile(
                leading: const Icon(
                  Icons.location_city_outlined,
                  size: 30,
                ),
                subtitle: Text('Name :${widget.apartment.name}'),
                trailing: Text(widget.apartment.months.toString()),
                title: Text(' ${widget.apartment.paid} Jd'),
              ),
            ),
            const SizedBox(
              height: 14,
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 153, 38, 30)),
              onPressed: () {
                showModalBottomSheet(
                    shape: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    useSafeArea: true,
                    isScrollControlled: true,
                    context: context,
                    builder: (ctx) => Rented(
                          apartment: widget.apartment,
                      
                        ));
              },
              child: const Text('Rent'),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(255, 153, 38, 30)),
              onPressed: () {
                showModalBottomSheet(
                    shape: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    useSafeArea: true,
                    isScrollControlled: true,
                    context: context,
                    builder: (ctx) => EditApartmentScreen(
                          apartment: widget.apartment,
                        ));
              },
              child: const Text('Edit'),
            ),
            Container(
              alignment: Alignment.bottomCenter,
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 153, 38, 30),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                'Total Amount: ${widget.apartment.amount}',
                style: Theme.of(context).textTheme.headline6!.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ),
          ],
        )));
  }
}
