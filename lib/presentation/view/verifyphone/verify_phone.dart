// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_verification_code/flutter_verification_code.dart';
import 'package:magdsoft_flutter_structure_master1/component/create_textform.dart';
import 'package:magdsoft_flutter_structure_master1/constants/hexa_color.dart';

class Verification extends StatefulWidget {
  const Verification({super.key});

  @override
  State<Verification> createState() => _VerificationState();
}

class _VerificationState extends State<Verification> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.topCenter,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomCenter,
                colors: [
              HexColor("#0062BD").withOpacity(.80),
              HexColor("#0062BD").withOpacity(0)
            ])),
        child: SafeArea(
            child: Container(
          margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * .2,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Verify Phone",
                        style: TextStyle(
                          fontSize: 28.sp,
                          color: HexColor("#FFFFFF").withOpacity(.8),
                        ),
                      ),
                    ],
                  ),
                ),
                Column(
                  // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * .48,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            // crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(100.r)),
                                child: VerificationCode(
                                  // digitsOnly: true,

                                  fullBorder: true,
                                  itemSize: 60.w,
                                  textStyle: TextStyle(
                                      fontSize: 33.0.sp,
                                      color: HexColor('#09051C')),
                                  keyboardType: TextInputType.number,
                                  underlineColor: Colors
                                      .amber, // If this is null it will use primaryColor: Colors.red from Theme
                                  length: 4,

                                  cursorColor: Colors
                                      .blue, // If this is null it will default to the ambient
                                  // clearAll is NOT required, you can delete it
                                  // takes any widget, so you can implement your design
                                  clearAll: Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 8.w, vertical: 8.h),
                                  ),
                                  onCompleted: (String value) {
                                    // setState(() {
                                    //   _code = value;
                                    // }
                                    // );
                                  },
                                  onEditing: (bool value) {
                                    // setState(() {
                                    //   _onEditing = value;
                                    // });
                                    // if (!_onEditing) FocusScope.of(context).unfocus();
                                  },
                                ),
                              ),
                            ],
                          ),
                          TextButton(
                              onPressed: () {},
                              child: Text(
                                "Resend Code",
                                style: TextStyle(
                                    fontSize: 19.sp,
                                    color: HexColor("#0062BD"),
                                    fontWeight: FontWeight.w400),
                              )),
                        ],
                      ),
                    )
                  ],
                ),
                defaultButton(
                    text: "Verify",
                    width: ScreenUtil().setWidth(343),
                    height: ScreenUtil().setHeight(57),
                    onPressed: () {})
              ],
            ),
          ),
        )),
      ),
    );
  }
}
