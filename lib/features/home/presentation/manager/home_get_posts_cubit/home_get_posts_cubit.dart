import '/features/home/data/repository/home_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'home_get_posts_state.dart';

class HomeGetPostsCubit extends Cubit<HomeGetPostsState> {
  final HomeRepo _homeRepo;

  HomeGetPostsCubit(this._homeRepo) : super(HomeGetPostsInitial());

  Future<void> fetchAllPosts({
    required String userId,
  }) async {
    emit(HomeGetPostsLoading());
    final result = await _homeRepo.fetchAllPosts(userId: userId);
    result.fold(
      (failures) => emit(HomeGetPostsFailure(failures.errMessage)),
      (result) => emit(HomeGetPostsSuccess(posts: result)),
    );
  }
}
