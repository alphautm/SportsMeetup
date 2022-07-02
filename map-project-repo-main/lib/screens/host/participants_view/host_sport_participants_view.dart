import 'package:flutter/material.dart';
import '../../../screens/host/hostmain_viewmodel.dart';
import '/screens/host/participants_view/widgets/bar.dart';
import '/screens/host/participants_view/widgets/body.dart';

class HostSportParticipantsScreen extends StatefulWidget {
  HostSportParticipantsScreen({data, index})
      : _index = index,
        _viewmodel = data;

  final _index;
  HostMainViewmodel _viewmodel;
  @override
  _HostSportParticipantsScreenState createState() =>
      _HostSportParticipantsScreenState();
}

class _HostSportParticipantsScreenState
    extends State<HostSportParticipantsScreen> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () => Future.value(true),
        child: SafeArea(
          child: Scaffold(
            backgroundColor: Color.fromRGBO(186, 214, 247, 1),
            appBar: Bar(),
            body: Body(index: widget._index, viewmodel: widget._viewmodel),
          ),
        ));
  }
}
