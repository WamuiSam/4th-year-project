import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:place_picker/entities/entities.dart';
import 'package:wamui/cubits/dark_theme_cubit.dart';
import 'package:wamui/cubits/from_cubit%20.dart';
import 'package:wamui/cubits/polylines_cubit.dart';
import 'package:wamui/cubits/traffick_info_cubit/trafick_info_cubit.dart';
import 'package:wamui/cubits/where_to_cubit.dart';
import 'package:wamui/routes/routes.gr.dart';

//where program starts. this is the entry point of the program
void main() async {
//links program with the cubits
// cubits store observable data temporarily. it is a lightweight state management
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MultiBlocProvider(providers: [
    BlocProvider(create: (context) => WhereToCubit(LocationResult())),
    BlocProvider(create: (context) => FromCubit(LocationResult())),
    BlocProvider(create: (context) => TrafickInfoCubit()),
    BlocProvider(create: (context) => DarkThemeCubit(false)),
    BlocProvider(
        create: (context) =>
            PolyLinesCubit(Polyline(polylineId: PolylineId('nill')))),
  ], child: MyApp()));
}

//this is the entry point of the firebase SDK
// ignore: must_be_immutable
class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  var _appRouter = AppRouter();
  User? user = FirebaseAuth.instance.currentUser;
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      //defines the system title and themes and sets app to light theme by default
      title: "Trafiki",
      theme: ThemeData(
          textTheme: GoogleFonts.latoTextTheme(),
          brightness: context.watch<DarkThemeCubit>().state
              ? Brightness.dark
              : Brightness.light,
          primarySwatch: Colors.purple),
      routeInformationParser: _appRouter.defaultRouteParser(),
      routerDelegate: _appRouter.delegate(),
    );
  }
}
