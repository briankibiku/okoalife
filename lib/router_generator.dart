import 'features/article_page.dart';
import 'features/blood_request_detail.dart';
import 'features/donor_home_page.dart';
import 'features/donor_profile.dart';
import 'features/donor_setup.dart';
import 'features/health_tips.dart';
import 'features/post_blood_request.dart';
import 'features/recipient_home_page.dart';
import 'features/recipient_profile.dart';
import 'features/recipient_setup.dart';
import 'features/user_type.dart';
import 'routes.dart';

import 'package:flutter/material.dart';

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.userType:
        return MaterialPageRoute(builder: (_) => UserType());
      case Routes.donorSetup:
        return MaterialPageRoute(builder: (_) => DonorSetup());
      case Routes.articlePage:
        return MaterialPageRoute(builder: (_) => ArticlePage());
      case Routes.donorHomePage:
        return MaterialPageRoute(builder: (_) => DonorHomePage());
      case Routes.recipeintSetup:
        return MaterialPageRoute(builder: (_) => RecipientSetup());
      case Routes.healthTipsPage:
        return MaterialPageRoute(builder: (_) => HealthTipsPage());
      case Routes.donorProfilePage:
        return MaterialPageRoute(builder: (_) => DonorProfilePage());
      case Routes.recipientHomePage:
        return MaterialPageRoute(builder: (_) => RecipientHomePage());
      case Routes.recipientProfilePage:
        return MaterialPageRoute(builder: (_) => RecipientProfilePage());
      case Routes.postBloodRequestPage:
        return MaterialPageRoute(builder: (_) => PostBloodRequestPage());
      case Routes.bloodRequestDetailPage:
        return MaterialPageRoute(builder: (_) => BloodRequestDetailPage());
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                      child: Text('No route defined for ${settings.name}')),
                ));
    }
  }
}
