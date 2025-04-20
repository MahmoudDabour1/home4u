import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:home4u/features/user/request_design/data/repository/request_design_repository.dart';
import 'package:home4u/features/user/request_design/logic/request_design_state.dart';

import '../../../../core/helpers/helper_methods.dart';
import '../data/models/request_design_body.dart';

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
      governorate: Governorate(id: selectedGovernorate),
      unitType: Governorate(id: selectedUnitType),
      phoneNumber: phoneNumberController.text,
      unitArea: int.parse(unitAreaController.text),
      budget: int.parse(budgetController.text),
      requiredDuration: int.parse(requiredDurationController.text),
      notes: notesController.text,
    );
  }
}
