import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:place_picker/place_picker.dart';

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
                      onTap: () async {
                        LocationResult result =
                            await Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => PlacePicker(
                                      "AIzaSyADX-aBaqvNEmNtayKiQwXeu152t_2E4uc",
                                      displayLocation: widget.myLocation.target,
                                    )));
                      },
                      decoration: InputDecoration(
                          hintText: "Where to",
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
                      decoration: InputDecoration(
                          hintText: "From : My Location",
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
                  onPressed: () {}))
        ],
      ),
    );
  }
}
