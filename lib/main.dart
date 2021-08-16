import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wamui/routes/routes.gr.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  var _appRouter = AppRouter();
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: "Trafiki",
        theme: ThemeData(
            textTheme: GoogleFonts.latoTextTheme(),
            primarySwatch: Colors.purple),
        routeInformationParser: _appRouter.defaultRouteParser(),
        routerDelegate: _appRouter.delegate());
  }
}
