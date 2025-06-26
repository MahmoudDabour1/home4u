import 'package:bloc/bloc.dart';
import 'package:home4u/features/projects_filter/data/models/ask_filter/ask_technical_worker_filter_body.dart';
import 'package:home4u/features/projects_filter/data/models/ask_filter/ask_technical_worker_filter_response_model.dart';
import 'package:home4u/features/projects_filter/data/repository/projects_filter_repository.dart';
import 'package:home4u/features/projects_filter/logic/projects_filter_state.dart';

import '../../../core/routing/router_observer.dart';
import '../data/models/renovate_house_filter/renovate_house_filter_body.dart';
import '../data/models/renovate_house_filter/renovate_house_filter_response_model.dart';
import '../data/models/request_design_filter/request_design_filter_body.dart';
import '../data/models/request_design_filter/request_design_filter_response_model.dart';

class ProjectsFilterCubit extends Cubit<ProjectsFilterState> {
  ProjectsFilterRepository projectsFilterRepository;

  ProjectsFilterCubit(this.projectsFilterRepository)
      : super(const ProjectsFilterState.initial());

  ///Filter
  int _requestDesignPage = 0;
  bool hasReachedMaxOfRequestDesign = false;
  List<RequestDesignFilterContent> requestDesignItems = [];
  bool isFetchingRequestDesign = false;

  Future<void> getRequestDesignFilter({bool isRefresh = false}) async {
    ///get any data help you here ....

    if (isFetchingRequestDesign) return;
    isFetchingRequestDesign = true;

    if (!isRefresh && hasReachedMaxOfRequestDesign) {
      isFetchingRequestDesign = false;
      return;
    }

    if (isRefresh) {
      _requestDesignPage = 0;
      hasReachedMaxOfRequestDesign = false;
      requestDesignItems.clear();
    } else if (_requestDesignPage > 0) {
      emit(ProjectsFilterState.paginationLoading());
    } else {
      emit(ProjectsFilterState.requestDesignFilterLoading());
    }

    final requestDesignFilterBody = RequestDesignFilterBody(
      pageNumber: _requestDesignPage,
      searchCriteria: SearchCriteria(
        userId: null,
        unitTypeId: null,
        governorateId: null,
        requiredDurationFrom: null,
        requiredDurationTo: null,
        unitAreaFrom: null,
        unitAreaTo: null,
        budgetFrom: null,
        budgetTo: null,
      ),
    );
    final result = await projectsFilterRepository
        .requestDesignFilter(requestDesignFilterBody);

    result.when(
      success: (data) {
        final newItems = data.data?.content ?? [];
        if (newItems.isEmpty) {
          hasReachedMaxOfRequestDesign = true;
        } else {
          requestDesignItems.addAll(newItems);
          _requestDesignPage++;
          hasReachedMaxOfRequestDesign =
              _requestDesignPage >= (data.data?.totalPages ?? 1);
        }
        if (!isClosed) {
          emit(ProjectsFilterState.requestDesignFilterSuccess(data));
        }
      },
      failure: (error) {
        if (!isClosed) {
          emit(ProjectsFilterState.requestDesignFilterFailure(
            error: error.message.toString(),
          ));
        }
      },
    );
    isFetchingRequestDesign = false;
  }

  ///pagination
  int _fixedPackagePage = 0;
  int _customPackagePage = 0;
  bool hasReachedMaxOfFixedPackage = false;
  bool hasReachedMaxOfCustomPackage = false;

  // List<RenovateFixedFilterContent> fixedPackages = [];
  List<Content> customPackages = [];
  bool isFetchingCustomPackage = false;
  bool isFetchingFixedPackage = false;

  /// Counter for function calls
  int _getProductsCallCount = 0;

  Future<void> renovateHouseCustomPackages({bool isRefresh = false}) async {
    if (isFetchingCustomPackage) return;

    isFetchingCustomPackage = true;

    if (!isRefresh && hasReachedMaxOfCustomPackage) {
      isFetchingCustomPackage = false;
      return;
    }
    if (isRefresh) {
      _customPackagePage = 0;
      hasReachedMaxOfCustomPackage = false;
      customPackages.clear();
    } else if (_customPackagePage > 0) {
      emit(ProjectsFilterState.paginationLoading());
    } else {
      emit(ProjectsFilterState.renovateYourHouseCustomPackagesFilterLoading());
    }

    final RenovateHouseFilterBody renovateCustomRequestBody =
        RenovateHouseFilterBody(
            pageNumber: _customPackagePage,
            searchCriteria: RenovateHouseSearchCriteria(
              userId: null,
              unitTypeId: null,
              governorateId: null,
              unitWorkTypeId: null,
              workSkillId: null,
              unitStatusId: null,
              cityId: null,
              requiredDurationFrom: null,
              requiredDurationTo: null,
              unitAreaFrom: null,
              unitAreaTo: null,
              budgetFrom: null,
              budgetTo: null,
            ));

    final result = await projectsFilterRepository
        .renovateHouseFilter(renovateCustomRequestBody);

    result.when(
      success: (data) {
        final newCustomPackages = data.data?.content ?? [];
        if (newCustomPackages.isEmpty) {
          hasReachedMaxOfCustomPackage = true;
        } else {
          customPackages.addAll(newCustomPackages);
          _customPackagePage++;
          hasReachedMaxOfCustomPackage =
              _customPackagePage >= (data.data?.totalPages ?? 1);
        }
        if (!isClosed) {
          emit(
            ProjectsFilterState.renovateYourHouseCustomPackagesFilterLoaded(
                data),
          );

          _getProductsCallCount++;
          logger.e("get custom packages called $_getProductsCallCount times");
        }
      },
      failure: (error) {
        if (!isClosed) {
          emit(ProjectsFilterState.renovateYourHouseCustomPackagesFilterError(
            error: error.message.toString(),
          ));
        }
      },
    );
    isFetchingCustomPackage = false;
  }

// Future<void> getFixedPackagesFilter({bool isRefresh = false}) async {
//   if (isFetching) return;
//
//   isFetching = true;
//
//   if (!isRefresh && hasReachedMax) {
//     isFetching = false;
//     return;
//   }
//   if (isRefresh) {
//     _page = 0;
//     hasReachedMax = false;
//     fixedPackages.clear();
//   } else if (_page > 0) {
//     emit(RenovateYourHouseState.paginationLoading());
//   } else {
//     emit(
//         RenovateYourHouseState.renovateYourHouseFixedPackagesFilterLoading());
//   }
//
//   final requestBody = {
//     "pageNumber": 0,
//     "searchCriteria": {
//       "userId": null,
//       "unitTypeId": null,
//       "governorateId": null,
//       "unitWorkTypeId": null,
//       "workSkillId": null,
//       "unitStatusId": null,
//       "cityId": null,
//       "requiredDurationFrom": null,
//       "requiredDurationTo": null,
//       "unitAreaFrom": null,
//       "unitAreaTo": null,
//       "budgetFrom": 1500,
//       "budgetTo": 240000
//     }
//   };
//
//   final result = await renovateYourHouseRepository
//       .getRenovateYourHouseFixedPackagesFilter(requestBody);
//
//   result.when(
//     success: (data) {
//       final newFixedPackages = data.data?.content ?? [];
//       if (newFixedPackages.isEmpty) {
//         hasReachedMax = true;
//       } else {
//         fixedPackages.addAll(newFixedPackages);
//         _page++;
//         hasReachedMax = _page >= (data.data?.totalPages ?? 1);
//       }
//       if (!isClosed) {
//         emit(
//           RenovateYourHouseState.renovateYourHouseFixedPackagesFilterLoaded(
//             data,
//           ),
//         );
//
//         _getProductsCallCount++;
//         logger.e("get fixed packages called $_getProductsCallCount times");
//       }
//     },
//     failure: (error) {
//       if (!isClosed) {
//         emit(RenovateYourHouseState.renovateYourHouseFixedPackagesFilterError(
//           error: error.message.toString(),
//         ));
//       }
//     },
//   );
//   isFetching = false;
// }

  ///Ask Technical Worker
  ///Filter
  int _askTechnicalWorkerPage = 0;
  bool hasReachedMaxOfAskTechnicalWorker = false;
  List<AskTechnicalContent> askTechnicalItems = [];
  bool isFetchingAskTechnical = false;

  Future<void> askTechnicalWorkerFilter({bool isRefresh = false}) async {
    if (isFetchingAskTechnical) return;

    isFetchingAskTechnical = true;

    if (!isRefresh && hasReachedMaxOfAskTechnicalWorker) {
      isFetchingAskTechnical = false;
      return;
    }
    if (isRefresh) {
      _askTechnicalWorkerPage = 0;
      hasReachedMaxOfAskTechnicalWorker = false;
      customPackages.clear();
    } else if (_askTechnicalWorkerPage > 0) {
      emit(ProjectsFilterState.paginationLoading());
    } else {
      emit(ProjectsFilterState.askTechnicalWorkerFilterLoading());
    }

    final AskTechnicalWorkerFilterBody askTechnicalBody =
        AskTechnicalWorkerFilterBody(
      pageNumber: _askTechnicalWorkerPage,
      searchCriteria: AskTechnicalSearchCriteria(),
    );

    final result = await projectsFilterRepository
        .askTechnicalWorkerFilter(askTechnicalBody);

    result.when(
      success: (data) {
        final askTechnicalItems = data.data?.content ?? [];
        if (askTechnicalItems.isEmpty) {
          hasReachedMaxOfAskTechnicalWorker = true;
        } else {
          askTechnicalItems.addAll(askTechnicalItems);
          _askTechnicalWorkerPage++;
          hasReachedMaxOfAskTechnicalWorker =
              _askTechnicalWorkerPage >= (data.data?.totalPages ?? 1);
        }
        if (!isClosed) {
          emit(
            ProjectsFilterState.askTechnicalWorkerFilterSuccess(
              data,
            ),
          );

          _getProductsCallCount++;
          logger.e("get askTechnicals called $_getProductsCallCount times");
        }
      },
      failure: (error) {
        if (!isClosed) {
          emit(ProjectsFilterState.askTechnicalWorkerFilterFailure(
            error: error.message.toString(),
          ));
        }
      },
    );
    isFetchingAskTechnical = false;
  }
}
