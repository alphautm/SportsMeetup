import 'package:flutter/material.dart';
import 'package:porcupine_project/screens/profile/widgets/bar.dart';
import 'package:porcupine_project/screens/profile/widgets/body.dart';
import 'package:porcupine_project/screens/venue_maintenance/venue_maintenance_screen.dart';
import '/screens/host/add/add_sports_screen.dart';
import '/screens/user/user_viewmodel.dart';

//import 'widgets/bar/signed_in_bar.dart';
//import 'widgets/bar/unsigned_in_bar.dart';
//import 'widgets/body.dart';
//import 'widgets/float.dart';
import '../view.dart';

import '../../models/user.dart';

class ProfileMainScreen extends StatelessWidget {
  ProfileMainScreen({data}) : _data = data;
  static Route route({data}) =>
      MaterialPageRoute(builder: (context) => ProfileMainScreen(data: data));
  User _data;

  final UserViewmodel viewmodel = UserViewmodel();

  //final HostMainViewmodel _hostMainViewmodel = HostMainViewmodel(_data);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color.fromRGBO(224, 224, 224, 1),
        appBar: Bar(),
        body: Body(),
        floatingActionButton: FloatingActionButton(
          onPressed: (() {
            Navigator.push(
                         
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                VenueMaintenanceScreen(
                                 
                                  )
                              )
                            ); 
          }),
          child: Icon(
            Icons.map,
            color: Colors.white,
          ),
          heroTag: null,
          tooltip: 'Host New Event',
          backgroundColor: Color.fromRGBO(64, 64, 64, 1),
        ),
        bottomNavigationBar: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("User selection"),
            )
          ],
        ),
      ),
    );
  }
}
