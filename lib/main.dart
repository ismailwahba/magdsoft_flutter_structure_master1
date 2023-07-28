// ignore_for_file: duplicate_import

// import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:magdsoft_flutter_structure_master1/src/approot/app_root.dart';
import 'package:magdsoft_flutter_structure_master1/util/cach_helper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await CacheHelper.init();
  await CacheHelper.getData(key: '');
  // Bloc.observer = MyBlocObserver();

  runApp(MyApp());
}
