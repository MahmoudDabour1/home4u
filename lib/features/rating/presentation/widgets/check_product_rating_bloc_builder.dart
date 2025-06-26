import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home4u/core/helpers/shared_pref_keys.dart';
import 'package:home4u/features/rating/logic/product_rating/product_rating_cubit.dart';
import 'package:home4u/features/rating/logic/product_rating/product_rating_state.dart';
import 'package:home4u/features/rating/presentation/widgets/product_is_rated_before_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CheckProductRatingBlocBuilder extends StatefulWidget {
  final int productId;

  const CheckProductRatingBlocBuilder({
    super.key,
    required this.productId,
  });

  @override
  State<CheckProductRatingBlocBuilder> createState() =>
      _CheckProductRatingBlocBuilderState();
}

class _CheckProductRatingBlocBuilderState
    extends State<CheckProductRatingBlocBuilder> {

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _loadProductRating();
  }

  Future<void> _loadProductRating() async {
    final prefs = await SharedPreferences.getInstance();
    final userId = prefs.getInt(SharedPrefKeys.userId);
    if (userId != null) {
      context.read<ProductRatingCubit>().findProductRating(widget.productId, userId);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductRatingCubit, ProductRatingState>(
      builder: (context, state) {
        return state.maybeWhen(
          findProductRatingSuccess: (response) {
            return ProductIsRatedBeforeWidget(
              isRatedBefore: response != null,
              ratingValue: response?.data?.rate,
            );
          },
          findProductRatingLoading: () => const Center(child: CircularProgressIndicator()),
          orElse: () => const SizedBox(),
        );
      },
    );
  }
}

