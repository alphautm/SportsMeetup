import '../../models/sports.dart';
import '../../services/sport/sport_service.dart';

import '../../app/dependencies.dart';
//import '../../services/counter/counter_service.dart';
import '../../models/user.dart';
//import '../../models/counter.dart';
import '../user/user_viewmodel.dart';
import '../viewmodel.dart';

class HostMainViewmodel extends Viewmodel {
  SportService get _service => dependency();

  UserViewmodel get _userViewmodel => dependency();
  User get user => _userViewmodel.user;
  set user(User value) => _userViewmodel.user = value;

  bool get isUserSignedIn => _userViewmodel.isUserSignedIn;

  String _category;
  String _date;
  String _gender;
  String _imgUrl;
  int _hostid;
  String _time;
  String _description;
  String _venue;

  get category => _category;
  set category(value) => _category = value;

  get date => _date;
  set date(value) {
    turnBusy();
    _date = value;
    turnIdle();
  }

  get gender => _gender;
  set gender(value) => _gender = value;

  get imgUrl => _imgUrl;
  set imgUrl(value) => _imgUrl = value;

  get hostid => _hostid;
  set hostid(value) => _hostid = value;

  get time => _time;
  set time(value) => _time = value;

  get description => _description;
  set description(value) => _description = value;

  get venue => _venue;
  set venue(value) => _venue = value;

  List<Sports> sportListById;
  get sportList => sportListById;

  HostMainViewmodel(dynamic id) {
    getSportListById(id);
  }

  void getSportListById(dynamic id) async {
    turnBusy();
    sportListById = await _service.getSportsById(id);
    turnIdle();
  }

  void addSports(Sports sport) async {
    turnBusy();
    sport.imgUrl = setImgUrl(sport);
    final Sports sports = await _service.addSports(sport);
    sportListById.add(sports);
    turnIdle();
  }

  void updateSports(int index, Sports sport) async {
    turnBusy();
    sport.imgUrl = setImgUrl(sport);
    final Sports sports = await _service.updateSports(sport);
    sportListById[index] = sports;
    turnIdle();
  }

  void removeSports(Sports sport, int index) async {
    turnBusy();
    print(sport.id);
    await _service.removeSports(sport);
    sportListById.removeAt(index);
    turnIdle();
  }

  void getParticipantsCount() {}

  String setImgUrl(sport) {
    if (sport.category == "Basketball") {
      return "https://images.idgesg.net/images/article/2017/10/thinkstockbasketball-100739114-large.jpg";
    } else if (sport.category == "Chess") {
      return "https://images.ctfassets.net/3s5io6mnxfqz/wfAz3zUBbrcf1eSMLZi8u/c03ac28c778813bd72373644ee8b8b02/AdobeStock_364059453.jpeg";
    } else if (sport.category == "Badminton") {
      return "https://cdn.shopify.com/s/files/1/0020/9407/1890/files/shuttles-close-up_480x480.jpg?v=1559295221";
    } else if (sport.category == "Football") {
      return "https://cdn.britannica.com/51/190751-050-147B93F7/soccer-ball-goal.jpg";
    } else if (sport.category == "Netball") {
      return "https://site-cdn.givemesport.com/images/21/04/09/78f1d42e12229eef7ff67cd31553a208/1201.jpg";
    } else if (sport.category == "Rugby") {
      return "https://media-exp3.licdn.com/dms/image/C4D1BAQEbK27dUrc8gw/company-background_10000/0/1606065033776?e=2159024400&v=beta&t=uW53XCCkiGcq2XXKJ0Sb_n3yCejG3di6K_fY_9gpp2E";
    } else if (sport.category == "Tennis") {
      return "https://m.andalusiastarnews.com/wp-content/uploads/sites/13/2021/05/tennisracket_top.jpg";
    } else {
      return "None";
    }
  }
}
