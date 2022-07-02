import 'package:flutter/material.dart';
import 'package:porcupine_project/screens/AddNewScreen.dart';
import '/screens/host/add/add_sports_screen.dart';
import '/screens/user/user_viewmodel.dart';
import '../../screens/host/widgets/body.dart';
import '../../screens/host/widgets/bar.dart';
//import 'widgets/bar/signed_in_bar.dart';
//import 'widgets/bar/unsigned_in_bar.dart';
//import 'widgets/body.dart';
//import 'widgets/float.dart';
import '../view.dart';
import 'hostmain_viewmodel.dart';
import '../../models/user.dart';

class HostMainScreen extends StatelessWidget {
  HostMainScreen({data}) : _data = data;
  static Route route({data}) =>
      MaterialPageRoute(builder: (context) => HostMainScreen(data: data));
  User _data;

  final UserViewmodel viewmodel = UserViewmodel();

  void _onAdd(BuildContext context, HostMainViewmodel viewmodel) async {
    final sports = await Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => AddSportsScreen(data: viewmodel)));
    if (sports != null) {
      viewmodel.addSports(sports);
    } else {
      print("Null value");
      print(sports);
    }
  }

    void _newItem(BuildContext context, HostMainViewmodel viewmodel) async {
            Navigator.push(
                         
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                AddNewScreen(
                                 
                                  )
                              )
                            ); 
  }

  //final HostMainViewmodel _hostMainViewmodel = HostMainViewmodel(_data);

  @override
  Widget build(BuildContext context) {
    return View(
        viewmodel: HostMainViewmodel(_data.id),
        builder: (_context, _viewmodel, _) {
          _viewmodel.user = _data;

          return WillPopScope(
            onWillPop: () => Future.value(false),
            child: SafeArea(
              child: Scaffold(
                backgroundColor: Color.fromRGBO(224, 224, 224, 1),
                appBar: Bar(),
                body: Body(_viewmodel),
                floatingActionButton: FloatingActionButton(
                  onPressed: () => _newItem(context, _viewmodel),
                  child: Icon(
                    Icons.add,
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
            ),
          );
        });
  }
}
