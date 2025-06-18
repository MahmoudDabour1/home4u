import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home4u/core/routing/routes.dart';
import 'package:home4u/features/ask_engineer/presentation/ask_engineer_finish_data_and_image.dart';
import 'package:home4u/features/ask_engineer/presentation/ask_engineer_screen.dart';
import 'package:home4u/features/ask_technical_worker/presentation/ask_technical_finish_and_image.dart';
import 'package:home4u/features/auth/forget_password/presentation/forget_password_screen.dart';
import 'package:home4u/features/auth/login/logic/login_cubit.dart';
import 'package:home4u/features/auth/new_password/logic/new_password_cubit.dart';
import 'package:home4u/features/auth/new_password/presentation/new_password_screen.dart';
import 'package:home4u/features/auth/sign_up/logic/engineer/engineer_cubit.dart';
import 'package:home4u/features/auth/sign_up/logic/technical_worker/technical_worker_cubit.dart';
import 'package:home4u/features/auth/sign_up/presentation/engineer_sign_up.dart';
import 'package:home4u/features/auth/sign_up/presentation/engineering_office_screen.dart';
import 'package:home4u/features/auth/sign_up/presentation/sign_up_screen.dart';
import 'package:home4u/features/auth/sign_up/presentation/technical_worker_sign_up.dart';
import 'package:home4u/features/auth/verification/logic/verification_cubit.dart';
import 'package:home4u/features/auth/verification/presentation/verification_screen.dart';
import 'package:home4u/features/cart/presentation/cart_order_details_screen.dart';
import 'package:home4u/features/exhibition/logic/business_add_product_cubit.dart';
import 'package:home4u/features/layout/presentation/exhibitions_and_stores_bottom_nav_layout.dart';
import 'package:home4u/features/layout/presentation/freelancer_bottom_nav_layout.dart';
import 'package:home4u/features/layout/presentation/user_bottom_nav_layout.dart';
import 'package:home4u/features/products/data/models/product_preview_response.dart';
import 'package:home4u/features/products/presentation/product_details_screen.dart';
import 'package:home4u/features/profile/presentation/add_certification_screen.dart';
import 'package:home4u/features/user/home/presentation/best_offices_screen.dart';
import 'package:home4u/features/user/home/presentation/best_show_rooms_screen.dart';
import 'package:home4u/features/user/request_design/presentation/request_design_screen.dart';

import '../../features/ask_technical_worker/presentation/ask_technical_screen.dart';
import '../../features/auth/login/presentation/login_screen.dart';
import '../../features/auth/sign_up/presentation/business_sign_up_screen.dart';
import '../../features/cart/presentation/cart_product_details_screen.dart';
import '../../features/cart/presentation/cart_screen.dart';
import '../../features/cart/presentation/user_favorite_screen.dart';
import '../../features/check_out/presentation/check_out_done_screen.dart';
import '../../features/check_out/presentation/check_out_screen.dart';
import '../../features/exhibition/presentation/business_add_product_screen.dart';
import '../../features/exhibition/presentation/business_overview_screen.dart';
import '../../features/exhibition/presentation/business_review_screen.dart';
import '../../features/onboarding/presentation/onboarding_screen.dart';
import '../../features/orders/presentation/order_details_screen.dart';
import '../../features/orders/presentation/orders_screen.dart';
import '../../features/products/presentation/products_screen.dart';
import '../../features/profile/data/models/certifications/get_certifications_response_model.dart';
import '../../features/profile/data/models/projects/get_projects_response_model.dart';
import '../../features/profile/presentation/add_project_screen.dart';
import '../../features/profile/presentation/edit_profile_screen.dart';
import '../../features/profile/presentation/profile_screen.dart';
import '../../features/profile/presentation/project_details_screen.dart';
import '../../features/projects_filter/presentation/projects_filter_screen.dart';
import '../../features/settings/presentation/setting_screen.dart';
import '../../features/user/home/presentation/user_home_screen.dart';
import '../../features/user/renovate_your_house/presentation/renovate_your_house_first_screen.dart';
import '../../features/user/renovate_your_house/presentation/renovate_your_house_second_screen.dart';
import '../di/dependency_injection.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.loginScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => sl<LoginCubit>(),
            child: LoginScreen(),
          ),
        );
      case Routes.onBoardingScreen:
        return MaterialPageRoute(
          builder: (_) => OnBoardingScreen(),
        );
      case Routes.signUpScreen:
        return MaterialPageRoute(
          builder: (_) => SignUpScreen(),
        );
      case Routes.forgetPasswordScreen:
        return MaterialPageRoute(
          builder: (_) => ForgetPasswordScreen(),
        );
      case Routes.verificationScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => sl<VerificationCubit>(),
            child: VerificationScreen(),
          ),
        );
      case Routes.newPasswordScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => sl<NewPasswordCubit>(),
            child: NewPasswordScreen(),
          ),
        );
      case Routes.engineerSignUpScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider<EngineerCubit>(
            create: (_) => sl<EngineerCubit>(),
            child: EngineerSignUp(),
          ),
        );
      case Routes.technicalWorkerSignUpScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider<TechnicalWorkerCubit>(
            create: (_) => sl<TechnicalWorkerCubit>(),
            child: TechnicalWorkerSignUp(),
          ),
        );
      case Routes.addProjectScreen:
        final projectData = settings.arguments as ProjectsData?;
        return MaterialPageRoute(
          builder: (_) => AddProjectScreen(
            projectData: projectData,
          ),
        );
      case Routes.engineeringOfficeScreen:
        return MaterialPageRoute(
          builder: (_) => EngineeringOfficeScreen(),
        );
      case Routes.profileScreen:
        return MaterialPageRoute(
          builder: (_) => ProfileScreen(),
        );
      case Routes.homeScreen:
        return MaterialPageRoute(
          builder: (_) => UserHomeScreen(),
        );
      case Routes.settingScreen:
        return MaterialPageRoute(
          builder: (_) => SettingScreen(),
        );
      case Routes.addCertificationScreen:
        final certificationData = settings.arguments as CertificationsData?;
        return MaterialPageRoute(
          builder: (_) => AddCertificationScreen(
            certificationsData: certificationData,
          ),
        );
      case Routes.projectDetailsScreen:
        int projectId = settings.arguments as int;
        return MaterialPageRoute(
          builder: (_) => ProjectDetailsScreen(projectId: projectId),
        );

      case Routes.editProfileScreen:
        return MaterialPageRoute(
          builder: (_) => EditProfileScreen(),
        );
      case Routes.productsScreen:
        return MaterialPageRoute(
          builder: (_) => ProductsScreen(),
        );
      case Routes.businessOverviewScreen:
        return MaterialPageRoute(
          builder: (_) => BusinessOverviewScreen(),
        );
      case Routes.businessReviewScreen:
        return MaterialPageRoute(
          builder: (_) => BusinessReviewScreen(),
        );
      // case Routes.productPreviewScreen:
      //   return MaterialPageRoute(
      //     builder: (_) => ProductPreviewScreen(),
      //   );
      case Routes.businessAddProductScreen:
        final productData = settings.arguments as ProductPreviewResponse?;
        return MaterialPageRoute(
          builder: (_) => BlocProvider<BusinessAddProductCubit>(
            create: (_) => sl<BusinessAddProductCubit>(),
            child: BusinessAddProductScreen(
              productData: productData,
            ),
          ),
        );
      case Routes.businessSignUpScreen:
        return MaterialPageRoute(
          builder: (_) => BusinessSignUpScreen(),
        );
      case Routes.productsDetailsScreen:
        int productId = settings.arguments as int;
        return MaterialPageRoute(
          builder: (_) => ProductDetailsScreen(),
        );
      case Routes.cartScreen:
        return MaterialPageRoute(
          builder: (_) => CartScreen(),
        );
      case Routes.cartProductDetailsScreen:
        // int productId = settings.arguments as int;
        return MaterialPageRoute(
          builder: (_) => CartProductDetailsScreen(),
        );
      case Routes.cartOrderDetailsScreen:
        return MaterialPageRoute(
          builder: (_) => CartOrderDetailsScreen(),
        );
      case Routes.userFavoriteScreen:
        return MaterialPageRoute(
          builder: (_) => UserFavoriteScreen(),
        );
      case Routes.userHomeScreen:
        return MaterialPageRoute(
          builder: (_) => UserHomeScreen(),
        );
      case Routes.bestOfficesScreen:
        return MaterialPageRoute(
          builder: (_) => BestOfficesScreen(),
        );
      case Routes.bestShowRoomsScreen:
        return MaterialPageRoute(
          builder: (_) => BestShowRoomsScreen(),
        );
      case Routes.renovateYourHouseScreen:
        return MaterialPageRoute(
          builder: (_) => RenovateYourHouseFirstScreen(),
        );
      case Routes.renovateYourHouseSecondScreen:
        return MaterialPageRoute(
          builder: (_) => RenovateYourHouseSecondScreen(),
        );
      case Routes.askEngineerScreen:
        return MaterialPageRoute(
          builder: (_) => AskEngineerScreen(),
        );
      case Routes.askTechnicalScreen:
        return MaterialPageRoute(
          builder: (_) => AskTechnicalWorkerScreen(),
        );
      case Routes.askEngineerFinishDataAndImage:
        return MaterialPageRoute(
          builder: (_) => AskEngineerFinishDataAndImage(),
        );
      case Routes.requestDesignScreen:
        return MaterialPageRoute(
          builder: (_) => RequestDesignScreen(),
        );
      case Routes.askTechnicalFinishAndImage:
        return MaterialPageRoute(
          builder: (_) => AskTechnicalFinishAndImage(),
        );
      case Routes.projectsFilterScreen:
        return MaterialPageRoute(
          builder: (_) => ProjectsFilterScreen(),
        );
      case Routes.checkOutDoneScreen:
        return MaterialPageRoute(
          builder: (_) => CheckOutDoneScreen(),
        );
      case Routes.orderDetailsScreen:
        return MaterialPageRoute(
          builder: (_) => OrderDetailsScreen(),
        );
      case Routes.ordersScreen:
        return MaterialPageRoute(
          builder: (_) => OrdersScreen(),
        );
      case Routes.freelancerBottomNavLayout:
        return MaterialPageRoute(
          builder: (_) => FreelancerBottomNavLayout(),
        );
      case Routes.exhibitionsAndStoresBottomNavLayout:
        return MaterialPageRoute(
          builder: (_) => ExhibitionsAndStoresBottomNavLayout(),
        );
      case Routes.userBottomNavLayout:
        return MaterialPageRoute(
          builder: (_) => UserBottomNavLayout(),
        );    case Routes.checkOutScreen:
        return MaterialPageRoute(
          builder: (_) => CheckOutScreen(),
        );
      default:
        return null;
    }
  }
}
