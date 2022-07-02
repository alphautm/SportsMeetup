import 'package:flutter/material.dart';
import '../../../participant_viewmodel.dart';
import '/screens/host/edit/edit_sports_screen.dart';
import '/screens/host/hostmain_viewmodel.dart';
import '/screens/host/sport_detail/widgets/bar.dart';
import '/screens/host/sport_detail/widgets/body.dart';

class HostSportDetailScreen extends StatefulWidget {
  HostSportDetailScreen({data, index})
      : _index = index,
        _viewmodel = data;

  final _index;
  HostMainViewmodel _viewmodel;

  @override
  _HostSportDetailScreenState createState() => _HostSportDetailScreenState();
}

class _HostSportDetailScreenState extends State<HostSportDetailScreen> {
  void _onEdit(
      HostMainViewmodel viewmodel, int index, BuildContext context) async {
    final sports = await Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) =>
                EditSportsScreen(data: viewmodel, index: index)));
    if (sports != null) {
      viewmodel.updateSports(index, sports);
    } else {
      print("Null value");
      print(sports);
    }
  }

  @override
  Widget build(BuildContext context) {
    ParticipantViewmodel _participantViewmodel =
        ParticipantViewmodel.overloadedContructorNamedArguemnts(
            widget._viewmodel.sportList[widget._index].id);
    return WillPopScope(
        onWillPop: () => Future.value(true),
        child: SafeArea(
          child: Scaffold(
            backgroundColor: Color.fromRGBO(186, 214, 247, 1),
            appBar: Bar(),
            body: Body(index: widget._index, viewmodel: widget._viewmodel),
            bottomNavigationBar: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Color.fromRGBO(6, 72, 130, 1),
                  ),
                  onPressed: () {
                    showDialog<String>(
                      context: context,
                      builder: (BuildContext context) => AlertDialog(
                        title: const Text('Participants'),
                        content: Text(
                            "${_participantViewmodel.participantCount} has joined this event"),
                        // " has joined this event"),
                        actions: <Widget>[
                          TextButton(
                            onPressed: () => Navigator.pop(context, 'Ok'),
                            child: const Text('Ok'),
                          ),
                        ],
                      ),
                    );
                  },
                  child: Text(
                    "Get Participants Count",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                SizedBox(width: 20.0),
                ElevatedButton(
                  onPressed: () =>
                      _onEdit(widget._viewmodel, widget._index, context),
                  child: Text("Update"),
                ),
                SizedBox(width: 20.0),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.red,
                  ),
                  onPressed: () {
                    widget._viewmodel.removeSports(
                        widget._viewmodel.sportList[widget._index],
                        widget._index);
                    Navigator.pop(context);
                  },
                  child: Text(
                    "Delete",
                    style: TextStyle(color: Colors.white),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
