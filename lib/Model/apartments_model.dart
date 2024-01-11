import 'package:hive/hive.dart';
part 'apartments_model.g.dart';

@HiveType(typeId: 0)
class Apartments extends HiveObject {
  @HiveField(0)
   double amount;
  @HiveField(1)
   String address;
  @HiveField(2)
   String apartmentnumber;
  @HiveField(3)
   bool rented;
  @HiveField(4)
   String? name;
  @HiveField(5)
   double months;
  @HiveField(6)
   double? paid;
  @HiveField(7)
   double? restofpayment;

  Apartments({
    required this.address,
    required this.amount,
    required this.apartmentnumber,
    required this.rented,
     this.name,
    this.months = 0,
     this.paid,
     this.restofpayment,
  });
}
