// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:auto_route/auto_route.dart' as _i1;
import 'package:flutter/cupertino.dart' as _i6;
import 'package:flutter/material.dart' as _i2;
import 'package:google_maps_flutter/google_maps_flutter.dart' as _i7;

import '../ui/home/home_page.dart' as _i4;
import '../ui/info/traffick_info_page.dart' as _i5;
import '../ui/onboarding/onboarding.dart' as _i3;

class AppRouter extends _i1.RootStackRouter {
  AppRouter([_i2.GlobalKey<_i2.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i1.PageFactory> pagesMap = {
    OnboardingRoute.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (_) {
          return const _i3.OnboardingPage();
        }),
    HomeRoute.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (data) {
          final args = data.argsAs<HomeRouteArgs>();
          return _i4.HomePage(key: args.key, myLocation: args.myLocation);
        }),
    TraffickInfo.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (_) {
          return const _i5.TraffickInfo();
        })
  };

  @override
  List<_i1.RouteConfig> get routes => [
        _i1.RouteConfig(OnboardingRoute.name, path: '/'),
        _i1.RouteConfig(HomeRoute.name, path: '/home-page'),
        _i1.RouteConfig(TraffickInfo.name, path: '/traffick-info')
      ];
}

class OnboardingRoute extends _i1.PageRouteInfo {
  const OnboardingRoute() : super(name, path: '/');

  static const String name = 'OnboardingRoute';
}

class HomeRoute extends _i1.PageRouteInfo<HomeRouteArgs> {
  HomeRoute({_i6.Key? key, required _i7.CameraPosition myLocation})
      : super(name,
            path: '/home-page',
            args: HomeRouteArgs(key: key, myLocation: myLocation));

  static const String name = 'HomeRoute';
}

class HomeRouteArgs {
  const HomeRouteArgs({this.key, required this.myLocation});

  final _i6.Key? key;

  final _i7.CameraPosition myLocation;
}

class TraffickInfo extends _i1.PageRouteInfo {
  const TraffickInfo() : super(name, path: '/traffick-info');

  static const String name = 'TraffickInfo';
}
