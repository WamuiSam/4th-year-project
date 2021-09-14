import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:place_picker/entities/entities.dart';
import 'package:wamui/cubits/from_cubit%20.dart';
import 'package:wamui/cubits/polylines_cubit.dart';
import 'package:wamui/cubits/traffick_info_cubit/trafick_info_cubit.dart';
import 'package:wamui/cubits/where_to_cubit.dart';
import 'package:wamui/routes/routes.gr.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();
  var _appRouter = AppRouter();
  User? user = FirebaseAuth.instance.currentUser;
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => WhereToCubit(LocationResult())),
        BlocProvider(create: (context) => FromCubit(LocationResult())),
        BlocProvider(create: (context) => TrafickInfoCubit()),
        BlocProvider(
            create: (context) =>
                PolyLinesCubit(Polyline(polylineId: PolylineId('nill')))),
      ],
      child: MaterialApp.router(
          debugShowCheckedModeBanner: false,
          title: "Trafiki",
          theme: ThemeData(
              textTheme: GoogleFonts.latoTextTheme(),
              primarySwatch: Colors.purple),
          routeInformationParser: _appRouter.defaultRouteParser(),
          routerDelegate: _appRouter.delegate(
              //  initialDeepLink: user != null ? '/home-page' : '/'
              )),
    );
  }
}
