import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home4u/features/ask_engineer/data/models/ask_engineer_ikp_response_model.dart';
import 'package:home4u/features/ask_engineer/data/models/ask_engineer_image_body.dart';
import 'package:home4u/features/ask_engineer/data/models/ask_engineer_images_response_model.dart';
import 'package:home4u/features/ask_engineer/data/repos/ask_engineer_repo.dart';
import 'package:http_parser/http_parser.dart';

import '../../../core/helpers/helper_methods.dart';
import '../../../core/networking/dio_factory.dart';
import 'ask_engineer_state.dart';

class AskEngineerCubit extends Cubit<AskEngineerState> {
  final AskEngineerRepo _askEngineerRepo;

  AskEngineerCubit(this._askEngineerRepo)
      : super(const AskEngineerState.initial());

  static AskEngineerCubit get(context) => BlocProvider.of(context);

  TextEditingController projectNameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController projectDescriptionController = TextEditingController();
  TextEditingController budgetController = TextEditingController();
  TextEditingController projectDeadlineController = TextEditingController();

  List<EngineerType> engineerTypesList = [];
  List<EngineerType> unitTypesList = [];
  List<Governorate> governmentList = [];
  List<EngineerType> urgencyLevelList = [];
  List<File> images = [];

  String? selectEngineerType;
  String? selectUnitType;
  String? selectedGovernorate;
  String? selectedCity;
  String? selectUrgencyLevel;

  void updateSelectedImages(List<File> newImages) {
    images = [...newImages];
    emit(AskEngineerState.askEngineerAddingImages(images));
  }

  void getAskEngineerIkp() async {
    emit(const AskEngineerState.getEngineerIkpLoading());
    final response = await _askEngineerRepo.askEngineerIkp();
    response.when(
      success: (askEngineerIkpResponse) {
        engineerTypesList = askEngineerIkpResponse.data?.engineerType ?? [];
        unitTypesList = askEngineerIkpResponse.data?.unitType ?? [];
        governmentList = askEngineerIkpResponse.data?.governorate ?? [];
        urgencyLevelList = askEngineerIkpResponse.data?.urgencyLevel ?? [];
        emit(AskEngineerState.success(askEngineerIkpResponse));
      },
      failure: (error) async {
        await showToast(message: error.message.toString(), isError: true);
        emit(AskEngineerState.error(
            error: error.message ?? "An unknown error occurred"));
      },
    );
  }

  void askEngineer() async {
    emit(const AskEngineerState.loading());
    final jsonAskEngineerString = await _prepareAskEngineerData();
    final response = await _askEngineerRepo.askEngineer(jsonAskEngineerString);
    response.when(
      success: (askEngineerResponse) async {
        emit(AskEngineerState.success(askEngineerResponse));
       await addAskEngineerImages(askEngineerResponse.data?.id??0);
        await showToast(message: "Ask Engineer Successfully", isError: false);
      },
      failure: (error) async {
        await showToast(message: error.message.toString(), isError: true);
        emit(AskEngineerState.error(error: error.message.toString()));
      },
    );
  }

  Future<void> addAskEngineerImages(int askEngineerId) async {
    emit(const AskEngineerState.addAskEngineerImageLoading());
    final imageBodies = images
        .map(
          (image) => AskEngineerImageBody(
            askEngineerId: askEngineerId,
          ),
        )
        .toList();
    final result = await _askEngineerRepo.addAskEngineerImage(imageBodies);
    result.when(
      success: (imageResponse) async{
        emit(AskEngineerState.addAskEngineerImageSuccess(imageResponse));
      await _uploadAskEngineerImages(imageResponse);
        },
      failure: (error) async {
        await showToast(message: error.message.toString(), isError: true);
        emit(AskEngineerState.error(error: error.message.toString()));
      },
    );
  }

  //upload
  Future<void> _uploadAskEngineerImages(
      AskEngineerImagesResponseModel imageResponse) async {
    emit(const AskEngineerState.uploadAskEngineerImageLoading());
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
      final result = await _askEngineerRepo.uploadAskEngineerImage("ASK_ENGINEER",
          imageResponse.data![i].id??0, FormData.fromMap({'file': imageFiles[i]}));

      result.when(
        success: (uploadResponse) {
          if (uploadResponse.success??false) {
            successCount++;
            if (successCount == imageFiles.length) {
              DioFactory.setContentType('application/json');
              emit(const AskEngineerState.uploadAskEngineerImageSuccess());
            }
          } else {
            emit(
              AskEngineerState.uploadAskEngineerImageError(
                error: uploadResponse.data.toString(),
              ),
            );
          }
        },
        failure: (error) => emit(
          AskEngineerState.uploadAskEngineerImageError(
           error: error.message.toString(),
          ),
        ),
      );
    }
  }


  Future<String> _prepareAskEngineerData() async {
    final jsonAskEngineerData = {
      "phoneNumber": phoneNumberController.text,
      "projectName": projectNameController.text,
      "projectDescription": projectDescriptionController.text,
      "engineerType": {"id": int.parse(selectEngineerType!)},
      "unitType": {"id": int.parse(selectUnitType!)},
      "budget": budgetController.text,
      "city": {"id": int.parse(selectedCity!)},
      "governorate": {"id": int.parse(selectedGovernorate!)},
      "urgencyLevel": {"id": int.parse(selectUrgencyLevel!)},
      "deadline": projectDeadlineController.text,
    };

    final jsonAskEngineerString = json.encode(jsonAskEngineerData);
    return jsonAskEngineerString;
  }
}
