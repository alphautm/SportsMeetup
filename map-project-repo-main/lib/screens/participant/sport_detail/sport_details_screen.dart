import 'package:flutter/material.dart';
import '../../../participant_viewmodel.dart';
import '/models/participant.dart';
import '/screens/participant/main_viewmodel.dart';
import '../../../screens/participant/sport_detail/widgets/bar.dart';
import '../../../screens/participant/sport_detail/widgets/body.dart';
import '../../view.dart';

class SportDetailScreen extends StatefulWidget {
  static Route route() =>
      MaterialPageRoute(builder: (context) => SportDetailScreen());

  SportDetailScreen({index, viewmodel, participantviewmodel})
      : _index = index,
        _mainViewmodel = viewmodel,
        _participantviewmodel = participantviewmodel;

  final _index;
  MainViewmodel _mainViewmodel;

  final ParticipantViewmodel _participantviewmodel;

  @override
  _SportDetailScreenState createState() => _SportDetailScreenState();
}

class _SportDetailScreenState extends State<SportDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return View(
        viewmodel: widget._mainViewmodel,
        builder: (_context, _viewmodel, _child) {
          return new WillPopScope(
              onWillPop: () => Future.value(true),
              child: SafeArea(
                child: Scaffold(
                  backgroundColor: Color.fromRGBO(186, 214, 247, 1),
                  appBar: Bar(
                    state: this,
                  ),
                  body: Body(index: widget._index),
                  bottomNavigationBar: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      buildElevatedButton(widget._mainViewmodel, widget._index,
                          widget._participantviewmodel, context)
                    ],
                  ),
                ),
              ));
        });
  }
}

Widget buildElevatedButton(
    mainviewmodel, index, participantviewmodel, context) {
  var status = checkJoinStatus(participantviewmodel, mainviewmodel, index);
  if (mainviewmodel.userId == mainviewmodel.sportList[index].hostid) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: Colors.red,
      ),
      onPressed: () {},
      child: Text(
        "Cannot Join Sports",
        style: TextStyle(color: Colors.white),
      ),
    );
  } else {
    if (status == true) {
      return ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: Color.fromRGBO(6, 72, 130, 1),
        ),
        onPressed: () =>
            _joinSports(mainviewmodel, index, participantviewmodel, context),
        child: Text(
          "Join Sports",
          style: TextStyle(color: Colors.white),
        ),
      );
    } else {
      return ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: Color.fromRGBO(6, 72, 130, 1),
        ),
        onPressed: () =>
            leaveSports(participantviewmodel, mainviewmodel, index, context),
        child: Text(
          "Leave Sports",
          style: TextStyle(color: Colors.white),
        ),
      );
    }
  }
}

void _joinSports(mainviewmodel, index, participantviewmodel, context) {
  var _participants = new Participant(
    participantId: mainviewmodel.userId,
    sportsId: mainviewmodel.sportList[index].id,
  );
  participantviewmodel.joinSports(_participants);
  Navigator.pop(context);
}

void leaveSports(participantviewmodel, mainviewmodel, index, context) {
  var participantIndex = 0;
  for (var i = 0; i < participantviewmodel.joinedSportsList.length; i++) {
    if (participantviewmodel.joinedSportsList[i].sportsId ==
        mainviewmodel.sportList[index].id) {
      participantIndex = i;
    }
  }
  participantviewmodel.leaveSports(
      participantviewmodel.joinedSports[participantIndex], participantIndex);
  Navigator.pop(context);
}

bool checkJoinStatus(participantviewmodel, mainviewmodel, index) {
  var sum = 0;
  print(participantviewmodel.joinedSportsList);
  if (participantviewmodel.joinedSportsList != null) {
    for (var i = 0; i < participantviewmodel.joinedSportsList.length; i++) {
      if (participantviewmodel.joinedSportsList[i].sportsId ==
          mainviewmodel.sportList[index].id) {
        sum++;
      }
    }
    if (sum == 0) {
      return true;
    } else {
      return false;
    }
  } else {
    return true;
  }
}
