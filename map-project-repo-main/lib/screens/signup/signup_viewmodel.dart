import '../../app/dependencies.dart';
import '../../services/auth_signup/auth_service_signup.dart';
import '../../models/user.dart';
import '../viewmodel.dart';

class SignupViewmodel extends Viewmodel {
  AuthServiceSignup get _service => dependency();
  User _user = User();
  bool _showPassword = false;
  bool _showErrorMessage = false;

  get user => _user;
  set user(value) => _user = value;

  get showPassword => _showPassword;
  set showPassword(value) {
    turnBusy();
    _showPassword = value;
    turnIdle();
  }

  get showErrorMessage => _showErrorMessage;
  set showErrorMessage(value) {
    turnBusy();
    _showErrorMessage = value;
    turnIdle();
  }

  get username => _user.login;
  set username(value) {
    turnBusy();
    _showErrorMessage = false;
    _user.login = value;
    turnIdle();
  }

  get password => _user.password;
  set password(value) {
    turnBusy();
    _showErrorMessage = false;
    _user.password = value;
    turnIdle();
  }

  get email => _user.email;
  set email(value) {
    turnBusy();
    _showErrorMessage = false;
    _user.email = value;
    turnIdle();
  }

  Future<User> authenticate() async {
    turnBusy();
    final User _user = await _service.signUp(
        email: email, password: password, username: username);
    if (_user == null) _showErrorMessage = true;
    turnIdle();
    return _user;
  }
}
