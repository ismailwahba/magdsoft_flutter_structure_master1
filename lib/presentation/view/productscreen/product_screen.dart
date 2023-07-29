// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, sized_box_for_whitespace, avoid_unnecessary_containers, sort_child_properties_last, unnecessary_new

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:magdsoft_flutter_structure_master1/business_logic/products/products_cubit.dart';
import 'package:magdsoft_flutter_structure_master1/component/create_textform.dart';
import 'package:magdsoft_flutter_structure_master1/constants/colors.dart';
import 'package:magdsoft_flutter_structure_master1/constants/hexa_color.dart';
import 'package:magdsoft_flutter_structure_master1/constants/images.dart';
import 'package:magdsoft_flutter_structure_master1/presentation/widgets/productscreen/tabbar_widget.dart';

class ProductsScreen extends StatefulWidget {
  const ProductsScreen({super.key});

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  @override
  void initState() {
    ProductsCubit.get(context).getAllProducts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
              HexColor("#0062BD").withOpacity(.80),
              HexColor("#ffffff").withOpacity(0)
            ])),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * .15,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        children: [
                          Container(
                            width: ScreenUtil().setWidth(50),
                            height: ScreenUtil().setHeight(50),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15.r),
                            ),
                            child: IconButton(
                                onPressed: () {},
                                iconSize: 18.w,
                                icon: Icon(
                                  Icons.arrow_back_ios_new_sharp,
                                  color: HexColor("#B1B1B1"),
                                )),
                          )
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Predator Helios 300",
                            style: TextStyle(
                                letterSpacing: .1.w,
                                color: HexColor("#FFFFFF"),
                                fontSize: 18.sp,
                                fontWeight: FontWeight.w700),
                          ),
                          Text(
                            "Type: Gaming Laptop",
                            style: TextStyle(
                              letterSpacing: .1.w,
                              color: HexColor("#FFFFFF").withOpacity(.8),
                              fontSize: 15.sp,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * .64,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        height: ScreenUtil().setHeight(300),
                        width: ScreenUtil().setWidth(300),
                        decoration: BoxDecoration(
                            color: HexColor("#FFFFFF"),
                            boxShadow: [
                              BoxShadow(
                                color: AppColor.grey.withOpacity(.3),
                                spreadRadius: 2,
                                blurRadius: 7,
                                offset:
                                    Offset(0, 1), // changes position of shadow
                              ),
                            ],
                            border: Border.all(
                                width: 1.w, color: AppColor.borderColor),
                            borderRadius: BorderRadius.circular(20)),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(50.r),
                          clipBehavior: Clip.none,
                          child: Image.asset(
                            ImageAsset.nz3,
                          ),
                        ),
                      ),
                      BlocBuilder<ProductsCubit, ProductsState>(
                        builder: (context, state) {
                          var cubit = context.read<ProductsCubit>();
                          return SizedBox(
                            height: 100.h,
                            child: Container(
                              padding: EdgeInsets.symmetric(horizontal: 10.w),
                              // width: double.infinity,
                              child: ListView.separated(
                                  clipBehavior: Clip.none,
                                  physics: ClampingScrollPhysics(),
                                  shrinkWrap: true,
                                  // physics:,
                                  separatorBuilder: (context, index) =>
                                      SizedBox(width: 20.w),
                                  scrollDirection: Axis.horizontal,
                                  itemCount: cubit.products.length,
                                  itemBuilder: (context, index) {
                                    return Container(
                                        padding: EdgeInsets.symmetric(
                                            vertical: 10.h),
                                        clipBehavior: Clip.none,
                                        width: ScreenUtil().setWidth(100),
                                        decoration: BoxDecoration(
                                            boxShadow: [
                                              BoxShadow(
                                                color: HexColor("#00000033")
                                                    .withOpacity(.5),
                                                blurRadius: 6,
                                                spreadRadius: 1,
                                              )
                                            ],
                                            borderRadius:
                                                BorderRadius.circular(20.r),
                                            color: HexColor("#FFFFFF")),
                                        // cubit.selectedIndex == index
                                        // ? AppColor.primaryColor

                                        child: Image.network(
                                          "${cubit.products[index].image}",
                                        ));
                                  }),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * .20,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 10.w),
                        width: ScreenUtil().setWidth(300),
                        height: ScreenUtil().setHeight(75),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.r),
                          color: HexColor("#FFFFFF"),
                          boxShadow: [
                            BoxShadow(
                              color: HexColor("#00000033").withOpacity(.5),
                              blurRadius: 6,
                              spreadRadius: 1,
                            )
                          ],
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Container(
                                  width: ScreenUtil().setWidth(55),
                                  height: ScreenUtil().setHeight(55),
                                  decoration: BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(
                                          color: HexColor("#00000033")
                                              .withOpacity(.5),
                                          blurRadius: 6,
                                          spreadRadius: 1,
                                        )
                                      ],
                                      color: HexColor("#F3F3F3"),
                                      borderRadius:
                                          BorderRadius.circular(10.r)),
                                  child: Image.asset(
                                    ImageAsset.acerLogo,
                                    width: 60.w,
                                    height: 60.h,
                                  ),
                                ),
                                SizedBox(
                                  width: 10.w,
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Acer Official Store",
                                        style: TextStyle(
                                          fontSize: 18.sp,
                                          color: HexColor("#464646"),
                                          fontWeight: FontWeight.w400,
                                        )),
                                    Text("View Store",
                                        style: TextStyle(
                                          fontSize: 13.sp,
                                          color: AppColor.hintcolor,
                                          fontWeight: FontWeight.w400,
                                        )),
                                  ],
                                ),
                              ],
                            ),
                            Container(
                              child: Container(
                                width: ScreenUtil().setWidth(40),
                                height: ScreenUtil().setHeight(40),
                                decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      color:
                                          HexColor("#00000033").withOpacity(.5),
                                      blurRadius: 6,
                                      spreadRadius: 1,
                                    )
                                  ],
                                  color: HexColor("#F3F3F3"),
                                  borderRadius: BorderRadius.circular(10.r),
                                ),
                                child: ShaderMask(
                                  blendMode: BlendMode.srcIn,
                                  shaderCallback: (Rect bounds) =>
                                      RadialGradient(
                                    colors: [
                                      HexColor("#0062BD"),
                                      HexColor("#0062BD").withOpacity(0),
                                    ],
                                  ).createShader(bounds),
                                  child: IconButton(
                                    icon: Icon(
                                      Icons.arrow_forward_ios_rounded,
                                    ),
                                    onPressed: () {},
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * .12,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        // crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                "Price",
                                style: TextStyle(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w400,
                                    color: AppColor.hintcolor),
                              ),
                              Text(
                                "30,000 EGP",
                                style: TextStyle(
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.w400,
                                    color: HexColor("#464646")),
                              ),
                            ],
                          ),
                          defaultButton(
                              text: "Add To Cart",
                              onPressed: () {},
                              width: ScreenUtil().setWidth(190),
                              height: ScreenUtil().setHeight(44),
                              borderRadius: BorderRadius.circular(10.r),
                              textStyle: TextStyle(
                                  fontSize: 16.sp,
                                  color: HexColor("#FFFFFF"),
                                  fontWeight: FontWeight.w400))
                        ],
                      ),
                      Container(
                        width: ScreenUtil().setWidth(260),
                        height: ScreenUtil().setHeight(2),
                        color: AppColor.borderColor,
                      )
                    ],
                  ),
                ),
                SizedBox(
                    // height: MediaQuery.of(context).size.height * .07,
                    child: TabBarWidget()),
              ],
            ),
          ),
        ),
      )),
    );
  }
}
