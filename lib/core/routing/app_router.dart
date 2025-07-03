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
import 'package:home4u/features/furnish_your_home/logic/furnish_your_home_cubit.dart';
import 'package:home4u/features/kitchen_and_dressing/logic/kitchen_and_dressing_cubit.dart';
import 'package:home4u/features/layout/presentation/exhibitions_and_stores_bottom_nav_layout.dart';
import 'package:home4u/features/layout/presentation/freelancer_bottom_nav_layout.dart';
import 'package:home4u/features/layout/presentation/user_bottom_nav_layout.dart';
import 'package:home4u/features/orders/data/models/order_details_response_model.dart';
import 'package:home4u/features/products/data/models/product_preview_response.dart';
import 'package:home4u/features/products/presentation/product_details_screen.dart';
import 'package:home4u/features/profile/presentation/add_certification_screen.dart';
import 'package:home4u/features/rating/logic/product_rating/product_rating_cubit.dart';
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
import '../../features/furnish_your_home/presentation/furnish_your_home_screen.dart';
import '../../features/kitchen_and_dressing/presentation/kitchen_and_dressing_screen.dart';
import '../../features/onboarding/presentation/onboarding_screen.dart';
import '../../features/orders/data/models/orders_response_model.dart';
import '../../features/orders/presentation/order_details_screen.dart';
import '../../features/orders/presentation/orders_screen.dart';
import '../../features/products/presentation/products_screen.dart';
import '../../features/profile/data/models/certifications/get_certifications_response_model.dart';
import '../../features/profile/data/models/projects/get_projects_response_model.dart';
import '../../features/profile/presentation/add_project_screen.dart';
import '../../features/profile/presentation/edit_profile_screen.dart';
import '../../features/profile/presentation/profile_screen.dart';
import '../../features/profile/presentation/project_details_screen.dart';
import '../../features/projects_filter/logic/projects_filter/projects_filter_cubit.dart';
import '../../features/projects_filter/presentation/projects_filter_screen.dart';
import '../../features/rating/presentation/products_rating_screen.dart';
import '../../features/rating/presentation/single_product_rating_screen.dart';
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
          settings: settings,
          builder: (_) => BlocProvider(
            create: (context) => sl<LoginCubit>(),
            child: LoginScreen(),
          ),
        );
      case Routes.onBoardingScreen:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => OnBoardingScreen(),
        );
      case Routes.signUpScreen:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => SignUpScreen(),
        );
      case Routes.forgetPasswordScreen:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => ForgetPasswordScreen(),
        );
      case Routes.verificationScreen:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => BlocProvider(
            create: (context) => sl<VerificationCubit>(),
            child: VerificationScreen(),
          ),
        );
      case Routes.newPasswordScreen:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => BlocProvider(
            create: (context) => sl<NewPasswordCubit>(),
            child: NewPasswordScreen(),
          ),
        );
      case Routes.engineerSignUpScreen:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => BlocProvider<EngineerCubit>(
            create: (_) => sl<EngineerCubit>(),
            child: EngineerSignUp(),
          ),
        );
      case Routes.technicalWorkerSignUpScreen:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => BlocProvider<TechnicalWorkerCubit>(
            create: (_) => sl<TechnicalWorkerCubit>(),
            child: TechnicalWorkerSignUp(),
          ),
        );
      case Routes.addProjectScreen:
        final projectData = settings.arguments as ProjectsData?;
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => AddProjectScreen(projectData: projectData),
        );
      case Routes.engineeringOfficeScreen:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => EngineeringOfficeScreen(),
        );
      case Routes.profileScreen:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => ProfileScreen(),
        );
      case Routes.homeScreen:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => UserHomeScreen(),
        );
      case Routes.settingScreen:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => SettingScreen(),
        );
      case Routes.addCertificationScreen:
        final certificationData = settings.arguments as CertificationsData?;
        return MaterialPageRoute(
          settings: settings,
          builder: (_) =>
              AddCertificationScreen(certificationsData: certificationData),
        );
      case Routes.projectDetailsScreen:
        final projectId = settings.arguments as int;
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => ProjectDetailsScreen(projectId: projectId),
        );
      case Routes.editProfileScreen:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => EditProfileScreen(),
        );
      case Routes.productsScreen:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => ProductsScreen(),
        );
      case Routes.businessOverviewScreen:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => BusinessOverviewScreen(),
        );
      case Routes.businessReviewScreen:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => BusinessReviewScreen(),
        );
      case Routes.businessAddProductScreen:
        final productData = settings.arguments as ProductPreviewResponse?;
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => BlocProvider<BusinessAddProductCubit>(
            create: (_) => sl<BusinessAddProductCubit>(),
            child: BusinessAddProductScreen(productData: productData),
          ),
        );
      case Routes.businessSignUpScreen:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => BusinessSignUpScreen(),
        );
      case Routes.productsDetailsScreen:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => ProductDetailsScreen(),
        );
      case Routes.cartScreen:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => CartScreen(),
        );
      case Routes.cartProductDetailsScreen:
        final productId = settings.arguments as int;
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => CartProductDetailsScreen(
            productId: productId,
          ),
        );
      case Routes.cartOrderDetailsScreen:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => CartOrderDetailsScreen(),
        );
      case Routes.userFavoriteScreen:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => UserFavoriteScreen(),
        );
      case Routes.userHomeScreen:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => UserHomeScreen(),
        );
      case Routes.bestOfficesScreen:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => BestOfficesScreen(),
        );
      case Routes.bestShowRoomsScreen:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => BestShowRoomsScreen(),
        );
      case Routes.renovateYourHouseScreen:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => RenovateYourHouseFirstScreen(),
        );
      case Routes.renovateYourHouseSecondScreen:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => RenovateYourHouseSecondScreen(),
        );
      case Routes.askEngineerScreen:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => AskEngineerScreen(),
        );
      case Routes.askTechnicalScreen:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => AskTechnicalWorkerScreen(),
        );
      case Routes.askEngineerFinishDataAndImage:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => AskEngineerFinishDataAndImage(),
        );
      case Routes.requestDesignScreen:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => RequestDesignScreen(),
        );
      case Routes.askTechnicalFinishAndImage:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => AskTechnicalFinishAndImage(),
        );
      case Routes.projectsFilterScreen:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => ProjectsFilterScreen(),
        );
      case Routes.checkOutDoneScreen:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => CheckOutDoneScreen(),
        );
      case Routes.orderDetailsScreen:
        final arguments = settings.arguments as Map<String, dynamic>;
        final orderId = arguments['orderId'] as int;
        final orderStatus = arguments['orderStatus'] as OrderStatusCode;
        return MaterialPageRoute(
          settings: settings,
          builder: (context) => OrderDetailsScreen(
            orderStatus: orderStatus,
            orderId: orderId,
          ),
        );
      case Routes.ordersScreen:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => OrdersScreen(),
        );
      case Routes.freelancerBottomNavLayout:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => FreelancerBottomNavLayout(),
        );
      case Routes.exhibitionsAndStoresBottomNavLayout:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => ExhibitionsAndStoresBottomNavLayout(),
        );
      case Routes.userBottomNavLayout:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => UserBottomNavLayout(),
        );
      case Routes.checkOutScreen:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => CheckOutScreen(),
        );
      case Routes.furnishYourHomeScreen:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => BlocProvider(
            create: (context) => FurnishYourHomeCubit(sl()),
            child: FurnishYourHomeScreen(),
          ),
        );
      case Routes.kitchenAndDressingScreen:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => BlocProvider(
            create: (context) => KitchenAndDressingCubit(sl()),
            child: KitchenAndDressingScreen(),
          ),
        );
      case Routes.productsRatingScreen:
        final args = settings.arguments as Map<String, dynamic>;
        final List<dynamic> productJsonList = args['products'] ?? [];

        final List<Product> products = productJsonList
            .map((e) => Product.fromJson(e as Map<String, dynamic>))
            .toList();

        return MaterialPageRoute(
          settings: settings,
          builder: (_) => BlocProvider<ProductRatingCubit>(
            create: (context) => sl<ProductRatingCubit>(),
            child: ProductsRatingScreen(
              deliveryAddress: args['deliveryAddress'] as String,
              products: products,
            ),
          ),
        );

      case Routes.singleProductRatingScreen:
        final args = settings.arguments as Map<String, dynamic>;

        return MaterialPageRoute(
          settings: settings,
          builder: (_) => BlocProvider<ProductRatingCubit>(
            create: (context) => sl<ProductRatingCubit>(),
            child: SingleProductRatingScreen(
              deliveryAddress: args['deliveryAddress'] as String,
              product: args['product'] as Product,
            ),
          ),
        );
      default:
        return null;
    }
  }
}
