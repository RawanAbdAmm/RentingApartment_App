import 'package:flutter/material.dart';

class Apartmenttrait extends StatelessWidget{
  const Apartmenttrait({super.key, required this.address, required this.amount, required this.rented});
  
  final String address;
  final String rented;
  final double amount;

  @override
  Widget build(BuildContext context) {
    return 
        ListTile(
           leading:const Icon(Icons.location_city_outlined,size: 30,),
           subtitle: Text('Rented :$rented'),
           trailing:Text(address) ,
           title:Text(' $amount Jd') ,
        
      

    );
    
  }

}