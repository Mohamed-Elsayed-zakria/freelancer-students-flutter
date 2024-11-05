import '/features/auth/data/repository/register_repo.dart';
import '/features/auth/data/models/register_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import '/core/utils/my_date_util.dart';
import '/core/errors/failures.dart';
import '/core/constant/colors.dart';
import 'package:dartz/dartz.dart';
import 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  final RegisterRepo _registerRepo;
  RegisterCubit(this._registerRepo) : super(RegisterInitial());

  final TextEditingController getUsername = TextEditingController();
  final TextEditingController getFullName = TextEditingController();
  final TextEditingController getEmail = TextEditingController();
  final TextEditingController getPassword = TextEditingController();
  final TextEditingController getRetypePassword = TextEditingController();

  final GlobalKey<FormState> formKeyRegister = GlobalKey();

  final RegExp validCharacters = RegExp(r'^[a-z0-9_]+$');

  bool passwordVisibility = true;
  bool rePasswordVisibility = true;

  void showPasswordVisibility() {
    passwordVisibility = !passwordVisibility;
    emit(RegisterInitial());
  }

  void showRePasswordVisibility() {
    rePasswordVisibility = !rePasswordVisibility;
    emit(RegisterInitial());
  }

  // taking age
  bool validatorAge = true;

  DateTime? dateOfBirth;
  final DateTime dateNow = MyDateUtil.currentDateTimeFromDevice();
  final DateTime initialDate = MyDateUtil.currentDateTimeFromDevice()
      .subtract(const Duration(days: 365 * 10));
  final DateTime firstDate = MyDateUtil.currentDateTimeFromDevice()
      .subtract(const Duration(days: 365 * 100));

  void validatorAgeField() {
    if (dateOfBirth == null) {
      validatorAge = false;
      emit(RegisterInitial());
    } else {
      validatorAge = true;
      emit(RegisterInitial());
    }
  }

  Future<void> customShowDatePicker({
    required BuildContext context,
  }) async {
    dateOfBirth = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: firstDate,
      lastDate: dateNow,
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
            colorScheme: const ColorScheme.light(
              primary: AppColors.kPrimaryColor,
              onSurface: Colors.black,
            ),
            dialogBackgroundColor: Colors.white,
          ),
          child: child!,
        );
      },
    );
    emit(RegisterInitial());
  }

  // gender
  String? gender;
  bool validatorGender = true;

  void setGender(String gender) {
    this.gender = gender;
    emit(RegisterInitial());
  }


  void validatorGenderField() {
    if (gender == null) {
      validatorGender = false;
      emit(RegisterInitial());
    } else {
      validatorGender = true;
      emit(RegisterInitial());
    }
  }

  Future<void> createNewAccount({
    required RegisterModel regiseterModel,
  }) async {
    emit(RegisterLoading());
    Either<Failures, void> result = await _registerRepo.register(
      registerModel: regiseterModel,
    );
    result.fold(
      (failures) => emit(RegisterFailure(failures.errMessage)),
      (result) => emit(RegisterSuccess()),
    );
  }
}
