import 'package:flutter/material.dart';
import '../../../../screens/participant/main_viewmodel.dart';

import '../../../view.dart';

class Body extends StatelessWidget {
  Body({index}) : _index = index;

  final _index;
  final MainViewmodel _mainViewmodel = MainViewmodel();
  @override
  Widget build(BuildContext context) {
    return View(
      viewmodel: _mainViewmodel,
      builder: (_context, _viewmodel, _child) {
        final MainViewmodel _viewmodel = _mainViewmodel;
        print(_viewmodel.sportList[1].category);
        print(_index);
        return new Container(
          width: double.infinity,
          height: double.infinity,
          child: Stack(
            alignment: Alignment.topCenter,
            children: <Widget>[
              Container(
                height: 300.0,
                decoration: BoxDecoration(
                    image: DecorationImage(
                  fit: BoxFit.cover,
                  alignment: FractionalOffset.center,
                  image: NetworkImage(_viewmodel.sportList[_index].imgUrl),
                )),
              ),
              Container(
                margin: EdgeInsets.only(top: 280),
                width: MediaQuery.of(context).size.width * 0.92,
                child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('${_viewmodel.sportList[_index].category}',
                        style: TextStyle(fontSize: 19),
                        maxLines: 1,
                        textAlign: TextAlign.center)),
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.8),
                      spreadRadius: 1,
                      blurRadius: 3,
                      offset: Offset(1, 1),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 340),
                width: MediaQuery.of(context).size.width * 0.92,
                height: 200,
                child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                        '${_viewmodel.sportList[_index].description}' +
                            '\nDate: ${_viewmodel.sportList[_index].date}' +
                            '\nTime: ${_viewmodel.sportList[_index].time}' +
                            '\nVenue: ${_viewmodel.sportList[_index].venue}' +
                            '\nGender: ${_viewmodel.sportList[_index].gender}',
                        style: TextStyle(
                            fontSize: 17, height: 2.0, color: Colors.white),
                        textAlign: TextAlign.left)),
                decoration: BoxDecoration(
                  color: Color.fromRGBO(74, 98, 124, 1),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.8),
                      spreadRadius: 1,
                      blurRadius: 3,
                      offset: Offset(1, 1),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
