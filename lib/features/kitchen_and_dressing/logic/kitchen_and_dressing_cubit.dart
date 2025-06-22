import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:home4u/core/extensions/navigation_extension.dart';
import 'package:home4u/core/helpers/helper_methods.dart';
import 'package:home4u/features/kitchen_and_dressing/data/models/dressing_request_model.dart';
import 'package:home4u/features/kitchen_and_dressing/data/models/kitchen_request_model.dart';
import 'package:home4u/features/kitchen_and_dressing/data/repos/kitchen_and_dressing_repo.dart';

import 'kitchen_and_dressing_state.dart';

class KitchenAndDressingCubit extends Cubit<KitchenAndDressingState> {
  final KitchenAndDressingRepo kitchenAndDressingRepo;

  KitchenAndDressingCubit(this.kitchenAndDressingRepo)
      : super(KitchenAndDressingState.initial());

  final phoneController = TextEditingController();
  final budgetController = TextEditingController();
  final noteController = TextEditingController();
  final timeFrameDaysController = TextEditingController();
  final kitchenSizeController = TextEditingController();
  int? governmentId;
  List<IdModel> productMaterial = [];
  List<KitchenIdModel> kitchenProductMaterial = [];
  int? kitchenType;
  List<KitchenIdModel> devicesAttached = [];

  Future<void> sendDressingData(BuildContext context) async {
    emit(KitchenAndDressingState.loading());
    final budgetText = budgetController.text.trim();
    final timeFrameText = timeFrameDaysController.text.trim();

    final double budget =
        budgetText.isNotEmpty ? double.tryParse(budgetText) ?? 0 : 0;
    final timeFrameDays =
        timeFrameText.isNotEmpty ? int.tryParse(timeFrameText) ?? 0 : 0;

    final response = await kitchenAndDressingRepo.sendDressing(
      DressingRequestModel(
        requestType: IdModel(id: 2),
        phoneNumber: phoneController.text.trim(),
        government: IdModel(id: governmentId ?? 0),
        timeFrameDays: timeFrameDays,
        budget: budget,
        productMaterial: productMaterial,
        note: noteController.text.trim(),
      ),
    );
    response.when(success: (data) async {
      await showToast(message: "تم ارسال طلبك بنجاح");
      emit(KitchenAndDressingState.success(data));
      context.pop();
    }, failure: (e) {
      emit(KitchenAndDressingState.failure(
          e.errorsDetails.toString() ?? "حدث خطأ"));
      showToast(message: e.errorsDetails.toString() ?? "حدث خطأ");
    });
  }

  Future<void> sendKitchenData(BuildContext context) async {
    emit(KitchenAndDressingState.loading());
    final budgetText = budgetController.text.trim();
    final timeFrameText = timeFrameDaysController.text.trim();
    final kitchenSize = int.tryParse(kitchenSizeController.text.trim());
    final double budget =
        budgetText.isNotEmpty ? double.tryParse(budgetText) ?? 0 : 0;
    final timeFrameDays =
        timeFrameText.isNotEmpty ? int.tryParse(timeFrameText) ?? 0 : 0;

    final response = await kitchenAndDressingRepo.sendKitchen(
      KitchenRequestModel(
        requestType: KitchenIdModel(id: 3),
        phoneNumber: phoneController.text.trim(),
        government: KitchenIdModel(id: governmentId ?? 0),
        timeFrameDays: timeFrameDays,
        budget: budget,
        kitchenSize: kitchenSize ?? 0,
        devicesAttacheds: devicesAttached,
        productMaterial: kitchenProductMaterial,
        kitchenType: KitchenIdModel(id: kitchenType ?? 0),
      ),
      //
      // DressingRequestModel(
      //   requestType: IdModel(id: 2),
      //   phoneNumber: phoneController.text.trim(),
      //   government: IdModel(id: governmentId ?? 0),
      //   timeFrameDays: timeFrameDays,
      //   budget: budget,
      //   productMaterial: productMaterial,
      //   note: noteController.text.trim(),
      // ),
    );
    response.when(success: (data) async {
      await showToast(message: "تم ارسال طلبك بنجاح");
      emit(KitchenAndDressingState.success(data));
      context.pop();
    }, failure: (e) {
      emit(KitchenAndDressingState.failure(
          e.errorsDetails.toString() ?? "حدث خطأ"));
      showToast(message: e.errorsDetails.toString() ?? "حدث خطأ");
    });
  }
}
