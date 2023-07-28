part of 'otp_cubit.dart';

@immutable
abstract class OtpState {}

class OtpInitial extends OtpState {}
class LoadingOtpState extends OtpState {}
class SuccessOtpState extends OtpState {}
class ErrorOtpState extends OtpState {}
