import 'package:flutter_bloc/flutter_bloc.dart';

class DropDownFormFieldCubit extends Cubit<String> {
  DropDownFormFieldCubit() : super("");

  void updateDropValue(String newValue) {
    emit(newValue);
  }
}