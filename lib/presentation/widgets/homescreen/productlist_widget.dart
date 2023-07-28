import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:magdsoft_flutter_structure_master1/business_logic/products/products_cubit.dart';
import 'package:magdsoft_flutter_structure_master1/constants/colors.dart';

class ProductList extends StatefulWidget {
  const ProductList({super.key});

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductsCubit, ProductsState>(builder: (context, index) {
      var cubit = context.read<ProductsCubit>();
      return ListView.separated(
          // shrinkWrap: true,
          // physics:,
          separatorBuilder: (context, index) => SizedBox(width: 20.w),
          scrollDirection: Axis.horizontal,
          itemCount: cubit.itmemProduct.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                setState(() {
                  cubit.selectedIndex = index;
                  // cubit.selectedIndex = !index;
                });
              },
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 3.w),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50.r),
                    color: cubit.selectedIndex == index
                        ? AppColor.primaryColor
                        : Colors.white),
                width: ScreenUtil().setWidth(110),
                height: ScreenUtil().setHeight(50),
                child: Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: 10.w, vertical: 10.h),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: AppColor.grey.withOpacity(.3),
                              spreadRadius: 2,
                              blurRadius: 7,
                              offset:
                                  Offset(0, 1), // changes position of shadow
                            ),
                          ],
                          shape: BoxShape.circle,
                          border: Border.all(
                              width: 1.w, color: AppColor.borderColor)),
                      child: CircleAvatar(
                        // maxRadius: 1.w,
                        radius: 22.r,
                        backgroundColor: Colors.white,
                        child: Image.asset(
                          "${cubit.itmemProduct[index].image}",
                          width: ScreenUtil().setWidth(21.w),
                        ),
                      ),
                    ),
                    Text(
                      "${ProductsCubit.get(context).itmemProduct[index].name}",
                      style: TextStyle(fontSize: 21.sp),
                    )
                  ],
                ),
              ),
            );
          });
    });
  }
}
