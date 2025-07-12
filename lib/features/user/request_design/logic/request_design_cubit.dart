import 'dart:io';
import 'dart:typed_data';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:home4u/features/user/request_design/logic/request_design_state.dart';

import '../../../../core/helpers/helper_methods.dart';
import '../data/models/request_design_body.dart';
import '../data/repository/request_design_repository.dart';

class RequestDesignCubit extends Cubit<RequestDesignState> {
  RequestDesignRepository requestDesignRepository;
  final Dio dio;

  RequestDesignCubit(this.requestDesignRepository,this.dio)
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

  //controller
  final promptController = TextEditingController();

  void updateSelectedImages(File newImages) {
    image = newImages;
    emit(RequestDesignState.addImage());
  }

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


  Future<void> requestDesignAi() async {
    if (image == null || promptController.text.isEmpty) {
      emit( RequestDesignState.requestDesignAiFailure(
        error: "Image and prompt are required.",
      ));
      return;
    }
    emit(RequestDesignState.requestDesignAiLoading());

    try {
      final formData = FormData.fromMap({
        'image': await MultipartFile.fromFile(image!.path, filename: 'upload.jpg'),
        'prompt': promptController.text,
      });

      final response = await dio.post<Uint8List>(
        'http://51.4.114.63:8080/generate/',
        data: formData,
        options: Options(
          contentType: 'multipart/form-data',
          responseType: ResponseType.bytes,
          sendTimeout: const Duration(minutes: 10),
          receiveTimeout: const Duration(minutes: 10),
        ),
      );
      if (response.statusCode == 200 && response.data != null) {
        emit(RequestDesignState.requestDesignAiSuccess(response.data!));
      } else {
        emit(RequestDesignState.requestDesignAiFailure(
          error: 'Failed: ${response.statusMessage}',
        ));
      }
    } catch (e) {
      emit(RequestDesignState.requestDesignAiFailure(
        error: 'Error: $e',
      ));
    }
  }
  @override
  Future<void> close() {
    phoneNumberController.dispose();
    unitAreaController.dispose();
    budgetController.dispose();
    requiredDurationController.dispose();
    notesController.dispose();
    promptController.dispose();
    return super.close();
  }
}