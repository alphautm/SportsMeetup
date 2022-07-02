import 'package:flutter/material.dart';
import '../../../../participant_viewmodel.dart';
import '../../../../screens/participant/main_viewmodel.dart';
import '../../sport_detail/sport_details_screen.dart';
//import '../../../../services/auth/auth_service_firebase_logout.dart';
//import 'package:firebase_auth/firebase_auth.dart';

import '../../../view.dart';

class Body extends StatelessWidget {
  Body({state, data, data2})
      : _state = state,
        _data = data,
        _participantViewmodels = data2;

  final _state;
  final MainViewmodel _data;
  final ParticipantViewmodel _participantViewmodels;

  void _navSportDetail({context, index, viewmodel, participantviewmodel}) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => SportDetailScreen(
                  index: index,
                  viewmodel: viewmodel,
                  participantviewmodel: participantviewmodel,
                )));
  }

  @override
  Widget build(BuildContext context) {
    return View(
        viewmodel: _data,
        builder: (_context, _viewmodel, _child) {
          // print(_viewmodel.userId);
          // print("this is checking");
          // print(_participantViewmodels.joinedSportsList[0].id);
          // print(_participantViewmodels.joinedSportsList[1].id);

          if (_participantViewmodels.joinedSportsList == null) {
            return new Container(
              child: Center(
                child: Text(
                  "No sports joined yet",
                  textAlign: TextAlign.center,
                ),
              ),
            );
          } else {
            return new Container(
                width: double.infinity,
                height: double.infinity,
                child: _buildListView(_viewmodel, _participantViewmodels));
          }
        });
  }

  ListView _buildListView(
      MainViewmodel _viewmodel, ParticipantViewmodel participantViewmodel) {
    return ListView.separated(
      itemCount: participantViewmodel.joinedSportsList.length,
      separatorBuilder: (context, index) => Divider(
        color: Colors.blueGrey,
      ),
      itemBuilder: (context, index) =>
          _listTile(index, context, _viewmodel, participantViewmodel),
    );
  }

  ListTile _listTile(int index, BuildContext context, MainViewmodel _viewmodel,
      ParticipantViewmodel _participantViewmodels) {
    for (var j = 0; j < 3; j++) {
      for (var i = 0; i < 9; i++) {
        if (_participantViewmodels.joinedSportsList[j].sportsId ==
            _viewmodel.sportList[i].id) {
          return ListTile(
              title: Card(
            child: ListTile(
              leading: ConstrainedBox(
                constraints: BoxConstraints(
                  minWidth: 44,
                  minHeight: 70,
                  maxWidth: 80,
                  maxHeight: 80,
                ),
                child: Image.network(_viewmodel.sportList[i].imgUrl,
                    fit: BoxFit.cover),
              ),
              title: Text('${_viewmodel.sportList[i].category}'),
              subtitle: Text('Gender: ${_viewmodel.sportList[i].gender}' +
                  '\nDate: ${_viewmodel.sportList[i].date}'),
              trailing: Icon(Icons.more_vert),
              isThreeLine: true,
              onTap: () => _navSportDetail(
                context: context,
                index: i,
                viewmodel: _viewmodel,
                participantviewmodel: _participantViewmodels,
              ),
            ),
          ));
        } else {}
      }
    }
  }
}
