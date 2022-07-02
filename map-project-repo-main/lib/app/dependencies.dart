// import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import '../../services/participant/participant_service.dart';
import '../../services/participant/participant_service_rest.dart';
import '../../screens/participant/main_viewmodel.dart';
import '../../services/sport/sport_service.dart';
import '../../services/sport/sport_service_rest.dart';

import '../services/rest.dart';
import '../screens/user/user_viewmodel.dart';

//import '../services/auth/auth_service.dart';
//import '../services/auth_signup/auth_service_signup.dart';
//import '../services/counter/counter_service.dart';

//import '../services/auth/auth_service_rest.dart';
//import '../services/auth/auth_service_firebase.dart';
//import '../services/auth/auth_service_firebase_login.dart';
//import '../services/auth_signup/auth_service_firebase_signup.dart';
//import '../services/counter/counter_service_rest.dart';

//import '../services/auth/auth_service_mock.dart';
//import '../services/counter/counter_service_mock.dart';
import '../services/auth/auth_service.dart';
import '../services/auth/auth_service_firebase_token.dart';
import '../services/auth_signup/auth_service_signup.dart';
import '../services/auth_signup/auth_service_firebase_token_signup.dart';

GetIt dependency = GetIt.instance;
//FirebaseAuth _firebaseAuth;
void init() {
  // Services
  dependency.registerLazySingleton<RestService>(
      //baseUrl for new map project
      () => RestService(
          baseUrl:
              "https://us-central1-map-sport-project.cloudfunctions.net/api",
          enableSession: true)

      //baseUrl for Json Server
      // () => RestService(baseUrl: 'http://192.168.0.112:3000'),

      // baseUrl for local Firebase console
      // () => RestService(
      //     baseUrl: 'http://10.211.99.94:5001/sport-map-project/us-central1/api'),

      //baseUrl for Online Firebase
      // () => RestService(
      //     baseUrl:
      //         'https://us-central1-sport-map-project.cloudfunctions.net/api'),
      );

  dependency
      .registerLazySingleton<AuthService>(() => AuthServiceFirebaseToken());
  dependency.registerLazySingleton<AuthServiceSignup>(
      () => AuthServiceSignupFirebaseToken());
  //dependency.registerLazySingleton<CounterService>(() => CounterServiceRest());
  //dependency.registerLazySingleton<AuthService>(() => AuthServiceRest());
  // dependency.registerLazySingleton<AuthService>(() => AuthServiceFirebase());
  // dependency.registerLazySingleton<AuthServiceSignup>(
  //     () => AuthServiceFirebaseSignup());
  //dependency.registerLazySingleton<CounterService>(() => CounterServiceMock());
  //dependency.registerLazySingleton<AuthService>(() => AuthServiceMock());

  //Sports
  dependency.registerLazySingleton<SportService>(() => SportServiceRest());
  dependency.registerLazySingleton<ParticipantService>(
      () => ParticipantServiceRest());

  // Viewmodels
  dependency.registerLazySingleton(() => UserViewmodel());
  dependency.registerLazySingleton(() => MainViewmodel());
}
