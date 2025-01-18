import 'package:home4u/core/theming/app_assets.dart';
import 'package:home4u/locale/app_locale.dart';

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
    title: AppLocale.onBoardingTitle1,
    description: AppLocale.onBoardingDescription1,
    image: AppAssets.onboardingOneFour,
  ),
  OnboardingModel(
    title: AppLocale.onBoardingTitle2,
    description: AppLocale.onBoardingDescription2,
    image: AppAssets.onboardingTwo,
  ),
  OnboardingModel(
    title: AppLocale.onBoardingTitle3,
    description: AppLocale.onBoardingDescription3,
    image: AppAssets.onboardingThree,
  ),
  OnboardingModel(
    title: AppLocale.onBoardingTitle4,
    description: AppLocale.onBoardingDescription4,
    image: AppAssets.onboardingOneFour,
  ),
];
