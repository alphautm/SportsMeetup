import 'package:flutter/material.dart';
import 'package:porcupine_project/models/activity.dart';
import 'package:porcupine_project/services/spring_framework.dart/activity_api.dart';
import '../../../participant_viewmodel.dart';
import '../../../screens/participant/joined_sports/widgets/body.dart';
import '../../../screens/participant/joined_sports/widgets/bar.dart';
import '../../view.dart';
import '../main_viewmodel.dart';

class JoinedMainScreen extends StatefulWidget {
  static Route route() =>
      MaterialPageRoute(builder: (context) => JoinedMainScreen());

  JoinedMainScreen({viewmodel, partviewmodel})
      : _mainViewmodel = viewmodel,
        participantViewmodels = partviewmodel;

  MainViewmodel _mainViewmodel;
  ParticipantViewmodel participantViewmodels;

  @override
  _JoinedMainScreenState createState() => _JoinedMainScreenState();
}

class _JoinedMainScreenState extends State<JoinedMainScreen> {
  Activity activity;
  getData() async {
    activity = await getActivities("Token", 1);
  }

  double getProportionateScreenHeight(double inputHeight) {
    MediaQueryData _mediaQueryData;
    double screenHeight = _mediaQueryData.size.height;
    // 812 is the layout height that designer use
    return (inputHeight / 812.0) * screenHeight;
  }

// Get the proportionate height as per screen size
  double getProportionateScreenWidth(double inputWidth) {
    MediaQueryData _mediaQueryData;
    double screenWidth = _mediaQueryData.size.width;
    // 375 is the layout width that designer use
    return (inputWidth / 375.0) * screenWidth;
  }
  @override
  Widget build(BuildContext context) {
    return View(
        viewmodel: widget._mainViewmodel,
        builder: (_context, _viewmodel, _) => WillPopScope(
              onWillPop: () => Future.value(true),
              child: SafeArea(
                child: Scaffold(
                  backgroundColor: Color.fromRGBO(186, 214, 247, 1),
                  appBar: Bar(
                    state: this,
                  ),
                  // body: Body(
                  //   state: this,
                  //   data: widget._mainViewmodel,
                  //   data2: widget.participantViewmodels,
                  // ),
                  body:  Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
          color: Color.fromARGB(255, 248, 184, 249),
          border:
              Border.all(color: Color.fromARGB(255, 255, 255, 255), width: 10),
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
                color: Color.fromARGB(255, 252, 48, 255), offset: Offset(5, 5))
          ]),
      child: FutureBuilder(
        future: getData(),
        builder: (context, projectSnap) {
          if (projectSnap.connectionState == ConnectionState.none) {
            print('project snapshot data is: ${projectSnap.data}');
            return const SizedBox();
          } else if (projectSnap.connectionState == ConnectionState.done) {
            return SizedBox(
               width: 600, 
               height: 150,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                         Padding(
                padding: const EdgeInsets.fromLTRB(0, 4.0, 0, 4.0),
                child: Text.rich(
                  TextSpan(
                    text: "Activity Title: ",
                    style: TextStyle(
                        fontWeight: FontWeight.w600, color: Color(0xFF6F35A5)),
                    children: [
                      TextSpan(
                          text: activity.name,
                          style: Theme.of(context).textTheme.bodyText1),
                    ],
                  ),
                ),
              ),
             Padding(
                padding: const EdgeInsets.fromLTRB(0, 4.0, 0, 4.0),
                child: Text.rich(
                  TextSpan(
                    text: "Activity Description: ",
                    style: TextStyle(
                        fontWeight: FontWeight.w600, color: Color(0xFF6F35A5)),
                    children: [
                      TextSpan(
                          text: activity.description,
                          style: Theme.of(context).textTheme.bodyText1),
                    ],
                  ),
                ),
              ),
            Padding(
                padding: const EdgeInsets.fromLTRB(0, 4.0, 0, 4.0),
                child: Text.rich(
                  TextSpan(
                    text: "Activity Date: ",
                    style: TextStyle(
                        fontWeight: FontWeight.w600, color: Color(0xFF6F35A5)),
                    children: [
                      TextSpan(
                          text: activity.date,
                          style: Theme.of(context).textTheme.bodyText1),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 4.0, 0, 4.0),
                child: Text.rich(
                  TextSpan(
                    text: "Activity Priority: ",
                    style: TextStyle(
                        fontWeight: FontWeight.w600, color: Color(0xFF6F35A5)),
                    children: [
                      TextSpan(
                          text: activity.time,
                          style: Theme.of(context).textTheme.bodyText1),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 4.0, 0, 4.0),
                child: Text.rich(
                  TextSpan(
                    text: "Activity Notification: ",
                    style: TextStyle(
                        fontWeight: FontWeight.w600, color: Color(0xFF6F35A5)),
                    children: [
                      TextSpan(
                          text: activity.venue,
                          style: Theme.of(context).textTheme.bodyText1),
                    ],
                  ),
                ),
              ),
                ],
              ),
            );
          } else {
            return const SizedBox();
          }
        },
      ),
    ),
                ),
              ),
            ));
  }
}
