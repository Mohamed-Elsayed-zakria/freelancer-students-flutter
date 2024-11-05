abstract class AddPersonalPictureState {}

final class AddPersonalPictureInitial extends AddPersonalPictureState {}

class UploadImageFromDeviceLoading extends AddPersonalPictureState {}

class UploadImageFromDeviceSuccess extends AddPersonalPictureState {}

class UploadImageFromDeviceFailure extends AddPersonalPictureState {
  String errMessage;
  UploadImageFromDeviceFailure(this.errMessage);
}

class UploadImageToDatabaseLoading extends AddPersonalPictureState {}

class UploadImageToDatabaseSuccess extends AddPersonalPictureState {}

class UploadImageToDatabaseFailure extends AddPersonalPictureState {
  String errMessage;
  UploadImageToDatabaseFailure(this.errMessage);
}
