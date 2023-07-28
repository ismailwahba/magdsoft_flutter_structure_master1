// ignore_for_file: body_might_complete_normally_nullable, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:magdsoft_flutter_structure_master1/business_logic/login/login_cubit.dart';
import 'package:magdsoft_flutter_structure_master1/business_logic/mainLayOut/main_lay_out_cubit.dart';
import 'package:magdsoft_flutter_structure_master1/constants/strings.dart';
import 'package:magdsoft_flutter_structure_master1/presentation/view/helpscreen/help_screen.dart';
import 'package:magdsoft_flutter_structure_master1/presentation/view/login/login_screen.dart';
import 'package:magdsoft_flutter_structure_master1/presentation/view/mainlayout/mainlayout_screen.dart';

class AppRouter {
  // AppRouter() {}
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case routeLoginScreen:
        {
          return MaterialPageRoute(
              builder: (_) => BlocProvider(
                    create: (context) => LoginCubit(),
                    child: LoginScreen(),
                  ));
        }
      case routeMainLayOutScreen:
        {
          return MaterialPageRoute(
              builder: (_) => BlocProvider(
                    create: (context) => MainLayOutCubit(),
                    child: HomeLayoutScreen(),
                  ));
        }
      // case routeHelpScreen:
      //   {
      //     return MaterialPageRoute(
      //         builder: (_) => BlocProvider(
      //               create: (context) => MainLayOutCubit(),
      //               child: HelpScreen(),
      //             ));
      //   }
    }
  }
}
