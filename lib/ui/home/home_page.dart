import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
              top: 100,
              left: 20,
              right: 20,
              child: Card(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextField(
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
