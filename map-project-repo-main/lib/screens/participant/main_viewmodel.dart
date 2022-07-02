import '../../models/sports.dart';
import '../../services/sport/sport_service.dart';

import '../../app/dependencies.dart';
import '../../models/user.dart';
import '../user/user_viewmodel.dart';
import '../viewmodel.dart';

const List<String> _sports = [
  'Football',
  'Basketball',
  'Badminton',
  'Netball',
  'Rugby',
  'Chess',
  'Tennis',
  'Male',
  'Female'
];

const List<String> _genders = ['Male', 'Female'];

class MainViewmodel extends Viewmodel {
  SportService get _service => dependency();
  dynamic _userId;
  get userId => _userId;
  set userId(value) => _userId = value;

  UserViewmodel get _userViewmodel => dependency();
  User get user => _userViewmodel.user;
  set user(User value) => _userViewmodel.user = value;

  bool get isUserSignedIn => _userViewmodel.isUserSignedIn;

  List<Sports> sportList;

  List<bool> _isChecked = List.generate(_sports.length, (index) => false);
  List<bool> _hideAction = List.generate(_sports.length, (index) => false);
  List<bool> _gender = List.generate(_genders.length, (index) => false);
  List<bool> _isCheckedGender =
      List.generate(_genders.length, (index) => false);

  MainViewmodel() {
    getSportList();
  }

  MainViewmodel.getSportsByUserID() {}

  void getSportList() async {
    turnBusy();
    sportList = await _service.getSports();
    turnIdle();
  }

  Future<List<Sports>> _sportListFuture;
  get sportListFuture => _sportListFuture;
  set sportListFuture(value) {
    turnBusy();
    _sportListFuture = value;
    turnIdle();
  }

  void refreshSportsListFuture() =>
      update(() async => _sportListFuture = _service.getSports());

  get isCheckedGender => _isCheckedGender;
  set isCheckedGender(value) => _isCheckedGender = value;

  get isChecked => _isChecked;
  set isChecked(value) => _isChecked = value;

  get hideAction => _hideAction;
  set hideAction(value) => _hideAction = value;

  get gender => _gender;
  set gender(value) => _gender = value;

  get sports => _sports;
}
