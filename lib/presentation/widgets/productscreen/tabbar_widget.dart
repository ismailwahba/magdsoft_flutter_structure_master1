// ignore_for_file: unnecessary_string_interpolations, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:magdsoft_flutter_structure_master1/business_logic/products/products_cubit.dart';
import 'package:magdsoft_flutter_structure_master1/constants/hexa_color.dart';

class TabBarWidget extends StatefulWidget {
  const TabBarWidget({super.key});

  @override
  State<TabBarWidget> createState() => _TabBarWidgetState();
}

class _TabBarWidgetState extends State<TabBarWidget> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductsCubit, ProductsState>(builder: (ctx, index) {
      var cubit = context.read<ProductsCubit>();
      return Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * .1,
            child: Stack(
              children: [
                SizedBox(
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      physics: BouncingScrollPhysics(),
                      itemCount: cubit.tabs.length,
                      itemBuilder: (ctx, index) {
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              cubit.current = index;
                            });
                          },
                          child: Padding(
                            padding: EdgeInsets.only(
                                left: index == 0 ? 10.w : 50.w, top: 10.h),
                            child: Text(
                              "${cubit.tabs[index]}",
                              style: GoogleFonts.ubuntu(
                                  fontSize:
                                      cubit.current == index ? 18.sp : 16.sp,
                                  fontWeight: cubit.current == index
                                      ? FontWeight.w400
                                      : FontWeight.w300,
                                  color: cubit.current == index
                                      ? HexColor("#464646")
                                      : HexColor("#B1B1B1")),
                            ),
                          ),
                        );
                      }),
                ),
                AnimatedPositioned(
                  bottom: 0,
                  top: 20,
                  left: cubit.changePositionedOfDot(),
                  curve: Curves.fastLinearToSlowEaseIn,
                  duration: Duration(milliseconds: 500),
                  child: AnimatedContainer(
                    margin: EdgeInsets.only(left: 10.w),
                    duration: Duration(milliseconds: 500),
                    width: ScreenUtil().setWidth(8),
                    height: ScreenUtil().setHeight(8),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          HexColor('#0062BD'),
                          HexColor('#0062BD').withOpacity(.4)
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          Text(
            """${cubit.tabs[cubit.current]}Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer nec odio. Praesent libero. Sed cursus ante dapibus diam. Sed nisi. Nulla quis sem at nibh elementum imperdiet. Duis sagittis ipsum. Praesent mauris. Fusce nec tellus sed augue semper porta. Mauris massa. Vestibulum lacinia arcu eget nulla. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Curabitur sodales ligula in libero. 
Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer nec odio. Praesent libero. Sed cursus ante dapibus diam. Sed nisi. Nulla quis sem at nibh elementum imperdiet. Duis sagittis ipsum. Praesent mauris. Fusce nec tellus sed augue semper porta. Mauris massa. Vestibulum lacinia arcu eget nulla. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Curabitur sodales ligula in libero.  """,
            textAlign: TextAlign.start,
            // maxLines: 10,
            // overflow: TextOverflow.ellipsis,
          )
        ],
      );
    });
  }
}
