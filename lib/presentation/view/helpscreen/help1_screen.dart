// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors

// import 'dart:html';

import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:magdsoft_flutter_structure_master1/constants/colors.dart';

class Help1Screen extends StatefulWidget {
  const Help1Screen({super.key});

  @override
  State<Help1Screen> createState() => _Help1ScreenState();
}

class _Help1ScreenState extends State<Help1Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Expanded(
        child: ListView.builder(
            itemCount: 4,
            itemBuilder: (context, index) {
              return Container(
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(20.r)),
                  // width: ScreenUtil().setWidth(50),
                  padding:
                      EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
                  child: Card(
                      // shape: ShapeBorder.lerp(20, b, t),
                      child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 10.w),
                    child: ExpandablePanel(
                      theme: ExpandableThemeData(
                          headerAlignment:
                              ExpandablePanelHeaderAlignment.center,
                          tapBodyToCollapse: false,
                          tapBodyToExpand: false),
                      header: Text(
                        "Expandable",
                        style: TextStyle(
                            fontSize: 17.sp, color: AppColor.primaryColor),
                      ),
                      collapsed: Text(""),
                      expanded: Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 10.w, vertical: 10.h),
                        child: Text(
                            """sdsdfsdhfhsdfhgsgfshdfkshgdhsgdhsdkjfsdfffffffffffff
                              fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
                              fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
                              ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
                              fffkjskdjfkjsdlfkjsdlkfjslkdjflksdjflksdjflkjsdfm,smdvkskjfksdvxcvn;kldfnksdnvmx 7
                              cmnv;kzsnd;kfjksjdkcx,vmzxjdklfjlskdvmlzxmclkmzsdklvnklzmcvzm'kl
                              dmfk'lzmv'klmz'lvmc'kzmcv'klmzxc'klbm'zklxmb"""),
                      ),
                    ),
                  )));
            }),
      )),
    );
  }
}
