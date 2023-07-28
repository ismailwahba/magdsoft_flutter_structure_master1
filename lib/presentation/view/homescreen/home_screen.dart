// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_local_variable, sized_box_for_whitespace, annotate_overrides

import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:magdsoft_flutter_structure_master1/business_logic/products/products_cubit.dart';
// import 'package:magdsoft_flutter_structure_master1/component/create_textform.dart';
// import 'package:magdsoft_flutter_structure_master1/constants/colors.dart';
import 'package:magdsoft_flutter_structure_master1/constants/hexa_color.dart';
// import 'package:magdsoft_flutter_structure_master1/constants/images.dart';
import 'package:magdsoft_flutter_structure_master1/presentation/widgets/homescreen/new_release_widget.dart';
import 'package:magdsoft_flutter_structure_master1/presentation/widgets/homescreen/productlist_widget.dart';
import 'package:magdsoft_flutter_structure_master1/presentation/widgets/homescreen/recomended_Product.dart';
import 'package:magdsoft_flutter_structure_master1/presentation/widgets/homescreen/search_widget.dart';
// import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
// import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    _getData();
    super.initState();
  }

  _getData() {
    ProductsCubit.get(context).getAllProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: SingleChildScrollView(
      scrollDirection: Axis.vertical,
      physics: ClampingScrollPhysics(),
      // clipBehavior: Clip.none,
      // shrinkWrap: true,

      // physics: ,
      child: Container(
          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 20.h),
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                HexColor("#0062BD").withOpacity(.80),
                HexColor("#ffffff").withOpacity(0)
              ])),
          child: Column(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                    height: MediaQuery.of(context).size.height * .07,
                    child: Search()),
                SizedBox(
                    height: MediaQuery.of(context).size.height * .3,
                    child: NewRelease()),
                SizedBox(
                  height: 20.h,
                ),
                SizedBox(
                    height: MediaQuery.of(context).size.height * .08,
                    child: ProductList()),
                SizedBox(
                  height: 20.h,
                ),
                RecomendedProducts()
              ])),
    )));
  }
}
