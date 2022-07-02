import 'package:flutter/material.dart';
import '../../../../participant_viewmodel.dart';
import '../../../../screens/participant/main_viewmodel.dart';
import '../../sport_detail/sport_details_screen.dart';
//import '../../../../services/auth/auth_service_firebase_logout.dart';
//import 'package:firebase_auth/firebase_auth.dart';

import '../../../view.dart';
import '../../../../models/user.dart';

class Body extends StatelessWidget {
  Body({state, data})
      : _state = state,
        _data = data;

  final _state;
  User _data;
  final MainViewmodel _mainViewmodel = MainViewmodel();

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
        viewmodel: _mainViewmodel,
        builder: (_context, _viewmodel, _child) {
          ParticipantViewmodel _participantViewmodels =
              ParticipantViewmodel.getList(_data.id);
          //print(_participantViewmodels.joinedSportsList);
          _mainViewmodel.userId = _data.id;
          if (_mainViewmodel.sportList.length == 0) {
            return new Container(
              child: Center(
                child: Text(
                  "No sports hosted yet. Please log in as a host to host your event",
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
      itemCount: _viewmodel.sportList.length,
      separatorBuilder: (context, index) => Divider(
        color: Colors.blueGrey,
      ),
      itemBuilder: (context, index) =>
          _listTile(index, context, _viewmodel, participantViewmodel),
    );
  }

  ListTile _listTile(int index, BuildContext context, MainViewmodel _viewmodel,
      ParticipantViewmodel _participantViewmodels) {
    if (_state.hideAction[0] ||
        _state.hideAction[1] ||
        _state.hideAction[2] ||
        _state.hideAction[3] ||
        _state.hideAction[4] ||
        _state.hideAction[5] ||
        _state.hideAction[6] ||
        _state.hideAction[7] ||
        _state.hideAction[8]) {
      if (_state.hideAction[0]) {
        if (_viewmodel.sportList[index].category == 'Football')
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
                  child: Image.network(_viewmodel.sportList[index].imgUrl,
                      fit: BoxFit.cover),
                ),
                title: Text('${_viewmodel.sportList[index].category}'),
                subtitle: Text('Gender: ${_viewmodel.sportList[index].gender}' +
                    '\nDate: ${_viewmodel.sportList[index].date}'),
                trailing: Icon(Icons.more_vert),
                isThreeLine: true,
                onTap: () => _navSportDetail(
                  context: context,
                  index: index,
                  viewmodel: _viewmodel,
                  participantviewmodel: _participantViewmodels,
                ),
              ),
            ),
          );
      }

      if (_state.hideAction[1]) {
        if (_viewmodel.sportList[index].category == 'Basketball') {
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
                  child: Image.network(_viewmodel.sportList[index].imgUrl,
                      fit: BoxFit.cover),
                ),
                title: Text('${_viewmodel.sportList[index].category}'),
                subtitle: Text('Gender: ${_viewmodel.sportList[index].gender}' +
                    '\nDate: ${_viewmodel.sportList[index].date}'),
                trailing: Icon(Icons.more_vert),
                isThreeLine: true,
                onTap: () => _navSportDetail(
                  context: context,
                  index: index,
                  viewmodel: _viewmodel,
                  participantviewmodel: _participantViewmodels,
                ),
              ),
            ),
          );
        }
      }
      if (_state.hideAction[2]) {
        if (_viewmodel.sportList[index].category == 'Badminton') {
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
                  child: Image.network(_viewmodel.sportList[index].imgUrl,
                      fit: BoxFit.cover),
                ),
                title: Text('${_viewmodel.sportList[index].category}'),
                subtitle: Text('Gender: ${_viewmodel.sportList[index].gender}' +
                    '\nDate: ${_viewmodel.sportList[index].date}'),
                trailing: Icon(Icons.more_vert),
                isThreeLine: true,
                onTap: () => _navSportDetail(
                  context: context,
                  index: index,
                  viewmodel: _viewmodel,
                  participantviewmodel: _participantViewmodels,
                ),
              ),
            ),
          );
        }
      }
      if (_state.hideAction[3]) {
        if (_viewmodel.sportList[index].category == 'Netball') {
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
                  child: Image.network(_viewmodel.sportList[index].imgUrl,
                      fit: BoxFit.cover),
                ),
                title: Text('${_viewmodel.sportList[index].category}'),
                subtitle: Text('Gender: ${_viewmodel.sportList[index].gender}' +
                    '\nDate: ${_viewmodel.sportList[index].date}'),
                trailing: Icon(Icons.more_vert),
                isThreeLine: true,
                onTap: () => _navSportDetail(
                  context: context,
                  index: index,
                  viewmodel: _viewmodel,
                  participantviewmodel: _participantViewmodels,
                ),
              ),
            ),
          );
        }
      }
      if (_state.hideAction[4]) {
        if (_viewmodel.sportList[index].category == 'Rugby') {
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
                  child: Image.network(_viewmodel.sportList[index].imgUrl,
                      fit: BoxFit.cover),
                ),
                title: Text('${_viewmodel.sportList[index].category}'),
                subtitle: Text('Gender: ${_viewmodel.sportList[index].gender}' +
                    '\nDate: ${_viewmodel.sportList[index].date}'),
                trailing: Icon(Icons.more_vert),
                isThreeLine: true,
                onTap: () => _navSportDetail(
                  context: context,
                  index: index,
                  viewmodel: _viewmodel,
                  participantviewmodel: _participantViewmodels,
                ),
              ),
            ),
          );
        }
      }
      if (_state.hideAction[5]) {
        if (_viewmodel.sportList[index].category == 'Chess') {
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
                  child: Image.network(_viewmodel.sportList[index].imgUrl,
                      fit: BoxFit.cover),
                ),
                title: Text('${_viewmodel.sportList[index].category}'),
                subtitle: Text('Gender: ${_viewmodel.sportList[index].gender}' +
                    '\nDate: ${_viewmodel.sportList[index].date}'),
                trailing: Icon(Icons.more_vert),
                isThreeLine: true,
                onTap: () => _navSportDetail(
                  context: context,
                  index: index,
                  viewmodel: _viewmodel,
                  participantviewmodel: _participantViewmodels,
                ),
              ),
            ),
          );
        }
      }
      if (_state.hideAction[6]) {
        if (_viewmodel.sportList[index].category == 'Tennis') {
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
                  child: Image.network(_viewmodel.sportList[index].imgUrl,
                      fit: BoxFit.cover),
                ),
                title: Text('${_viewmodel.sportList[index].category}'),
                subtitle: Text('Gender: ${_viewmodel.sportList[index].gender}' +
                    '\nDate: ${_viewmodel.sportList[index].date}'),
                trailing: Icon(Icons.more_vert),
                isThreeLine: true,
                onTap: () => _navSportDetail(
                  context: context,
                  index: index,
                  viewmodel: _viewmodel,
                  participantviewmodel: _participantViewmodels,
                ),
              ),
            ),
          );
        }
      }
      if (_state.hideAction[7]) {
        if (_viewmodel.sportList[index].gender == 'Male') {
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
                  child: Image.network(_viewmodel.sportList[index].imgUrl,
                      fit: BoxFit.cover),
                ),
                title: Text('${_viewmodel.sportList[index].category}'),
                subtitle: Text('Gender: ${_viewmodel.sportList[index].gender}' +
                    '\nDate: ${_viewmodel.sportList[index].date}'),
                trailing: Icon(Icons.more_vert),
                isThreeLine: true,
                onTap: () => _navSportDetail(
                  context: context,
                  index: index,
                  viewmodel: _viewmodel,
                  participantviewmodel: _participantViewmodels,
                ),
              ),
            ),
          );
        }
      }
      if (_state.hideAction[8]) {
        if (_viewmodel.sportList[index].gender == 'Female') {
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
                  child: Image.network(_viewmodel.sportList[index].imgUrl,
                      fit: BoxFit.cover),
                ),
                title: Text('${_viewmodel.sportList[index].category}'),
                subtitle: Text('Gender: ${_viewmodel.sportList[index].gender}' +
                    '\nDate: ${_viewmodel.sportList[index].date}'),
                trailing: Icon(Icons.more_vert),
                isThreeLine: true,
                onTap: () => _navSportDetail(
                  context: context,
                  index: index,
                  viewmodel: _viewmodel,
                  participantviewmodel: _participantViewmodels,
                ),
              ),
            ),
          );
        } else {
          return ListTile();
        }
      } else {
        return ListTile();
      }
    } else {
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
            child: Image.network(_viewmodel.sportList[index].imgUrl,
                fit: BoxFit.cover),
          ),
          title: Text('${_viewmodel.sportList[index].category}'),
          subtitle: Text('Gender: ${_viewmodel.sportList[index].gender}' +
              '\nDate: ${_viewmodel.sportList[index].date}'),
          trailing: Icon(Icons.more_vert),
          isThreeLine: true,
          onTap: () => _navSportDetail(
            context: context,
            index: index,
            viewmodel: _viewmodel,
            participantviewmodel: _participantViewmodels,
          ),
        ),
      ));
    }
  }
}
