import 'package:bloc/bloc.dart';
import 'package:home4u/features/user/home/data/repos/home_repos.dart';

import 'home_state.dart';


class HomeCubit extends Cubit<HomeState> {
  final HomeRepos homeRepos;
  HomeCubit(this.homeRepos) : super(HomeState.initial());


  Future<void>  getTopBestSeller() async {
    emit(HomeState.getTopBestSellerLoading());
    final result = await homeRepos.getTopBestSeller();
    result.when(
      success: (data) {
        emit(HomeState.getTopBestSellerSuccess(data));
      },
      failure: (error) {
        emit(HomeState.getTopBestSellerError(error.message.toString()));
      },
    );
  }

  Future<void> getHighestRated() async {
    emit(HomeState.getHighestRatedLoading());
    final result = await homeRepos.getHighestRated();
    result.when(
      success: (data) {
        emit(HomeState.getHighestRatedSuccess(data));
      },
      failure: (error) {
        emit(HomeState.getHighestRatedError(error.message.toString()));
      },
    );
  }

  Future<void> getRecommendedForYou(int userId) async {
    emit(HomeState.getRecommendedForYouLoading());
    final result = await homeRepos.getRecommendedForYou(userId);
    result.when(
      success: (data) {
        emit(HomeState.getRecommendedForYouSuccess(data));
      },
      failure: (error) {
        emit(HomeState.getRecommendedForYouError(error.message.toString()));
      },
    );
  }

  // top engineers
  Future<void> getTopEngineers() async {
    emit(HomeState.geTopEngineersLoading());
    final result = await homeRepos.getTopEngineers();
    result.when(
      success: (data) {
        emit(HomeState.getTopEngineersSuccess(data));
      },
      failure: (error) {
        emit(HomeState.getTopEngineersError(error.message.toString()));
      },
    );
  }

  // top workers
  Future<void> getTopWorkers() async {
    emit(HomeState.geTopWorkersLoading());
    final result = await homeRepos.getTopWorkers();
    result.when(
      success: (data) {
        emit(HomeState.getTopWorkersSuccess(data));
      },
      failure: (error) {
        emit(HomeState.getTopWorkersError(error.message.toString()));
      },
    );
  }

}
