import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:magdsoft_flutter_structure_master1/constants/hexa_color.dart';
import 'package:magdsoft_flutter_structure_master1/constants/images.dart';

class NewRelease extends StatelessWidget {
  const NewRelease({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomLeft,
      children: [
        ClipRRect(
            borderRadius: BorderRadius.circular(20.r),
            child: Image.asset(
              ImageAsset.acerpredator,
              width: ScreenUtil().setWidth(320),
            )),
        Positioned(
            left: 20.w,
            bottom: 10.h,
            child: Text(
              "New Release\nAcer Predator Helios 300",
              style: TextStyle(
                  fontSize: 14.sp,
                  color: HexColor("#FFFFFF"),
                  height: 1.2.h,
                  letterSpacing: .2,
                  fontWeight: FontWeight.w400),
            )),
      ],
    );
  }
}
