import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '/models/sports.dart';
import '/screens/host/hostmain_viewmodel.dart';

import '../../view.dart';

class AddSportsScreen extends StatelessWidget {
  AddSportsScreen({data}) : _viewmodel = data;
  HostMainViewmodel _viewmodel;

  String _selectedDate;

  void _onSave(context) {
    var _sports = new Sports(
        category: _viewmodel.category,
        date: _viewmodel.date,
        gender: _viewmodel.gender,
        hostid: _viewmodel.user.id,
        imgUrl: "",
        time: _viewmodel.time,
        description: _viewmodel.description,
        venue: _viewmodel.venue);
    Navigator.pop(context, _sports);
  }

  @override
  Widget build(BuildContext context) {
    return View(
        viewmodel: _viewmodel,
        builder: (_context, _viewmodel, _child) {
          return new Scaffold(
            appBar: new AppBar(
              title: Text(
                'Host New Sports',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              backgroundColor: Color.fromRGBO(64, 64, 64, 1),
            ),
            body: Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(color: Colors.grey[100]),
              child: SingleChildScrollView(
                child: new Column(
                  children: <Widget>[
                    _buildTextLisTile(
                      leading: const Icon(Icons.sports_tennis_rounded),
                      label: 'Category',
                      value: _viewmodel.category,
                      onChanged: (value) => _viewmodel.category = value,
                    ),
                    _buildTextLisTile(
                      leading: const Icon(Icons.person),
                      label: 'Gender',
                      value: _viewmodel.gender,
                      onChanged: (value) => _viewmodel.gender = value,
                    ),
                    _buildTextLisTile(
                      leading: const Icon(Icons.access_time),
                      label: 'Time',
                      value: _viewmodel.time,
                      onChanged: (value) => _viewmodel.time = value,
                    ),
                    _buildTextLisTile(
                      leading: const Icon(Icons.article_outlined),
                      label: 'Description',
                      value: _viewmodel.description,
                      onChanged: (value) => _viewmodel.description = value,
                    ),
                    _buildTextLisTile(
                      leading: const Icon(Icons.location_on_outlined),
                      label: 'Venue',
                      value: _viewmodel.venue,
                      onChanged: (value) => _viewmodel.venue = value,
                    ),
                    ElevatedButton(
                      child: Text(
                        'Pick Date',
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () => _selectDate(context),
                      style: ElevatedButton.styleFrom(
                        primary: Color.fromRGBO(6, 72, 130, 1),
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        textStyle: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    SizedBox(height: 30.0),
                    _buildButtons(context)
                  ],
                ),
              ),
            ),
          );
        });
  }

  ListTile _buildTextLisTile({leading, label, value, onChanged, onTap}) {
    return new ListTile(
      leading: leading,
      title: TextFormField(
        initialValue: value,
        autofocus: true,
        decoration: InputDecoration(
          labelText: label,
        ),
        onChanged: onChanged,
        onTap: onTap,
      ),
    );
  }

  Row _buildButtons(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
          child: Text('Cancel'),
          onPressed: () => Navigator.pop(context, null),
          style: ElevatedButton.styleFrom(
            primary: Color.fromRGBO(200, 200, 200, 1),
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            textStyle: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
        SizedBox(width: 100.0),
        ElevatedButton(
          child: Text('Save'),
          onPressed: () => _onSave(context),
          style: ElevatedButton.styleFrom(
            primary: Color.fromRGBO(0, 102, 102, 1),
            onPrimary: Colors.white,
            padding: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
            textStyle: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    DateTime newSelectedDate = await showDatePicker(
        context: context,
        initialDate: _selectedDate != null ? _selectedDate : DateTime.now(),
        firstDate: DateTime(2000),
        lastDate: DateTime(2040),
        builder: (BuildContext context, Widget child) {
          return Theme(
            data: ThemeData.light().copyWith(
              colorScheme: ColorScheme.light(
                primary: Color.fromRGBO(0, 60, 129, 1),
                onPrimary: Colors.white,
                surface: Colors.white,
                onSurface: Colors.black,
              ),
              dialogBackgroundColor: Colors.white,
            ),
            child: child,
          );
        });

    if (newSelectedDate != null) {
      _viewmodel.date = DateFormat.yMMMd().format(newSelectedDate).toString();
      _selectedDate = DateFormat.yMMMd().format(newSelectedDate).toString();
      print(_viewmodel.date);
    }
  }
}
