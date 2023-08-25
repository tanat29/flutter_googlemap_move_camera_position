import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String googleApikey = "GOOGLE MAP API KEY";
  GoogleMapController? mapController;
  LatLng startLocation = LatLng(27.6602292, 85.308027);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text("Move to New Position of Map"),
        ),
        body: GoogleMap(
          zoomGesturesEnabled: true,
          initialCameraPosition: CameraPosition(
            target: startLocation,
            zoom: 14.0,
          ),
          mapType: MapType.normal,
          onMapCreated: (controller) {
            setState(() {
              mapController = controller;
            });
          },
        ),
        floatingActionButton: Container(
          margin: EdgeInsets.only(right: 50),
          child: FloatingActionButton(
            child: Text("Move"),
            onPressed: () {
              LatLng newlatlang = LatLng(13.8021001, 100.7392151);
              mapController?.animateCamera(CameraUpdate.newCameraPosition(
                  CameraPosition(target: newlatlang, zoom: 17)));
            },
          ),
        ));
  }
}
