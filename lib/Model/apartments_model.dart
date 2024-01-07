import 'package:hive/hive.dart';
part 'apartments_model.g.dart';

@HiveType(typeId: 0)
class Apartments extends HiveObject {
  @HiveField(0)
  final double amount;
  @HiveField(1)
  final String address;
  @HiveField(2)
  final String apartmentnumber;
  @HiveField(3)
  final bool rented;
  @HiveField(4)
  final String? name;
  @HiveField(5)
  final double months;
  @HiveField(6)
  final double? paid;
  @HiveField(7)
  final double? restofpayment;

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
