// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers

import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:magdsoft_flutter_structure_master1/business_logic/help/help_cubit.dart';
import 'package:magdsoft_flutter_structure_master1/component/create_textform.dart';
import 'package:magdsoft_flutter_structure_master1/constants/colors.dart';
import 'package:magdsoft_flutter_structure_master1/constants/hexa_color.dart';

class HelpScreen extends StatefulWidget {
  const HelpScreen({super.key});

  @override
  State<HelpScreen> createState() => _HelpScreenState();
}

class _HelpScreenState extends State<HelpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                HexColor("#0062BD").withOpacity(.69),
                HexColor("#ffffff").withOpacity(0)
              ])),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * .1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Help",
                      style: TextStyle(
                          fontSize: 28.sp, color: HexColor("#FFFFFF")),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * .7,
                child: BlocBuilder<HelpCubit, HelpState>(
                  builder: (context, state) {
                    var cubit = context.read<HelpCubit>();
                    return ListView.builder(
                        shrinkWrap: false,
                        itemCount: cubit.help.length,
                        itemBuilder: (context, index) {
                          return Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20.r)),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 10.w, vertical: 8.h),
                              child: Container(
                                  width: ScreenUtil().setWidth(350),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10.r),
                                      color: HexColor("#FFFFFF")),
                                  child: Container(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 10.w),
                                    child: ExpandablePanel(
                                      theme: ExpandableThemeData(
                                          headerAlignment:
                                              ExpandablePanelHeaderAlignment
                                                  .center,
                                          tapBodyToCollapse: false,
                                          tapBodyToExpand: false),
                                      header: Text(
                                        "${cubit.help[index].question}",
                                        style: TextStyle(
                                            fontSize: 17.sp,
                                            color: AppColor.primaryColor),
                                      ),
                                      collapsed: Text(""),
                                      expanded: Container(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 10.w, vertical: 5.h),
                                        child: Text(
                                          "${cubit.help[index].answer}",
                                          style: TextStyle(
                                              fontSize: 17.sp,
                                              color: HexColor("#464646"),
                                              fontWeight: FontWeight.w400),
                                        ),
                                      ),
                                    ),
                                  )));
                        });
                  },
                ),
              ),
              defaultButton(
                  width: ScreenUtil().setWidth(282),
                  height: ScreenUtil().setHeight(48),
                  borderRadius: BorderRadius.circular(50.r),
                  text: "Continue",
                  onPressed: () {})
            ],
          ),
        ),
      ),
    );
  }
}
