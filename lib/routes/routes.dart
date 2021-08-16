// @CupertinoAutoRouter
// @AdaptiveAutoRouter
// @CustomAutoRouter
import 'package:auto_route/auto_route.dart';
import 'package:wamui/ui/home/home_page.dart';
import 'package:wamui/ui/onboarding/onboarding.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(page: OnboardingPage, initial: true),
    AutoRoute(
      page: HomePage,
    )
  ],
)
class $AppRouter {}
