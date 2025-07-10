import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home4u/core/extensions/navigation_extension.dart';
import 'package:home4u/features/ask_technical_worker/data/models/ask_technical_images_response_model.dart';
import 'package:http_parser/http_parser.dart';

import '../../../core/helpers/helper_methods.dart';
import '../../../core/networking/dio_factory.dart';
import '../../../core/routing/routes.dart';
import '../data/models/ask_technical_ikp_response_model.dart';
import '../data/models/ask_technical_image_body.dart';
import '../data/repos/ask_technical_repo.dart';
import 'ask_technical_state.dart';

class AskTechnicalCubit extends Cubit<AskTechnicalState> {
  final AskTechnicalRepo _askTechnicalRepo;

  AskTechnicalCubit(this._askTechnicalRepo)
      : super(const AskTechnicalState.initial());

  static AskTechnicalCubit get(context) => BlocProvider.of(context);
  TextEditingController projectNameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController projectDescriptionController = TextEditingController();
  TextEditingController budgetController = TextEditingController();
  TextEditingController projectDeadlineController = TextEditingController();
  List<AskTechnicalType> selectWorkerTypeList = [];
  List<AskTechnicalType> selectUnitTypeList = [];
  List<Governorate> selectMaterialList = [];
  List<Governorate> governmentList = [];
  List<File> images = [];

  String? selectWorkerType;
  String? selectUnitType;
  String? selectedGovernorate;
  String? selectedCity;
  String? selectMaterial;

  void updateSelectedImages(List<File> newImages) {
    images = [...newImages];
    emit(AskTechnicalState.askTechnicalAddingImages(images));
  }

  void getAskTechnicalIkp() async {
    emit(const AskTechnicalState.getTechnicalIkpLoading());
    final response = await _askTechnicalRepo.askTechnicalIkp();
    response.when(
      success: (askTechnicalIkpResponse) {
        selectWorkerTypeList = askTechnicalIkpResponse.data?.workerType ?? [];
        selectUnitTypeList = askTechnicalIkpResponse.data?.unitType ?? [];
        governmentList = askTechnicalIkpResponse.data?.governorate ?? [];
        selectMaterialList = askTechnicalIkpResponse.data?.material ?? [];
        emit(AskTechnicalState.getTechnicalIkpSuccess(askTechnicalIkpResponse));
      },
      failure: (error) async {
        await showToast(message: error.message.toString(), isError: true);
        emit(
          AskTechnicalState.error(
            error: error.message.toString(),
          ),
        );
      },
    );
  }

  void askTechnical(BuildContext context) async {
    emit(const AskTechnicalState.loading());
    final jsonAskTechnicalString = await _prepareAskTechnicalData();
    final response = await _askTechnicalRepo.askTechnical(jsonAskTechnicalString);
    response.when(
      success: (askTechnicalResponse) async {
        emit(AskTechnicalState.success(askTechnicalResponse));
        await addAskTechnicalImages(askTechnicalResponse.data?.id ?? 0);
        await showToast(message: "Ask Technical Successfully", isError: false);
        context.pushNamed(Routes.homeScreen);
      },
      failure: (error) async {
        await showToast(message: error.message.toString(), isError: true);
        emit(AskTechnicalState.error(error: error.message.toString()));
      },
    );
  }



  Future<void> addAskTechnicalImages(int askTechnicalId) async {
    emit(const AskTechnicalState.addAskTechnicalImageLoading());
    final imageBodies = images
        .map(
          (image) => AskTechnicalImageBody(
        askWorkerId: askTechnicalId,
      )
    )
        .toList();
    final result = await _askTechnicalRepo.addAskTechnicalImage(imageBodies);
    result.when(
      success: (imageResponse) async{
        emit(AskTechnicalState.addAskTechnicalImageSuccess(imageResponse));
        await _uploadAskTechnicalImages(imageResponse);
      },
      failure: (error) async {
        await showToast(message: error.message.toString(), isError: true);
        emit(AskTechnicalState.addAskTechnicalImageError(error: error.message.toString()));
      },
    );
  }


  //upload
  Future<void> _uploadAskTechnicalImages(
      AskTechnicalImageResponseModel imageResponse) async {
    emit(const AskTechnicalState.uploadAskTechnicalImageLoading());
    DioFactory.setContentTypeForMultipart();

    final imageFiles = await Future.wait(
      images.map(
            (image) => MultipartFile.fromFile(
          image.path,
          filename: image.path.split('/').last,
          contentType: MediaType('image', 'jpeg'),
        ),
      ),
    );

    int successCount = 0;

    for (var i = 0; i < imageFiles.length; i++) {
      final result = await _askTechnicalRepo.uploadAskTechnicalImage("ASK_WORKER",
          imageResponse.data![i].id??0, FormData.fromMap({'file': imageFiles[i]}));

      result.when(
        success: (uploadResponse) {
          if (uploadResponse.success??false) {
            successCount++;
            if (successCount == imageFiles.length) {
              DioFactory.setContentType('application/json');
              emit(const AskTechnicalState.uploadAskTechnicalImageSuccess());
            }
          } else {
            emit(
              AskTechnicalState.uploadAskTechnicalImageError(
                error: uploadResponse.data.toString(),
              ),
            );
          }
        },
        failure: (error) => emit(
          AskTechnicalState.uploadAskTechnicalImageError(
            error: error.message.toString(),
          ),
        ),
      );
    }
  }

  Future<String> _prepareAskTechnicalData() async {
    final jsonAskTechnicalData = {
      "projectName": projectNameController.text,
      "phoneNumber": phoneNumberController.text,
      "projectDescription": projectDescriptionController.text,
      "workerType": {"id": int.parse(selectWorkerType!)},
      "unitType": {"id": int.parse(selectUnitType!)},
      "city": {"id": int.parse(selectedCity!)},
      "governorate": {"id": int.parse(selectedGovernorate!)},
      "material": {"id": int.parse(selectMaterial!)},
      "budget": budgetController.text,
    };

    final jsonAskTechnicalString = json.encode(jsonAskTechnicalData);
    return jsonAskTechnicalString;
  }
}
