import 'package:flutter/material.dart';
import 'package:renting/Screens/new_apaetment.dart';
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
                builder: (ctx) => NewApartment(),
              );
            },
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body:const ApartmentList() ,
    );
  }
}
