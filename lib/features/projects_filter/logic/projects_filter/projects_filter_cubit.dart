import 'package:bloc/bloc.dart';
import 'package:home4u/features/projects_filter/data/models/ask_filter/technical/ask_technical_worker_filter_response_model.dart';
import 'package:home4u/features/projects_filter/data/models/ask_filter/engineer/ask_engineer_filter_body.dart';
import 'package:home4u/features/projects_filter/data/models/ask_filter/engineer/ask_engineer_filter_response_model.dart';
import 'package:home4u/features/projects_filter/data/repository/projects_filter_repository.dart';
import 'package:home4u/features/projects_filter/logic/projects_filter/projects_filter_state.dart';

import '../../../../core/routing/router_observer.dart';
import '../../data/models/ask_filter/technical/ask_technical_worker_filter_body.dart';
import '../../data/models/renovate_house_filter/renovate_house_filter_body.dart';
import '../../data/models/renovate_house_filter/renovate_house_filter_response_model.dart';
import '../../data/models/renovate_house_filter/renovate_house_fixed_package_filter_response_model.dart';
import '../../data/models/request_design_filter/request_design_filter_body.dart';
import '../../data/models/request_design_filter/request_design_filter_response_model.dart';

class ProjectsFilterCubit extends Cubit<ProjectsFilterState> {
  ProjectsFilterRepository projectsFilterRepository;

  ProjectsFilterCubit(this.projectsFilterRepository)
      : super(const ProjectsFilterState.initial());

  /// Counter for function calls
  int _getProductsCallCount = 0;

  ///Filter
  ///Request Design Filter
  int _requestDesignPage = 0;
  List<RequestDesignFilterContent> requestDesignItems = [];
  bool hasReachedMaxOfRequestDesign = false;
  bool isFetchingRequestDesign = false;

  Future<void> getRequestDesignFilter({bool isRefresh = false}) async {
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

  Future<void> resetPaginationOfRequestDesign() async {
    _requestDesignPage = 0;
    hasReachedMaxOfRequestDesign = false;
    requestDesignItems.clear();
  }

  ///Filter
  ///Renovate Your House
  ///Custom Packages
  int _customPackagePage = 0;
  List<RenovateHouseContent> customPackages = [];
  bool hasReachedMaxOfCustomPackage = false;
  bool isFetchingCustomPackage = false;

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

  Future<void> resetPaginationOfCustomPackage() async {
    _customPackagePage = 0;
    hasReachedMaxOfCustomPackage = false;
    customPackages.clear();
  }

  ///Fixed Packages
  int _fixedPackagePage = 0;
  List<RenovateHouseCustomPackageContent> fixedPackages = [];
  bool hasReachedMaxOfFixedPackage = false;
  bool isFetchingFixedPackage = false;

  Future<void> getFixedPackagesFilter({bool isRefresh = false}) async {
    if (isFetchingFixedPackage) return;

    isFetchingFixedPackage = true;

    if (!isRefresh && hasReachedMaxOfFixedPackage) {
      isFetchingFixedPackage = false;
      return;
    }
    if (isRefresh) {
      _fixedPackagePage = 0;
      hasReachedMaxOfFixedPackage = false;
      fixedPackages.clear();
    } else if (_fixedPackagePage > 0) {
      emit(ProjectsFilterState.paginationLoading());
    } else {
      emit(ProjectsFilterState.renovateYourHouseFixedPackagesFilterLoading());
    }

    final requestBody = {
      "pageNumber": _fixedPackagePage,
      "searchCriteria": {
        "userId": null,
        "unitTypeId": null,
        "customPackageId": null,
        "isInsideCompound": null,
      }
    };

    final result = await projectsFilterRepository
        .renovateHouseFixedPackageFilter(requestBody);

    result.when(
      success: (data) {
        final newFixedPackages = data.data?.content ?? [];
        if (newFixedPackages.isEmpty) {
          hasReachedMaxOfFixedPackage = true;
        } else {
          fixedPackages.addAll(newFixedPackages);
          _fixedPackagePage++;
          hasReachedMaxOfFixedPackage =
              _fixedPackagePage >= (data.data?.totalPages ?? 1);
        }
        if (!isClosed) {
          emit(
            ProjectsFilterState.renovateYourHouseFixedPackagesFilterLoaded(
              data,
            ),
          );

          _getProductsCallCount++;
          logger.e("get fixed packages called $_getProductsCallCount times");
        }
      },
      failure: (error) {
        if (!isClosed) {
          emit(ProjectsFilterState.renovateYourHouseFixedPackagesFilterError(
            error: error.message.toString(),
          ));
        }
      },
    );
    isFetchingFixedPackage = false;
  }

  Future<void> resetPaginationOfFixedPackage() async {
    _fixedPackagePage = 0;
    hasReachedMaxOfFixedPackage = false;
    fixedPackages.clear();
  }

  ///Filter
  ///Ask Technical Worker
  int _askTechnicalWorkerPage = 0;
  List<AskTechnicalContent> askTechnicalItems = [];
  bool hasReachedMaxOfAskTechnicalWorker = false;
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
      askTechnicalItems.clear();
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
        final newAskTechnicalItems = data.data?.content ?? [];
        if (newAskTechnicalItems.isEmpty) {
          hasReachedMaxOfAskTechnicalWorker = true;
        } else {
          askTechnicalItems.addAll(newAskTechnicalItems);
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

  Future<void> resetPaginationOfAskTechnical() async {
    _askTechnicalWorkerPage = 0;
    hasReachedMaxOfAskTechnicalWorker = false;
    askTechnicalItems.clear();
  }

  ///Ask Engineer
  int _askEngineerPage = 0;
  List<AskEngineerContent> askEngineerItems = [];
  bool hasReachedMaxOfAskEngineer = false;
  bool isFetchingAskEngineer = false;

  Future<void> askEngineerFilter({bool isRefresh = false}) async {
    if (isFetchingAskEngineer) return;

    isFetchingAskEngineer = true;

    if (!isRefresh && hasReachedMaxOfAskEngineer) {
      isFetchingAskEngineer = false;
      return;
    }
    if (isRefresh) {
      _askEngineerPage = 0;
      hasReachedMaxOfAskEngineer = false;
      askEngineerItems.clear();
    } else if (_askEngineerPage > 0) {
      emit(ProjectsFilterState.paginationLoading());
    } else {
      emit(ProjectsFilterState.askEngineerFilterLoading());
    }

    final AskEngineerFilterBody askEngineerBody = AskEngineerFilterBody(
      pageNumber: _askEngineerPage,
      searchCriteria: AskEngineerSearchCriteria(),
    );

    final result =
        await projectsFilterRepository.askEngineerFilter(askEngineerBody);

    result.when(
      success: (data) {
        final newAskEngineerItems = data.data?.content ?? [];
        if (newAskEngineerItems.isEmpty) {
          hasReachedMaxOfAskEngineer = true;
        } else {
          askEngineerItems.addAll(newAskEngineerItems);
          _askEngineerPage++;
          hasReachedMaxOfAskEngineer =
              _askEngineerPage >= (data.data?.totalPages ?? 1);
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
    isFetchingAskEngineer = false;
  }

  Future<void> resetPaginationOfAskEngineer() async {
    _askEngineerPage = 0;
    hasReachedMaxOfAskEngineer = false;
    askEngineerItems.clear();
  }
}
