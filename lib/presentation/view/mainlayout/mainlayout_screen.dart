// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:magdsoft_flutter_structure_master1/business_logic/mainLayOut/main_lay_out_cubit.dart';
import 'package:magdsoft_flutter_structure_master1/constants/hexa_color.dart';
import 'package:magdsoft_flutter_structure_master1/constants/images.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class HomeLayoutScreen extends StatefulWidget {
  const HomeLayoutScreen({super.key});

  @override
  State<HomeLayoutScreen> createState() => _HomeLayoutScreenState();
}

class _HomeLayoutScreenState extends State<HomeLayoutScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainLayOutCubit, MainLayOutState>(
      builder: (context, state) {
        var cubit = context.read<MainLayOutCubit>();

        return Scaffold(
            extendBodyBehindAppBar: true,
            extendBody: true,
            body: cubit.screens[cubit.currentIndex],
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                cubit.changeIndex(0);
              },
              child: Icon(
                Icons.home,
                color: cubit.currentIndex == 0 ? Colors.white : Colors.grey,
              ),
            ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerDocked,
            bottomNavigationBar: BottomAppBar(
              shape: CircularNotchedRectangle(),
              // notchMargin: 10,
              child: Container(
                height: ScreenUtil().setHeight(40),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        MaterialButton(
                          onPressed: () {},
                          minWidth: 40.w,
                          child: IconButton(
                              iconSize: 25.w,
                              color: cubit.currentIndex == 1
                                  ? Colors.blue
                                  : Colors.grey,
                              onPressed: () {
                                cubit.changeIndex(1);
                              },
                              icon: Icon(MdiIcons.login)),
                        ),
                        MaterialButton(
                          onPressed: () {},
                          minWidth: 40.w,
                          child: IconButton(
                              iconSize: 25.w,
                              color: cubit.currentIndex == 2
                                  ? Colors.blue
                                  : Colors.grey,
                              onPressed: () {
                                cubit.changeIndex(2);
                              },
                              icon: Icon(MdiIcons.heart)),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        MaterialButton(
                          onPressed: () {},
                          minWidth: 40.w,
                          child: IconButton(
                              iconSize: 25.w,
                              color: cubit.currentIndex == 3
                                  ? Colors.blue
                                  : Colors.grey,
                              onPressed: () {
                                cubit.changeIndex(3);
                              },
                              icon: Icon(MdiIcons.bellBadge)),
                        ),
                        MaterialButton(
                          onPressed: () {},
                          minWidth: 40.w,
                          child: IconButton(
                              iconSize: 25.w,
                              color: cubit.currentIndex == 4
                                  ? Colors.blue
                                  : Colors.grey,
                              onPressed: () {
                                cubit.changeIndex(4);
                              },
                              icon: Icon(MdiIcons.cog)),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ));
      },
    );
  }
}
