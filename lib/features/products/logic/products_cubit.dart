import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home4u/features/products/data/models/business_config_model.dart';
import 'package:home4u/features/products/data/repos/business_config_repo.dart';
import 'package:home4u/features/products/logic/products_state.dart';


class ProductsCubit extends Cubit<ProductsState> {
  final BusinessConfigRepo _businessConfigRepo;

  ProductsCubit(this._businessConfigRepo) : super(ProductsState.initial());
  BusinessConfigModel ? businessConfigModel;

  static ProductsCubit get(context) => BlocProvider.of(context);

  List<ProductMaterial> baseUnits = [];
  List<FilterColor> colors = [];

  Future<void> getBusinessConfig() async {
    emit(const ProductsState.businessConfigLoading());
    final response = await _businessConfigRepo.getBusinessConfig();
    response.when(
      success: (data) {
        businessConfigModel = data;
        if (!isClosed) {
          emit(ProductsState.businessConfigSuccess(data));
        }
      },
      failure: (error) {
        if (!isClosed) {
          emit(ProductsState.businessConfigFailure(
              errorMessage: error.message.toString()));
        }
      },
    );
  }
}
