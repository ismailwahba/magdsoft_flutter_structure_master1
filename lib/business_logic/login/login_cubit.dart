// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:magdsoft_flutter_structure_master1/constants/strings.dart';
import 'package:magdsoft_flutter_structure_master1/data/models/login/login_model.dart';
import 'package:magdsoft_flutter_structure_master1/util/cach_helper.dart';
import 'package:magdsoft_flutter_structure_master1/util/cach_keys.dart';
import 'package:http/http.dart' as http;

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());
  static LoginCubit get(context) => BlocProvider.of(context);

  VerifyPhone? verifyPhone;
  var nameLoginController = TextEditingController();
  var phoneLoginController = TextEditingController();
  var formKeyLogin = GlobalKey<FormState>();
  // String _name = '', _phone = "";
  // String get name => _namee
  // String get phone => _phone;

  // void onNameChanged(String name) {
  //   _namee = name;
  //   emit(OnNameChanged());
  // }

  // void onPhoneChanged(String phone) {
  //   _phone = phone;
  //   emit(OnPhoneChanged());
  // }

  void userLogin({required String name, required String phone}) async {
    emit(LoginLoadingState());

    return await http.post(Uri.parse(login_Url),
        body: {"phone": phone, "name": name}).then((value) async {
      emit(LoginLoadingState());

      if (value.statusCode == 200) {
        print("bla");
        await CacheHelper.saveData(key: CacheKeys.name.name, value: name);
        await CacheHelper.saveData(key: CacheKeys.phone.name, value: phone);
        await CacheHelper.saveData(key: CacheKeys.islogin.name, value: true);

        var json = jsonDecode(value.body);
        verifyPhone = VerifyPhone.fromJson(json);
        CacheHelper.saveData(key: CachKeys.otp, value: verifyPhone!.code);
        print("+++++++++++++++++++++${verifyPhone!.code}");

        emit(LoginSuccessState());
      } else {
        print("error=======================");
        emit(LoginErrorState());
      }
    }).catchError((error) {
      print(error.toString());
      emit(LoginErrorState());
    });
  }
}
