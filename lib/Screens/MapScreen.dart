import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:schoolsmapapplication/Models/Locations.dart';

class MapScreen extends StatefulWidget {
  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  Completer<GoogleMapController> _controller = Completer();
  final Set<Marker> _markers = {};
  List<Schools> schools;
  Convertation school = Convertation();

  fetchData() async {
    schools = await school.getSalonSubService();
    return schools;
  }

  Future<void> _onMapCreated(GoogleMapController controller) async {
    _controller.complete(controller);
    //final googleOffices = await locations.getGoogleOffices();
    setState(() {
      _markers.clear();
      for (final school in schools) {
        _markers.add(Marker(
          markerId: MarkerId(school.officialInstitutionName),
          position: LatLng(num.tryParse(school.gisLatitude)?.toDouble() ?? 0,
              num.tryParse(school.gisLongitude)?.toDouble() ?? 0),
          icon: BitmapDescriptor.defaultMarker,
          infoWindow: InfoWindow(
              title: school.officialInstitutionName,
              onTap: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    // return object of type Dialog
                    return AlertDialog(
                      title: new Text(school.officialInstitutionName),
                      content: new Text(
                          "Type: ${school.phasePed}\nTel: ${school.telephone}\nEducators: ${school.educator2018}\nLearners: ${school.learners2018}"),
                    );
                  },
                );
              }),
        ));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: fetchData(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return GoogleMap(
              onMapCreated: _onMapCreated,
              initialCameraPosition: CameraPosition(
                  target: LatLng(-34.0645575195, 18.6011286418), zoom: 10.0),
              markers: _markers,
            );
          } else {
            return Container(
              color: Colors.white,
              alignment: Alignment.center,
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
