import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:porcupine_project/models/spring_user.dart';
import 'package:porcupine_project/models/task_event.dart';



getSpringUser(token, userID) async {
  //set api url
  final queryParameters = {
    'userID': userID.toString(),
  };

  Map<String, String> header = {
    HttpHeaders.authorizationHeader: "Token $token",
    HttpHeaders.contentTypeHeader: "application/json"
  };

  var url = "http://10.0.2.2:8080/getUsers";

  Uri uri = Uri.parse(url);
  final finalUri = uri.replace(queryParameters: queryParameters); //USE THIS
  print("meow");
  print(finalUri);
  final response = await http.get(
    finalUri,
    headers: header,
  );

  var respStr = await response.body;
  var jsonResponse = jsonDecode(respStr);

  //get api result
  if (response.statusCode == 200) {
    print(jsonResponse);
    SpringUser springUser = SpringUser.fromJson(jsonDecode(respStr));

    return springUser;
  } else {
    print("Failed");
  }
}


