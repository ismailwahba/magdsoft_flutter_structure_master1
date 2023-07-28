import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:magdsoft_flutter_structure_master1/constants/strings.dart';
import 'package:magdsoft_flutter_structure_master1/data/models/otp/otp_model.dart';
import 'package:magdsoft_flutter_structure_master1/util/cach_helper.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;

part 'otp_state.dart';

class OtpCubit extends Cubit<OtpState> {
  OtpCubit() : super(OtpInitial());
    static OtpCubit get(context) => BlocProvider.of(context);

//   suggestedJob({required String code, required String phone}) async {
//     emit(LoadingOtpState());
//     String otp = await CacheHelper.getOtp();

//     return await http
//         .post(Uri.parse(otp_Url), body: {"code": $otp, "phone": phone}).then((value) async{
//           emit(LoadingOtpState());
// if (value.statusCode == 200) {
//       var json = jsonDecode(value.body);
//       final model = OtpModel.fromJson(json);
//       jobs = model.dataJobs ?? [];
//       emit(SuggestedJobSuccessState());

//       // }
//       print(" model : $model");
//       print(" Name : ${model.dataJobs?.first.name}");
//     } 
//         });
//     // print("hamada:  ${response.body}");
//     // print(response);
// // response.headers.addAll(headers);

//     // http.StreamedResponse resp =  response.send() as http.StreamedResponse;
//     else {
//       emit(SuggestedJobErrorState());
//       print("Exception");
//       throw Exception('Failed to load themes');
//     }
//   }
}
