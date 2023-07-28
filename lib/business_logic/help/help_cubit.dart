import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:magdsoft_flutter_structure_master1/constants/strings.dart';
import 'package:magdsoft_flutter_structure_master1/data/models/helpscreen/help_model.dart';
import 'package:http/http.dart' as http;

part 'help_state.dart';

class HelpCubit extends Cubit<HelpState> {
  HelpCubit() : super(HelpInitial());
  List<Help> help = [];
  getAllProducts() async {
    emit(HelpLoadingState());

    final response = await http.get(Uri.parse("http://magdsoft.ahmedshawky.fun/api/getHelp"));

    if (response.statusCode == 200) {
      final itemProduct = jsonDecode(response.body);
      final model = HelpModel.fromJson(itemProduct);
      help = model.help ?? [];
      emit(HelpSuccessState());
    } else {
      emit(HelpErrorState(message: "Faild"));
    }
  }
}
