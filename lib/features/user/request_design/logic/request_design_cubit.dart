import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:home4u/features/user/request_design/logic/request_design_state.dart';

import '../../../../core/helpers/helper_methods.dart';
import '../data/models/request_design_body.dart';
import '../data/repository/request_design_repository.dart';

class RequestDesignCubit extends Cubit<RequestDesignState> {
  RequestDesignRepository requestDesignRepository;

  RequestDesignCubit(this.requestDesignRepository)
      : super(const RequestDesignState.initial());

  ///Controllers
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController unitAreaController = TextEditingController();
  final TextEditingController budgetController = TextEditingController();
  final TextEditingController requiredDurationController =
      TextEditingController();
  final TextEditingController notesController = TextEditingController();

  ///Items
  int? selectedUnitType;
  int? selectedGovernorate;
File? image;

  void updateSelectedImages(File newImages) {
    image = newImages;
    emit(RequestDesignState.addImage());
  }
  ///Filter
  // int _page = 0;
  // bool hasReachedMax = false;
  // List<RequestDesignFilterContent> requestDesignItems = [];
  // bool isFetching = false;

  // Future<void> getRequestDesignFilter({bool isRefresh = false}) async {
  //   ///get any data help you here ....
  //
  //   if (isFetching) return;
  //   isFetching = true;
  //
  //   if (!isRefresh && hasReachedMax) {
  //     isFetching = false;
  //     return;
  //   }
  //
  //   if (isRefresh) {
  //     _page = 0;
  //     hasReachedMax = false;
  //     requestDesignItems.clear();
  //   } else if (_page > 0) {
  //     emit(RequestDesignState.paginationLoading());
  //   } else {
  //     emit(RequestDesignState.requestDesignFilterLoading());
  //   }
  //
  //   final requestDesignFilterBody = RequestDesignFilterBody(
  //     pageNumber: _page,
  //     searchCriteria: SearchCriteria(
  //       userId: null,
  //       unitTypeId: null,
  //       governorateId: null,
  //       requiredDurationFrom: null,
  //       requiredDurationTo: null,
  //       unitAreaFrom: null,
  //       unitAreaTo: null,
  //       budgetFrom: null,
  //       budgetTo: null,
  //     ),
  //   );
  //   final result = await requestDesignRepository
  //       .getRequestDesignFilter(requestDesignFilterBody);
  //
  //   result.when(
  //     success: (data) {
  //       final newItems = data.data?.content ?? [];
  //       if (newItems.isEmpty) {
  //         hasReachedMax = true;
  //       } else {
  //         requestDesignItems.addAll(newItems);
  //         _page++;
  //         hasReachedMax = _page >= (data.data?.totalPages ?? 1);
  //       }
  //       if (!isClosed) {
  //         emit(RequestDesignState.requestDesignFilterSuccess(data));
  //       }
  //     },
  //     failure: (error) {
  //       if (!isClosed) {
  //         emit(RequestDesignState.requestDesignFilterFailure(
  //           error: error.message.toString(),
  //         ));
  //       }
  //     },
  //   );
  //   isFetching = false;
  // }

  Future<void> addRequestDesign(
      {required RequestDesignBody requestDesignBody}) async {
    emit(RequestDesignState.addRequestDesignLoading());
    final result =
        await requestDesignRepository.requestDesign(requestDesignBody);
    result.when(
      success: (data) async {
        await showToast(
          message: "Your Design have been recorded successfully",
        );
        emit(RequestDesignState.addRequestDesignSuccess(data));
      },
      failure: (error) {
        emit(RequestDesignState.addRequestDesignFailure(
          error: error.message.toString(),
        ));
      },
    );
  }

  RequestDesignBody getRequestDesignBody() {
    return RequestDesignBody(
      governorate: GovernorateRequest(id: selectedGovernorate),
      unitType: GovernorateRequest(id: selectedUnitType),
      phoneNumber: phoneNumberController.text,
      unitArea: int.parse(unitAreaController.text),
      budget: int.parse(budgetController.text),
      requiredDuration: int.parse(requiredDurationController.text),
      notes: notesController.text,
    );
  }
}
