// @CupertinoAutoRouter
// @AdaptiveAutoRouter
// @CustomAutoRouter
import 'package:auto_route/auto_route.dart';
import 'package:wamui/ui/home/home_page.dart';
import 'package:wamui/ui/info/traffick_info_page.dart';
import 'package:wamui/ui/onboarding/onboarding.dart';

//routes to the dufferent pages in the project
@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(page: OnboardingPage, initial: true),
    AutoRoute(
      page: HomePage,
    ),
    AutoRoute(
      page: TraffickInfo,
    ),
  ],
)
class $AppRouter {}
