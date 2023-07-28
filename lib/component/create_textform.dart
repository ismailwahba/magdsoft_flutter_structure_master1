import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:magdsoft_flutter_structure_master1/constants/colors.dart';
import 'package:magdsoft_flutter_structure_master1/constants/hexa_color.dart';
import 'package:magdsoft_flutter_structure_master1/constants/images.dart';

Widget defaultFormCreateScreen(
        {required String hintText,
        Widget? prefix,
        Widget? suffix,
        // Function(String)? onChanged,
        required String? Function(String?)? validator,
        TextEditingController? controller,
        EdgeInsetsGeometry? contentPadding,
        obscureText = false,
        TextStyle? hintStyle}) =>
    Container(
      width: ScreenUtil().setWidth(282),
      // height: ScreenUtil().setHeight(48),
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
          color: HexColor('#00000040').withOpacity(.2),
          spreadRadius: 2,
          blurRadius: 6,
          offset: Offset(2, 2), // changes position of shadow
        ),
      ]),
      child: TextFormField(
          obscureText: obscureText,
          keyboardType: TextInputType.text,
          controller: controller,
          decoration: InputDecoration(
            // contentPadding: contentPadding,
            filled: true,
            fillColor: HexColor('#ffffff'),
            hintText: hintText,
            hintStyle: hintStyle,
            prefixIcon: prefix,
            focusColor: Colors.green,
            iconColor: Colors.green,
            suffixIcon: suffix,
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.r),
                borderSide: BorderSide(
                  // style: BorderStyle.none,
                  color: AppColor.borderColor,
                  // width: .1
                )),
          ),
          // onChanged: onChanged,

          validator: validator),
    );

Widget defaultButton(
        {required String text,
        required void Function()? onPressed,
        BorderRadiusGeometry? borderRadius,
        TextStyle? textStyle,
        double? width,
        double? height}) =>
    Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: borderRadius,
        gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.bottomRight,
          colors: [HexColor('#0062BD'), HexColor('#0062BD').withOpacity(.4)],
        ),
      ),
      child: MaterialButton(
        onPressed: onPressed,
        child: Text(
          text,
          style: textStyle
          // TextStyle(
          //     color: Colors.white,
          //     fontSize: 20.0.sp,
          //     fontWeight: FontWeight.w400),
        ),
      ),
    );
Widget defaultButtonSocial({
  required String url,
}) =>
    Container(
      // width: ScreenUtil().setWidth(52),
      // height: ScreenUtil().setHeight(50),
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: HexColor('#00000040').withOpacity(.2),
              spreadRadius: 2,
              blurRadius: 6,
              offset: Offset(2, 2), // changes position of shadow
            ),
          ],
          color: HexColor('#FFFFFF'),
          shape: BoxShape.circle,
          border: Border.all(width: 2.0, color: HexColor('#F4F4F4'))),
      child: MaterialButton(onPressed: () {}, child: Image.asset(url)),
    );
