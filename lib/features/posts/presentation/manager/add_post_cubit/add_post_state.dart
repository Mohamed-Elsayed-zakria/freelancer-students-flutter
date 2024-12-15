abstract class AddPostState {}

final class AddPostInitial extends AddPostState {}

final class AddPostLoading extends AddPostState {}

final class AddPostSuccess extends AddPostState {}

final class AddPostFailure extends AddPostState {
  final String errMessage;

  AddPostFailure(this.errMessage);
}

final class AddPostUploadImageLoading extends AddPostState {}

final class AddPostUploadImageSuccess extends AddPostState {}

final class AddPostUploadImageFailure extends AddPostState {
  final String errMessage;

  AddPostUploadImageFailure(this.errMessage);
}

final class AddPostUploadVideoLoading extends AddPostState {}

final class AddPostUploadVideoSuccess extends AddPostState {}

final class AddPostUploadVideoFailure extends AddPostState {
  final String errMessage;

  AddPostUploadVideoFailure(this.errMessage);
}
