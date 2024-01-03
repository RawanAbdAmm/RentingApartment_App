import 'package:flutter/material.dart';
import 'package:renting/Model/apartments_model.dart';
import 'package:renting/Screens/new_apaetment.dart';
import 'package:renting/data/apartments.dart';
import 'package:renting/widgets/Apartment_List.dart';

class Adminpage extends StatefulWidget {
  const Adminpage({super.key});

  @override
  State<Adminpage> createState() {
    return _Adminpage();
  }
}

class _Adminpage extends State<Adminpage> {
  @override
  Widget build(BuildContext context) {
    void _removeApartment(Apartments apartments) {
      final apartmentIndex = availableCategories.indexOf(apartments);
      //remove from list internally
      setState(() {
        availableCategories.remove(apartments);
      });
      ScaffoldMessenger.of(context).clearSnackBars();
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: const Text('Apartment deleted'),
        duration: const Duration(seconds: 3),
        action: SnackBarAction(
            label: 'Undo',
            onPressed: () {
              setState(() {
                availableCategories.insert(apartmentIndex, apartments);
              });
            }),
      ));
    }

    void _addApartment(Apartments apartments) {
      setState(() {
        availableCategories.add(apartments);
      });
    }

    Widget mainContet = const Center(
      child: Text('No Apartments found. Start adding some!'),
    );
    if (availableCategories.isNotEmpty) {
      mainContet = Apartment_List(
        apatment: availableCategories,
        onRemoveApartment: _removeApartment,
      );
    }

    return Scaffold(
        appBar: AppBar(
          title: const Text('Admin'),
          backgroundColor: const Color.fromARGB(255, 171, 33, 23),
          actions: [
            IconButton(
              onPressed: () {
                showModalBottomSheet(
                  
                  shape: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  useSafeArea: true,
                  isScrollControlled: true,
                  context: context,
                  builder: (ctx) => NewApartment(
                    onAddApartment: _addApartment,
                  ),
                );
              },
              icon: const Icon(Icons.add),
            ),
          ],
        ),
        body: mainContet);
  }
}
