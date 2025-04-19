import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:home4u/core/networking/dio_factory.dart';
import 'package:home4u/features/user/renovate_your_house/logic/renovate_your_house_state.dart';

import '../../../../core/helpers/helper_methods.dart';
import '../data/models/add_renovate_house_custom_package_body.dart';
import '../data/models/renovate_your_house_choose_fixed_package_body.dart';
import '../data/models/renovate_your_house_look_ups_model.dart';
import '../data/repository/renovate_your_house_repository.dart';

class RenovateYourHouseCubit extends Cubit<RenovateYourHouseState> {
  RenovateYourHouseRepository renovateYourHouseRepository;

  RenovateYourHouseCubit(this.renovateYourHouseRepository)
      : super(const RenovateYourHouseState.initial());

  ///controllers
  GlobalKey<FormState> validationKey = GlobalKey<FormState>();
  final FocusNode phoneNumberFocusNode = FocusNode();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController unitAreaController = TextEditingController();
  final TextEditingController budgetController = TextEditingController();
  final TextEditingController numberOfRoomsController = TextEditingController();
  final TextEditingController numberOfBathRoomsController =
      TextEditingController();
  final TextEditingController requiredDurationInDaysController =
      TextEditingController();
  final TextEditingController regionController = TextEditingController();
  final TextEditingController notesController = TextEditingController();

  ///lists
  List<UnitStatus> unitTypes = [];
  List<UnitStatus> unitStatuses = [];
  List<UnitStatus> unitWorkTypes = [];
  List<UnitStatus> workSkills = [];
  List<Governorate> governorates = [];

  ///Selected values
  int? selectedUnitType;
  int? selectedUnitStatus;
  int? selectedUnitWorkType;
  int? selectedWorkSkill;
  int? selectedGovernorate;
  int? selectedCity;
  bool? isInsideCompound;

  Future<void> getRenovateYourHouseLookUps() async {
    emit(RenovateYourHouseState.renovateYourHouseLookUpsLoading());
    final result =
        await renovateYourHouseRepository.getRenovateYourHouseLookUps();
    result.when(
      success: (renovateLookUpModel) {
        unitTypes = renovateLookUpModel.data.unitTypes;
        unitStatuses = renovateLookUpModel.data.unitStatuses;
        unitWorkTypes = renovateLookUpModel.data.unitWorkTypes;
        workSkills = renovateLookUpModel.data.workSkills;
        governorates = renovateLookUpModel.data.governorates;
        emit(RenovateYourHouseState.renovateYourHouseLookUpsLoaded(
          renovateLookUpModel,
        ));
      },
      failure: (error) {
        emit(RenovateYourHouseState.renovateYourHouseLookUpsError(
          error: error.message.toString(),
        ));
      },
    );
  }

  Future<void> getRenovateYourHouseFixedPackages() async {
    emit(RenovateYourHouseState.renovateYourHouseFixedPackagesLoading());
    final result =
        await renovateYourHouseRepository.getRenovateYourHouseFixedPackages();
    result.when(
      success: (data) {
        emit(RenovateYourHouseState.renovateYourHouseFixedPackagesLoaded(data));
      },
      failure: (error) {
        emit(RenovateYourHouseState.renovateYourHouseFixedPackagesError(
          error: error.message.toString(),
        ));
      },
    );
  }

  Future<void> addCustomPackageRenovateYourHouse(
    AddRenovateHouseCustomPackageBody addRenovateHouseCustomPackageBody,
  ) async {
    emit(RenovateYourHouseState.addCustomPackageRenovateYourHouseLoading());
    DioFactory.setContentType('application/json');

    final result = await renovateYourHouseRepository
        .addCustomPackageRenovateYourHouse(addRenovateHouseCustomPackageBody);
    result.when(
      success: (data) async {
        emit(RenovateYourHouseState.addCustomPackageRenovateYourHouseLoaded(
          data,
        ));
        await showToast(
          message: "Your Package has been recorded successfully",
        );
      },
      failure: (error) {
        emit(RenovateYourHouseState.addCustomPackageRenovateYourHouseError(
          error: error.message.toString(),
        ));
      },
    );
  }

  Future<void> chooseFixedPackageRenovateYourHouse(
    RenovateYourHouseChooseFixedPackageBody
        renovateYourHouseChooseFixedPackageBody,
  ) async {
    emit(RenovateYourHouseState.chooseFixedPackageRenovateYourHouseLoading());
    final result =
        await renovateYourHouseRepository.chooseFixedPackageRenovateYourHouse(
      renovateYourHouseChooseFixedPackageBody,
    );
    result.when(
      success: (data) async {
        emit(RenovateYourHouseState.chooseFixedPackageRenovateYourHouseLoaded(
            data));
        await showToast(
          message: "Your Package has been recorded successfully",
        );
      },
      failure: (error) async {
        emit(RenovateYourHouseState.chooseFixedPackageRenovateYourHouseError(
          error: error.message.toString(),
        ));
        await showToast(
          message: "Your Package haven't been recorded",
          isError: true,
        );
      },
    );
  }

  AddRenovateHouseCustomPackageBody prepareCustomPackageBody() {
    return AddRenovateHouseCustomPackageBody(
      phoneNumber: phoneNumberController.text,
      isInsideCompound: isInsideCompound!,
      unitType: ItemId(id: selectedUnitType!),
      unitStatuses: ItemId(id: selectedUnitStatus!),
      unitWorkTypes: ItemId(id: selectedUnitWorkType!),
      workSkills: ItemId(id: selectedWorkSkill!),
      city: ItemId(id: selectedCity!),
      governorate: ItemId(id: selectedGovernorate!),
      unitArea: int.parse(unitAreaController.text),
      budget: int.parse(budgetController.text),
      region: int.parse(regionController.text),
      numberOfRooms: int.parse(numberOfRoomsController.text),
      numberOfBathrooms: int.parse(numberOfBathRoomsController.text),
      requiredDuration: int.parse(requiredDurationInDaysController.text),
      notes: notesController.text,
    );
  }
}
