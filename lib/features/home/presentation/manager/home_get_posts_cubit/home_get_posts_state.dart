import '/features/posts/data/model/post_model/post_model.dart';

abstract class HomeGetPostsState {}

final class HomeGetPostsInitial extends HomeGetPostsState {}

final class HomeGetPostsLoading extends HomeGetPostsState {}

final class HomeGetPostsSuccess extends HomeGetPostsState {
  List<PostModel> posts;
  HomeGetPostsSuccess({required this.posts});
}

final class HomeGetPostsFailure extends HomeGetPostsState {
  String errMessage;
  HomeGetPostsFailure(this.errMessage);
}
