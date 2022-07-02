import 'package:flutter/material.dart';

import '../../../view.dart';
import '../../hostmain_viewmodel.dart';

class Body extends StatelessWidget {
  Body({index, viewmodel})
      : _index = index,
        _viewmodel = viewmodel;

  final _index;
  final HostMainViewmodel _viewmodel;
  @override
  Widget build(BuildContext context) {
    return View(
      viewmodel: _viewmodel,
      builder: (_context, _viewmodel, _child) {
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
                  image: NetworkImage(_viewmodel.sportListById[_index].imgUrl),
                )),
              ),
              Container(
                margin: EdgeInsets.only(top: 280),
                width: MediaQuery.of(context).size.width * 0.92,
                child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('${_viewmodel.sportListById[_index].category}',
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
                        '${_viewmodel.sportListById[_index].description}' +
                            '\nDate: ${_viewmodel.sportListById[_index].date}' +
                            '\nTime: ${_viewmodel.sportListById[_index].time}' +
                            '\nVenue: ${_viewmodel.sportListById[_index].venue}' +
                            '\nGender: ${_viewmodel.sportListById[_index].gender}',
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
