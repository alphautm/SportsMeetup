import 'package:flutter/material.dart';
import 'package:porcupine_project/models/task_event.dart';
import 'package:porcupine_project/services/spring_framework.dart/task_event_api.dart';
import '/screens/host/sport_detail/host_sport_detail_screen.dart';
import '/screens/host/hostmain_viewmodel.dart';
import '../../view.dart';

class Body extends StatefulWidget {
  Body(HostMainViewmodel viewmodel) : _viewmodel = viewmodel;

  final HostMainViewmodel _viewmodel;

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  void _sportDetail(
      HostMainViewmodel viewmodel, int index, BuildContext context) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) =>
                HostSportDetailScreen(data: viewmodel, index: index)));
  }

  List<TaskEvent> taskEvent = [];
  getData() async {
    taskEvent = await getTaskEvent("Token", 1);
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
    return Container(
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
            return Column(
              children: [
                Expanded(
                  child: SizedBox(
                    height: 200.0,
                    child: ListView.builder(
                      itemCount: taskEvent.length,
                      itemBuilder: (context, index) => Padding(
                        padding: EdgeInsets.symmetric(vertical: 10),
                        child:    SizedBox(
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
                        text: "Event Title: ",
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF6F35A5)),
                        children: [
                          TextSpan(
                              text: taskEvent[index].title,
                              style: Theme.of(context).textTheme.bodyText1),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 4.0, 0, 4.0),
                    child: Text.rich(
                      TextSpan(
                        text: "Event Description: ",
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF6F35A5)),
                        children: [
                          TextSpan(
                              text: taskEvent[index].description,
                              style: Theme.of(context).textTheme.bodyText1),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 4.0, 0, 4.0),
                    child: Text.rich(
                      TextSpan(
                        text: "Event Date: ",
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF6F35A5)),
                        children: [
                          TextSpan(
                              text: taskEvent[index].date,
                              style: Theme.of(context).textTheme.bodyText1),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 4.0, 0, 4.0),
                    child: Text.rich(
                      TextSpan(
                        text: "Event Priority: ",
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF6F35A5)),
                        children: [
                          TextSpan(
                              text: taskEvent[index].priority,
                              style: Theme.of(context).textTheme.bodyText1),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 4.0, 0, 4.0),
                    child: Text.rich(
                      TextSpan(
                        text: "Event Notification: ",
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF6F35A5)),
                        children: [
                          TextSpan(
                              text: taskEvent[index].notifcation,
                              style: Theme.of(context).textTheme.bodyText1),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )
                      ),
                    ),
                  ),
                ),
              ],
            );

         
          } else {
            return const SizedBox();
          }
        },
      ),
    );
    // return View(
    //     viewmodel: widget._viewmodel,
    //     builder: (_context, _viewmodel, _child) {
    //       if (_viewmodel.sportListById.length == 0) {
    //         return new Container(
    //           child: Center(
    //             child: Text(
    //               "No sports hosted yet. Please click on the + button to host new sports",
    //               textAlign: TextAlign.center,
    //             ),
    //           ),
    //         );
    //       } else {
    //         return new Container(
    //             width: double.infinity,
    //             height: double.infinity,
    //             child: _buildListView(_viewmodel));
    //       }
    //     });
  }

  ListView _buildListView(HostMainViewmodel _viewmodel) {
    return ListView.separated(
      itemCount: _viewmodel.sportListById.length,
      separatorBuilder: (context, index) => Divider(
        color: Colors.blueGrey,
      ),
      itemBuilder: (context, index) => _listTile(index, context, _viewmodel),
    );
  }

  ListTile _listTile(
      int index, BuildContext context, HostMainViewmodel _viewmodel) {
    return ListTile(
        title: Card(
      child: ListTile(
        leading: ConstrainedBox(
          constraints: BoxConstraints(
            minWidth: 44,
            minHeight: 100,
            maxWidth: 80,
            maxHeight: 180,
          ),
          child: Image.network(_viewmodel.sportListById[index].imgUrl,
              fit: BoxFit.cover),
        ),
        title: Text('${_viewmodel.sportListById[index].category}'),
        subtitle: Text('Gender: ${_viewmodel.sportListById[index].gender}' +
            '\nDate: ${_viewmodel.sportListById[index].date}'),
        trailing: Icon(Icons.more_vert),
        isThreeLine: true,
        onTap: () => _sportDetail(_viewmodel, index, context),
      ),
    ));
  }
}
