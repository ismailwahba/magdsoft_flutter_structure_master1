import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:magdsoft_flutter_structure_master1/constants/colors.dart';
import 'package:magdsoft_flutter_structure_master1/constants/hexa_color.dart';

class Search extends StatelessWidget {
  const Search({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      // crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          width: ScreenUtil().setWidth(270),
          height: ScreenUtil().setHeight(50),
          child: TextFormField(
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
                filled: true,
                fillColor: HexColor("#FFFFFF"),
                hintText: "Search",
                hintStyle: TextStyle(
                  color: AppColor.hintcolor,
                  fontSize: 16.sp,
                ),
                suffixIcon: Icon(
                  Icons.search,
                  color: AppColor.hintcolor,
                  size: 24.w,
                ),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(
                        // style: BorderStyle.none,
                        color: Color.fromARGB(45, 168, 159, 159),
                        width: .3.w)),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.r),
                  borderSide: BorderSide(
                    color: AppColor.borderColor,
                  ),
                )),
          ),
        ),
        Container(
          width: ScreenUtil().setWidth(50),
          height: ScreenUtil().setHeight(50),
          decoration: BoxDecoration(
              color: HexColor("#FFFFFF"),
              borderRadius: BorderRadius.circular(15.r)),
          child: IconButton(
              iconSize: 20.w,
              onPressed: () {},
              icon: Icon(
                Icons.filter_alt,
                color: AppColor.hintcolor,
              )),
        )
      ],
    );
  }
}
