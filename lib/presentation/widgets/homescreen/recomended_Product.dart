import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:magdsoft_flutter_structure_master1/business_logic/products/products_cubit.dart';
import 'package:magdsoft_flutter_structure_master1/constants/colors.dart';
import 'package:magdsoft_flutter_structure_master1/constants/hexa_color.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class RecomendedProducts extends StatefulWidget {
  const RecomendedProducts({super.key});

  @override
  State<RecomendedProducts> createState() => _RecomendedProductsState();
}

class _RecomendedProductsState extends State<RecomendedProducts> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductsCubit, ProductsState>(
      builder: (context, state) {
        var cubit = context.read<ProductsCubit>();
        return MasonryGridView.count(
            crossAxisCount: 2,
            // childAspectRatio: 2 / 3.5,
            crossAxisSpacing: 26,
            mainAxisSpacing: 15,
            shrinkWrap: true,
            physics: ClampingScrollPhysics(),
            padding: EdgeInsets.zero,
            itemCount: cubit.products.length,
            itemBuilder: (ctx, index) {
              return index == 0
                  ? Text(
                      "Recomended\nfor You",
                      style: TextStyle(
                          fontSize: 28.sp,
                          color: HexColor("#464646"),
                          fontWeight: FontWeight.w400),
                    )
                  : Container(
                      height: ScreenUtil().setHeight(280),
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: AppColor.grey.withOpacity(.3),
                            spreadRadius: 2,
                            blurRadius: 7,
                            offset: Offset(0, 1), // changes position of shadow
                          ),
                        ],
                        color: HexColor("#FFFFFF"),
                        border:
                            Border.all(color: AppColor.borderColor, width: 1.w),
                        borderRadius: BorderRadius.circular(20.r),
                      ),
                      child: GridTile(
                          child: Stack(
                        alignment: Alignment.bottomRight,
                        children: [
                          Column(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    color: HexColor("#FFFFFF"),
                                    boxShadow: [
                                      BoxShadow(
                                        color: AppColor.grey.withOpacity(.3),
                                        spreadRadius: 2,
                                        blurRadius: 7,
                                        offset: Offset(
                                            0, 1), // changes position of shadow
                                      ),
                                    ],
                                    border: Border.all(
                                        width: 1.w,
                                        color: AppColor.borderColor),
                                    borderRadius: BorderRadius.circular(20)),
                                child: Stack(
                                  alignment: Alignment.topRight,
                                  children: [
                                    Image.network(
                                      "${cubit.products[index].image}",
                                      width: ScreenUtil().setWidth(166),
                                      height: ScreenUtil().setHeight(166),
                                      // fit: BoxFit.cover,
                                    ),
                                    Positioned(
                                      // right: -6.w,
                                      // top: 22.h,
                                      child: IconButton(
                                          iconSize: 25.w,
                                          onPressed: () {},
                                          icon: Icon(
                                            MdiIcons.heartOutline,
                                          )),
                                    )
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  padding: EdgeInsets.only(left: 8.w),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Row(
                                            children: [
                                              Text(
                                                "${cubit.products[index].company}",
                                                style: TextStyle(
                                                    fontSize: 20.sp,
                                                    color:
                                                        AppColor.primaryColor,
                                                    fontWeight:
                                                        FontWeight.w400),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              Text(
                                                "${cubit.products[index].name}",
                                                style: TextStyle(
                                                    fontSize: 12.sp,
                                                    color: HexColor("#464646")
                                                        .withOpacity(.6)),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            "${cubit.products[index].price}",
                                            style: TextStyle(
                                                fontSize: 13.sp,
                                                color: HexColor("#464646")
                                                    .withOpacity(.6)),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Positioned(
                              child: Container(
                            width: ScreenUtil().setWidth(40),
                            height: ScreenUtil().setHeight(40),
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.centerLeft,
                                end: Alignment.bottomRight,
                                colors: [
                                  HexColor('#0062BD'),
                                  HexColor('#0062BD').withOpacity(.4)
                                ],
                              ),
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(20.r),
                                  bottomRight: Radius.circular(12.r)),
                            ),
                            child: IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.add,
                                  color: Colors.white,
                                )),
                          ))
                        ],
                      )));
            });
      },
    );
  }
}
