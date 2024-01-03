import 'package:flutter/material.dart';
import 'package:renting/data/apartments.dart';
import 'package:renting/widgets/Apartment_List.dart';

class Userpage extends StatefulWidget {
  const Userpage({super.key});

  @override
  State<Userpage> createState() {
    return _Userpage();
  }
}

class _Userpage extends State<Userpage> {
  @override
  Widget build(BuildContext context) {
    Widget mainContet = const Center(
      child: Text('No Apartments found. Start adding some!'),
    );
    if (availableCategories.isNotEmpty) {
      mainContet = Apartment_List(
        apatment: availableCategories,
      );
    }
    
     return Scaffold(
        appBar: AppBar(
          title: const Text('User'),),
          body:mainContet
     );}}