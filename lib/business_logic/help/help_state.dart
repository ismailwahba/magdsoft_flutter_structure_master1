// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'help_cubit.dart';

abstract class HelpState {}

class HelpInitial extends HelpState {}

class HelpLoadingState extends HelpState {}

class HelpSuccessState extends HelpState {}

class HelpErrorState extends HelpState {
  String message;
  HelpErrorState({
    required this.message,
  });
}
