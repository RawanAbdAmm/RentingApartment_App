import 'package:bloc/bloc.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';
import 'package:renting/Model/apartments_model.dart';
import 'package:renting/constants/constant.dart';

part 'read_allapart_state.dart';

class ReadAllapartCubit extends Cubit<ReadAllapartState> {
  ReadAllapartCubit() : super(ReadAllapartInitial());
  List<Apartments>? apartment;

  readAllApartments() {
    var apartmentsBox = Hive.box<Apartments>(kBox);
    apartment = apartmentsBox.values.toList();
    emit(ReadAllapartSuccess());
  }
}
