// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:magdsoft_flutter_structure_master1/business_logic/help/help_cubit.dart';
import 'package:magdsoft_flutter_structure_master1/business_logic/login/login_cubit.dart';
import 'package:magdsoft_flutter_structure_master1/business_logic/mainLayOut/main_lay_out_cubit.dart';
import 'package:magdsoft_flutter_structure_master1/business_logic/products/products_cubit.dart';
import 'package:magdsoft_flutter_structure_master1/presentation/view/helpscreen/help1_screen.dart';
import 'package:magdsoft_flutter_structure_master1/presentation/view/helpscreen/help_screen.dart';
import 'package:magdsoft_flutter_structure_master1/presentation/view/homescreen/home_screen.dart';
import 'package:magdsoft_flutter_structure_master1/presentation/view/productscreen/product_screen.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MultiBlocProvider(
          providers: [
            BlocProvider(create: (context) => LoginCubit()),
            BlocProvider(create: (context) => MainLayOutCubit()),
            BlocProvider(create: (context) => ProductsCubit()),
            BlocProvider(create: (context) => HelpCubit()..getAllProducts()),
          ],
          child: const MaterialApp(
            debugShowCheckedModeBanner: false,
            // theme: ThemeData(brightness: Brightness.light),
            // darkTheme: ThemeData(brightness: Brightness.dark),
            // themeMode: ThemeMode.dark,

            // You can use the library anywhere in the app even in theme

            home: ProductsScreen(),
          ),
        );
      },
    );
  }
}
