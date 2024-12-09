import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:home4u/features/auth/sign_up/data/models/services/freelancer_services.dart';
import 'package:home4u/features/auth/sign_up/data/models/services/freelancer_types.dart';
import '../../data/repos/freelancer_sign_up_repository.dart';
import 'engineer_state.dart';

class EngineerCubit extends Cubit<EngineerState> {
  final FreelancerSignUpRepository _engineerSignUpRepository;

  EngineerCubit(this._engineerSignUpRepository)
      : super(const EngineerState.initial());

  List<FreelancerTypeData> engineerTypes = [];
  List<FreelancerServiceData> engineerServices = [];

  void getEngineerTypes() async {
    emit(const EngineerState.loadingEngineerTypes());
    try {
      final result = await _engineerSignUpRepository.getEngineerTypes();
      result.when(success: (data) {
        engineerTypes = data;
        emit(EngineerState.successEngineerTypes(data));
      }, failure: (error) {
        emit(EngineerState.errorEngineerTypes(
            error: error.message ?? "An unknown error occurred"));
      });
    } catch (error) {
      emit(EngineerState.errorEngineerTypes(
          error: "Unexpected error occurred: ${error.toString()}"));
    }
  }

  void getEngineerServices(int engineerTypeId) async {
    emit(const EngineerState.loadingEngineerServices());
    try {
      final result =
      await _engineerSignUpRepository.getEngineerServices(engineerTypeId);
      result.when(success: (data) {
        engineerServices = data;
        emit(EngineerState.successEngineerServices(data));
      }, failure: (error) {
        emit(EngineerState.errorEngineerServices(
            error: error.message ?? "An unknown error occurred"));
      });
    } catch (error) {
      emit(EngineerState.errorEngineerServices(
          error: "Unexpected error occurred: ${error.toString()}"));
    }
  }
}