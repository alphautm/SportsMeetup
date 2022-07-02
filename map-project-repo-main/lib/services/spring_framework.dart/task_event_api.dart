import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:porcupine_project/models/task_event.dart';


postTask(token, userID) async {
  //set api url
  final queryParameters = {
    'title': "Hari Keusahawanan",
    'date': "2022-12-1",
    'priority': "Medium",
    'description': "Pameran Tokoh Keusahawanan",
    'notification': "On",
  };

  Map<String, String> header = {
    HttpHeaders.authorizationHeader: "Token $token",
    HttpHeaders.contentTypeHeader: "application/json"
  };

  var url = "http://10.0.2.2:8080/addTasks";

  Uri uri = Uri.parse(url);
  final finalUri = uri.replace(queryParameters: queryParameters); //USE THIS
  print("meow");
  print(finalUri);
  final response = await http.post(
    finalUri,
    headers: header,
  );

  var respStr = await response.body;
  var jsonResponse = jsonDecode(respStr);

  //get api result
  if (response.statusCode == 200) {
    print(jsonResponse);

    List<TaskEvent> taskEvent =
        List<TaskEvent>.from(jsonResponse.map((model) => TaskEvent.fromJson(model)));
    return taskEvent;
  } else {
    print("Failed");
  }
}





getTaskEvent(token, userID) async {
  //set api url
  final queryParameters = {
    'userID': userID.toString(),
  };

  Map<String, String> header = {
    HttpHeaders.authorizationHeader: "Token $token",
    HttpHeaders.contentTypeHeader: "application/json"
  };

  var url = "http://10.0.2.2:8080/getTasks";

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

    List<TaskEvent> taskEvent =
        List<TaskEvent>.from(jsonResponse.map((model) => TaskEvent.fromJson(model)));
    return taskEvent;
  } else {
    print("Failed");
  }
}


