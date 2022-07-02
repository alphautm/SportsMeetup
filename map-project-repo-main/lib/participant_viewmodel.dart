import 'package:porcupine_project/screens/user/user_viewmodel.dart';
//import 'package:porcupine_project/services/sport/sport_service.dart';

import '/services/participant/participant_service.dart';

import '/app/dependencies.dart';

import '/screens/viewmodel.dart';
import 'models/participant.dart';
import 'models/user.dart';

class ParticipantViewmodel extends Viewmodel {
  //SportService get _sportViewmodel => dependency();
  UserViewmodel get _userViewmodel => dependency();
  int participantNumber;
  dynamic _sportsId;

  get participantCount => participantNumber;

  get sportsid => _sportsId;

  User get user => _userViewmodel.user;
  set user(User value) => _userViewmodel.user = value;
  // void authenticate(User user) =>
  //     update(() async => _userViewmodel.authenticate(user));

  bool get isUserSignedIn => _userViewmodel.isUserSignedIn;
  ParticipantService get _service => dependency();

  List<Participant> participantList;
  List<Participant> joinedSportsList;
  get joinedSports => joinedSportsList;

  // ParticipantViewmodelArg(String id) {
  //   getParticipantsById(id);
  // }

  ParticipantViewmodel() {}

  ParticipantViewmodel.overloadedContructorNamedArguemnts(String id) {
    getParticipantsById(id);
  }

  ParticipantViewmodel.getList(String id) {
    print(id);
    getJoinedSportsList(id);
  }

  ParticipantViewmodel.getList2(String id) {
    print("getting list");
    getJoinedSportsList(id);
  }

  void getParticipantsById(String sportID) async {
    turnBusy();
    participantList = await _service.getParticipantsById(sportID);
    participantNumber = participantList.length;
    turnIdle();
  }

  void getJoinedSportsList(String participantId) async {
    turnBusy();
    joinedSportsList = await _service.getParticipantsByUserId(participantId);
    turnIdle();
  }

  void joinSports(Participant participant) async {
    turnBusy();
    Participant participants = await _service.joinSports(participant);
    joinedSportsList.add(participants);
    turnIdle();
  }

  void leaveSports(Participant participant, int index) async {
    turnBusy();
    await _service.leaveSports(participant);
    joinedSportsList.removeAt(index);
    turnIdle();
  }
}
