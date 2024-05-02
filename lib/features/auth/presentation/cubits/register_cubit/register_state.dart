part of 'register_cubit.dart';

abstract class RegisterState {}

class RegisterInitial extends RegisterState {}

class RegisterSuccess extends RegisterState {}

class RegisterLodging extends RegisterState {}

class RegisterFailure extends RegisterState {
  final String errMassage;
  RegisterFailure({required this.errMassage});
}
