//import 'package:exercise3/screens/main/counter_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:porcupine_project/screens/participant/joined_sports/joined_screen.dart';
import '../../../participant_viewmodel.dart';
import '/screens/user/user_viewmodel.dart';
// import '../../../services/sport/sport_service_rest.dart';
import '../../../screens/participant/main/widgets/body.dart';
import '../../../screens/participant/main/widgets/bar.dart';
// import '../../../models/sports.dart';

//import 'widgets/bar/signed_in_bar.dart';
//import 'widgets/bar/unsigned_in_bar.dart';
//import 'widgets/body.dart';
//import 'widgets/float.dart';
import '../../view.dart';
import '../main_viewmodel.dart';
import '../../../models/user.dart' as a;
// import '../../../services/sport/sport_service.dart';

class MainScreen extends StatefulWidget {
  static Route route({data}) =>
      MaterialPageRoute(builder: (context) => MainScreen(data: data));
  a.User _data;
  MainScreen({isEditing, data}) : _data = data;
  @override
  _MainScreenState createState() => _MainScreenState();
}

final MainViewmodel _mainViewmodel = MainViewmodel();
final UserViewmodel viewmodel = UserViewmodel();

class _MainScreenState extends State<MainScreen> {
  get hideAction => _mainViewmodel.hideAction;

  void _navJoinedScreen({context, viewmodel, partviewmodel}) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => JoinedMainScreen(
                  viewmodel: viewmodel,
                  partviewmodel: partviewmodel,
                )));
  }

  @override
  Widget build(BuildContext context) {
    _mainViewmodel.userId = widget._data.id;
    return View(
        viewmodel: _mainViewmodel,
        builder: (_context, _viewmodel, _) {
          ParticipantViewmodel participantViewmodels =
              ParticipantViewmodel.getList2(widget._data.id);
          return new WillPopScope(
            onWillPop: () => Future.value(false),
            child: SafeArea(
              child: Scaffold(
                backgroundColor: Color.fromRGBO(186, 214, 247, 1),
                appBar: Bar(
                  state: this,
                ),
                endDrawer: Drawer(
                  child: ListView.builder(
                      itemExtent: 50.0,
                      itemCount: _viewmodel.sports.length,
                      itemBuilder: (_, index) {
                        return new CheckboxListTile(
                          value: _viewmodel.isChecked[index],
                          onChanged: (bool value) {
                            setState(
                              () {
                                _viewmodel.hideAction[index] = value;
                                _viewmodel.isChecked[index] = value;
                              },
                            );
                          },
                          title: Text(_viewmodel.sports[index]),
                        );
                      }),
                ),
                body: Body(
                  state: this,
                  data: widget._data,
                ),
                bottomNavigationBar: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text("User selection"),
                    ),
                    SizedBox(width: 20.0),
                    ElevatedButton(
                      onPressed: () {
                        _navJoinedScreen(
                          context: context,
                          viewmodel: _viewmodel,
                          partviewmodel: participantViewmodels,
                        );
                      },
                      child: Text("View Joined Sports"),
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }
}
