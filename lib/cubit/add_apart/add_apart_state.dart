part of 'add_apart_cubit.dart';

abstract class AddNewApartmentStates {}

class AddNewApartmentInitial extends AddNewApartmentStates {}

class AddNewApartmentLoading extends AddNewApartmentStates {}

class AddNewApartmentSuccess extends AddNewApartmentStates {}

class AddNewApartmentFailure extends AddNewApartmentStates {
  final String errMessage;
  AddNewApartmentFailure(this.errMessage);
}

