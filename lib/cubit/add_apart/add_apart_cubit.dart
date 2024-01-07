import 'package:bloc/bloc.dart';
import 'package:hive/hive.dart';
import 'package:renting/Model/apartments_model.dart';
import 'package:renting/constants/constant.dart';

part 'add_apart_state.dart';

class AddNewApartmentCubit extends Cubit<AddNewApartmentStates> {
  AddNewApartmentCubit() : super(AddNewApartmentInitial());

  addNewApart(Apartments apartment) async {
    emit(AddNewApartmentLoading());
    try {
      var apartBox = Hive.box<Apartments>(kBox);

      await apartBox.add(apartment);
      emit(AddNewApartmentSuccess());
    } catch (e) {
      emit(AddNewApartmentFailure(e.toString()));
    }
  }
}
