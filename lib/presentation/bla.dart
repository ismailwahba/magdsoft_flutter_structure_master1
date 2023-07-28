// // ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers

// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:magdsoft_flutter_structure_master1/business_logic/login/login_cubit.dart';
// import 'package:magdsoft_flutter_structure_master1/component/create_textform.dart';
// import 'package:magdsoft_flutter_structure_master1/constants/colors.dart';
// import 'package:magdsoft_flutter_structure_master1/constants/hexa_color.dart';
// import 'package:magdsoft_flutter_structure_master1/constants/images.dart';
// import 'package:magdsoft_flutter_structure_master1/constants/strings.dart';

// class BlaScreen extends StatefulWidget {
//   const BlaScreen({super.key});

//   @override
//   State<BlaScreen> createState() => _BlaScreenState();
// }

// class _BlaScreenState extends State<BlaScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//           child: Container(
//         child: Stack(
//           alignment: Alignment.bottomCenter,
//           children: [
//             Container(
//               padding: EdgeInsets.only(bottom: 10.h),
//               decoration: BoxDecoration(
//                   image: DecorationImage(
//                       alignment: Alignment.topCenter,
//                       image: AssetImage(
//                         ImageAsset.city,
//                       ),
//                       fit: BoxFit.fitWidth)),
//               child: Container(
//                 decoration: BoxDecoration(
//                     gradient: LinearGradient(
//                         begin: Alignment.centerLeft,
//                         end: Alignment.centerRight,
//                         colors: [
//                       HexColor("#0062BD").withOpacity(.3),
//                       HexColor("#0062BD").withOpacity(.4)
//                     ])),
//               ),
//             ),
//             Positioned(
//               child: Container(
//                 padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 20.h),
//                 // width: ScreenUtil().setWidth(420),
//                 height: ScreenUtil().setHeight(420),
//                 decoration: BoxDecoration(
//                     borderRadius: BorderRadius.only(
//                         topLeft: Radius.circular(60.r),
//                         topRight: Radius.circular(60.r),
//                         bottomLeft: Radius.circular(0),
//                         bottomRight: Radius.circular(0)),
//                     color: Colors.white),
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.end,
//                   children: [
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                       // crossAxisAlignment: CrossAxisAlignment.center,
//                       children: [
//                         Container(
//                           width: ScreenUtil().setWidth(140),
//                           height: ScreenUtil().setHeight(1),
//                           decoration: BoxDecoration(
//                               color: HexColor("#639FD7"),
//                               borderRadius: BorderRadius.circular(50.r)),
//                         ),
//                         Text(
//                           "OR",
//                           style: TextStyle(
//                               fontSize: 20.sp, color: HexColor("#639FD7")),
//                         ),
//                         Container(
//                           width: ScreenUtil().setWidth(140),
//                           height: ScreenUtil().setHeight(1),
//                           decoration: BoxDecoration(
//                               color: HexColor("#639FD7"),
//                               borderRadius: BorderRadius.circular(50.r)),
//                         ),
//                       ],
//                     ),
//                     SizedBox(
//                       height: MediaQuery.of(context).size.height * .1,
//                     ),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         defaultButtonSocial(url: ImageAsset.facebook),
//                         defaultButtonSocial(url: ImageAsset.ios),
//                         defaultButtonSocial(url: ImageAsset.google),
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//             Positioned(
//                 bottom: 240,
//                 child: Container(
//                     height: MediaQuery.of(context).size.height * .45,
//                     width: ScreenUtil().setWidth(320),
//                     padding: EdgeInsets.symmetric(
//                         horizontal: 10.w, vertical: 10.h),
//                     decoration: BoxDecoration(
//                       color: HexColor("#FFFFFF"),
//                       boxShadow: [
//                         BoxShadow(
//                           color: HexColor('#00000040').withOpacity(.2),
//                           spreadRadius: 2,
//                           blurRadius: 6,
//                           offset: Offset(2, 2), // changes position of shadow
//                         ),
//                       ],
//                       borderRadius: BorderRadius.circular(40.r),
//                       // color: Colors.amber
//                     ),
//                     // width: ScreenUtil().setWidth(340),
//                     child: BlocConsumer<LoginCubit, LoginState>(
//                       listener: (context, state) {
//                         if (state is LoginErrorState) {
//                           ScaffoldMessenger.of(context).showSnackBar(
//                               const SnackBar(
//                                   content:
//                                       Text("Error,Please try again later")));

//                           // Toast.show("Error,Please try again later ",
//                           // duration: Toast.lengthLong, gravity: Toast.bottom);
//                         }
//                         if (state is LoginSuccessState) {
//                           // Toast.show("login success",
//                           //     duration: Toast.lengthLong, gravity: Toast.bottom);
//                           ScaffoldMessenger.of(context).showSnackBar(
//                               const SnackBar(content: Text("login success")));
//                           Navigator.pushReplacementNamed(
//                               context, routeHelpScreen);
//                         }
//                       },
//                       builder: (context, state) {
//                         var cubit = context.read<LoginCubit>();
//                         return Form(
//                             key: cubit.formKeyLogin,
//                             child: Column(
//                               mainAxisAlignment:
//                                   MainAxisAlignment.spaceBetween,
//                               children: [
//                                 Text(
//                                   "Welcome",
//                                   style: TextStyle(
//                                       fontSize: 30.sp,
//                                       fontWeight: FontWeight.w400,
//                                       color: HexColor("#464646")),
//                                 ),
//                                 Container(
//                                   decoration: BoxDecoration(
//                                     gradient: LinearGradient(
//                                       begin: Alignment.centerLeft,
//                                       end: Alignment.bottomRight,
//                                       colors: [
//                                         HexColor('#0062BD'),
//                                         HexColor('#0062BD').withOpacity(.6)
//                                       ],
//                                     ),
//                                   ),
//                                   height: ScreenUtil().setHeight(3),
//                                   width: ScreenUtil().setWidth(143),
//                                   // color: Colors.blue,
//                                 ),
//                                 // SizedBox(
//                                 //   height: 20.h,
//                                 // ),
//                                 defaultFormCreateScreen(
//                                   controller: cubit.nameLoginController,
//                                   hintText: "Enter Your Full Name",
//                                   hintStyle:
//                                       TextStyle(color: AppColor.hintcolor),
//                                   validator: (val) {
//                                     if (val!.isEmpty) {
//                                       return "Name Must Not Be Empty";
//                                     } else if (cubit
//                                             .nameLoginController.text.length <
//                                         2) {
//                                       return "The name must not be less than 3 letters";
//                                     }
//                                     return null;
//                                   },
//                                 ),
//                                 // SizedBox(
//                                 //   height: 20.h,
//                                 // ),
//                                 defaultFormCreateScreen(
//                                   controller: cubit.phoneLoginController,
//                                   hintText: "Enter Your Phone Number",
//                                   hintStyle:
//                                       TextStyle(color: AppColor.hintcolor),
//                                   validator: (val) {
//                                     if (val!.isEmpty) {
//                                       return "Phon Number Must Not Be Empty";
//                                     } else if (cubit.phoneLoginController.text
//                                             .length <
//                                         5) {
//                                       return "The phone number must not be less than 5 Numbers";
//                                     }
//                                     return null;
//                                   },
//                                   // onChanged: (phone) {}
//                                 ),
//                                 defaultButton(
//                                     onPressed: () {
//                                       if (cubit.formKeyLogin.currentState!
//                                           .validate()) {
//                                         LoginCubit.get(context).userLogin(
//                                             name: cubit
//                                                 .nameLoginController.text,
//                                             phone: cubit
//                                                 .phoneLoginController.text);
//                                       }
//                                     },
//                                     text: "Login",
//                                     width: ScreenUtil().setWidth(282),
//                                     height: ScreenUtil().setHeight(48)),
//                               ],
//                             ));
//                       },
//                     )))
//           ],
//         ),
//       )),
//     );
//   }
// }
