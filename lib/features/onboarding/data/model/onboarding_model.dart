import 'package:home4u/core/theming/app_assets.dart';

class OnboardingModel {
  final String title;
  final String description;
  final String image;

  OnboardingModel({
    required this.title,
    required this.description,
    required this.image,
  });
}

List<OnboardingModel> onBoardingItems = [
  OnboardingModel(
    title: 'Civil works and finishing services',
    description:
        "Comprehensive services including civil works and finishing, with engineering consultations and 2D and 3D designs, in addition to free and paid services through our platform.",
    image: AppAssets.onboardingOneFour,
  ),
  OnboardingModel(
    title: 'Book Your Visit',
    description:
    "Comprehensive services including civil works and finishing, with engineering consultations and 2D and 3D designs, in addition to free and paid services through our platform.",
    image: AppAssets.onboardingTwo,
  ),
  OnboardingModel(
    title: 'Make Your Offer',
    description:
    "Comprehensive services including civil works and finishing, with engineering consultations and 2D and 3D designs, in addition to free and paid services through our platform.",
    image: AppAssets.onboardingThree,
  ),
  OnboardingModel(
    title: 'Make Your Offer',
    description:
    "Comprehensive services including civil works and finishing, with engineering consultations and 2D and 3D designs, in addition to free and paid services through our platform.",
    image: AppAssets.onboardingOneFour,
  ),
];
