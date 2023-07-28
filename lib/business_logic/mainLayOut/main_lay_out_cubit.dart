import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:magdsoft_flutter_structure_master1/presentation/view/homescreen/home_screen.dart';
import 'package:magdsoft_flutter_structure_master1/presentation/view/helpscreen/help_screen.dart';
import 'package:magdsoft_flutter_structure_master1/presentation/view/login/login_screen.dart';
import 'package:magdsoft_flutter_structure_master1/presentation/view/productscreen/product_screen.dart';
import 'package:magdsoft_flutter_structure_master1/presentation/view/settingscreen/setting_screen.dart';
import 'package:magdsoft_flutter_structure_master1/presentation/view/verifyphone/verify_phone.dart';

part 'main_lay_out_state.dart';

class MainLayOutCubit extends Cubit<MainLayOutState> {
  MainLayOutCubit() : super(MainLayOutInitial());
  static MainLayOutCubit get(context) => BlocProvider.of(context);
  int currentIndex = 0;
  List<Widget> screens = const [
    HomeScreen(),
    LoginScreen(),
    HelpScreen(),
    Verification(),
    ProductsScreen(),
  ];

  void changeIndex(int index) {
    currentIndex = index;
    emit(HomelayoutChangeBottomNavBarState());
  }
}
