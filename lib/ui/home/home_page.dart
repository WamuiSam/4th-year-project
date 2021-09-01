import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:place_picker/place_picker.dart';
import 'package:wamui/cubits/from_cubit%20.dart';
import 'package:wamui/cubits/polylines_cubit.dart';
import 'package:wamui/cubits/where_to_cubit.dart';

class HomePage extends StatefulWidget {
  final CameraPosition myLocation;
  HomePage({Key? key, required this.myLocation}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          GoogleMap(
            mapType: MapType.normal,
            polylines: {context.read<PolyLinesCubit>().state},
            myLocationEnabled: true,
            initialCameraPosition: widget.myLocation,
            onMapCreated: (GoogleMapController controller) async {},
          ),
          Positioned(
              top: 100,
              left: 20,
              right: 20,
              child: Card(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextField(
                      controller: TextEditingController(
                          text: context.watch<WhereToCubit>().state.name),
                      onTap: () async {
                        LocationResult result =
                            await Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => PlacePicker(
                                      "AIzaSyADX-aBaqvNEmNtayKiQwXeu152t_2E4uc",
                                      displayLocation: widget.myLocation.target,
                                    )));

                        context.read<WhereToCubit>().emit(result);
                      },
                      decoration: InputDecoration(
                          hintText: context.watch<WhereToCubit>().state.name ??
                              "Where to...",
                          enabledBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.purple, width: 2),
                              borderRadius: BorderRadius.circular(5)),
                          border: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.purple, width: 2),
                              borderRadius: BorderRadius.circular(5))),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextField(
                      controller: TextEditingController(
                          text: context.watch<FromCubit>().state.name),
                      onTap: () async {
                        LocationResult result =
                            await Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => PlacePicker(
                                      "AIzaSyADX-aBaqvNEmNtayKiQwXeu152t_2E4uc",
                                      displayLocation: widget.myLocation.target,
                                    )));

                        context.read<FromCubit>().emit(result);
                        //Set the polylines
                        PolylinePoints polylinePoints = PolylinePoints();
                        PolylineResult polylineResult =
                            await polylinePoints.getRouteBetweenCoordinates(
                          "AIzaSyADX-aBaqvNEmNtayKiQwXeu152t_2E4uc",
                          PointLatLng(result.latLng!.latitude,
                              result.latLng!.longitude),
                          PointLatLng(
                              context
                                  .read<WhereToCubit>()
                                  .state
                                  .latLng!
                                  .latitude,
                              context
                                  .read<WhereToCubit>()
                                  .state
                                  .latLng!
                                  .latitude),
                        );
                        print(polylineResult.errorMessage);
                        List<LatLng> polylineCoordinates = [];
                        // loop through all PointLatLng points and convert them
                        // to a list of LatLng, required by the Polyline
                        polylineResult.points.forEach((PointLatLng point) {
                          polylineCoordinates
                              .add(LatLng(point.latitude, point.longitude));
                        });

                        Polyline polyline = Polyline(
                            polylineId: PolylineId("Poly"),
                            color: Color.fromARGB(255, 40, 122, 198),
                            points: polylineCoordinates);

                        // add the constructed polyline as a set of points
                        // to the polyline set, which will eventually
                        // end up showing up on the map
                        print("Adding polyline");
                        context.read<PolyLinesCubit>().emit(polyline);
                      },
                      decoration: InputDecoration(
                          hintText: context.watch<FromCubit>().state.name ??
                              "From : My Location",
                          enabledBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.purple, width: 2),
                              borderRadius: BorderRadius.circular(5)),
                          border: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.purple, width: 2),
                              borderRadius: BorderRadius.circular(5))),
                    ),
                  ],
                ),
              )),
          Positioned(
              bottom: 50,
              right: 20,
              left: 20,
              child: CupertinoButton(
                  color: Colors.purple,
                  child: Text("Check Traffick Info"),
                  onPressed: () {
                    print(context.read<PolyLinesCubit>().state.polylineId);
                  }))
        ],
      ),
    );
  }
}