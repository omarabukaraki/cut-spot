part of 'add_image_cubit.dart';

abstract class AddImagesState {}

class AddImagesInitial extends AddImagesState {}

class UploadImagesLoading extends AddImagesState {}

class AddImagesSuccess extends AddImagesState {
  List<File> image = [];
  AddImagesSuccess({required this.image});
}

class AddImagesFailure extends AddImagesState {
  String errMessage;
  AddImagesFailure({
    required this.errMessage,
  });
}

class UploadImagesSuccess extends AddImagesState {
  List<String> url = [];
  UploadImagesSuccess({required this.url});
}

class UploadImagesFailure extends AddImagesState {
  String errMessage;
  UploadImagesFailure({
    required this.errMessage,
  });
}
