import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:home4u/core/extensions/navigation_extension.dart';
import 'package:home4u/features/furnish_your_home/data/models/furnish_your_home_request_model.dart';
import 'package:home4u/features/furnish_your_home/data/repos/furnish_your_home_repo.dart';

import '../../../core/helpers/helper_methods.dart';
import 'furnish_your_home_state.dart';

class FurnishYourHomeCubit extends Cubit<FurnishYourHomeState> {
  final FurnishYourHomeRepo furnishYourHomeRepo;

  FurnishYourHomeCubit(this.furnishYourHomeRepo)
      : super(FurnishYourHomeState.initial());

  final phoneController = TextEditingController();
  final budgetController = TextEditingController();
  final noteController = TextEditingController();
  final timeFrameDaysController = TextEditingController();
  int? furnitureTypeId;
  int? governmentId;


  Future<void> sendFurnishYourHome(BuildContext context) async {
    emit(FurnishYourHomeState.furnishYourHomeRequestLoading());
    final budgetText = budgetController.text.trim();
    final timeFrameText = timeFrameDaysController.text.trim();

    final double budget =
        budgetText.isNotEmpty ? double.tryParse(budgetText) ?? 0 : 0;
    final timeFrameDays =
        timeFrameText.isNotEmpty ? int.tryParse(timeFrameText) ?? 0 : 0;

    final response = await furnishYourHomeRepo.sendFurnishYourHome(
      FurnishYourHomeRequestModel(
        budget: budget ?? 0,
        furnitureType: IdModel(id: furnitureTypeId ?? 0),
        government: IdModel(id: governmentId ?? 0),
        phoneNumber: phoneController.text.trim(),
        requestType: IdModel(id: 1),
        timeFrameDays: timeFrameDays,
        note: noteController.text.trim(),
      ),
    );
    response.when(success: (data) async {
      await showToast(
        message: "Furnish Your Home request sent successfully!",
      );
      emit(FurnishYourHomeState.furnishYourHomeRequestSuccess(data));
      context.pop();
    }, failure: (error) async {
      await showToast(message: error.errorsDetails.toString(), isError: true);
      emit(FurnishYourHomeState.furnishYourHomeRequestError(
          error.errorsDetails.toString()));
    });
  }
}
