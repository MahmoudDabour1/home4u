import 'package:bloc/bloc.dart';

import '../../data/models/services/freelancer_services.dart';
import '../../data/models/services/freelancer_types.dart';
import '../../data/repos/freelancer_sign_up_repository.dart';
import 'engineering_office_state.dart';

class EngineeringOfficeCubit extends Cubit<EngineeringOfficeState> {
  FreelancerSignUpRepository freelancerSignUpRepository;

  EngineeringOfficeCubit(this.freelancerSignUpRepository)
      : super(const EngineeringOfficeState.initial());

  List<FreelancerTypeData> engineeringOfficeFields = [];
  List<FreelancerServiceData> engineeringOfficeDepartments = [];

  void getEngineeringOfficeFields() async {
    emit(const EngineeringOfficeState.loadingEngineeringOfficeFields());
    try {
      final result =
          await freelancerSignUpRepository.getEngineeringOfficeFields();
      result.when(success: (data) {
        engineeringOfficeFields = data;
        emit(EngineeringOfficeState.successEngineeringOfficeFields(data));
      }, failure: (error) {
        emit(EngineeringOfficeState.errorEngineeringOfficeFields(
            error: error.message ?? "An unknown error occurred"));
      });
    } catch (error) {
      emit(EngineeringOfficeState.errorEngineeringOfficeFields(
          error: "Unexpected error occurred: ${error.toString()}"));
    }
  }

  void getEngineeringOfficeServices(int engineeringOfficeFieldId) async {
    emit(const EngineeringOfficeState.loadingEngineeringOfficeServices());
    try {
      final result = await freelancerSignUpRepository
          .getEngineeringOfficeServices(engineeringOfficeFieldId);
      result.when(success: (data) {
        engineeringOfficeDepartments = data;
        emit(EngineeringOfficeState.successEngineeringOfficeServices(data));
      }, failure: (error) {
        emit(EngineeringOfficeState.errorEngineeringOfficeServices(
            error: error.message ?? "An unknown error occurred"));
      });
    } catch (error) {
      emit(EngineeringOfficeState.errorEngineeringOfficeServices(
          error: "Unexpected error occurred: ${error.toString()}"));
    }
  }
}
