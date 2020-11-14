import 'dart:convert';

import 'package:alert/ViewListResult.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

import 'GroupInfo.dart';
import 'widget/SelectScatter.dart';

/// вьюха текущего состояния
class InfoView extends StatefulWidget {
  @override
  createState() => InfoViewState();
}

class InfoViewState extends State<InfoView> {
  final _formKey = GlobalKey<FormState>();
  var _dateTextController = new TextEditingController();
  List<GroupInfo> _listResult = new List<GroupInfo>();
  DateTime _selectedDate;

  /// Конструктор
  InfoViewState() {
    _selectedDate = DateTime.parse('2019-04-01');
    print('init date: $_selectedDate');
  }

  @override
  Widget build(BuildContext context) {
    _dateTextController.text = _formatDate(_selectedDate);
    return Container(
        child: Column(
      children: [
        Form(
          key: _formKey,
          child: Row(
//            crossAxisAlignment: CrossAxisAlignment.baseline,
            children: [
              Expanded(
                  child: TextFormField(
                decoration: InputDecoration(
                    labelText: 'Дата', icon: Icon(Icons.date_range)),
                onTap: () {
                  _selectDate(context);
                },
                readOnly: true,
                controller: _dateTextController,
              )),
              RaisedButton(
                  child: Text('Получить'),
                  onPressed: () {
                    if (_formKey.currentState.validate()) {
                      _fetchGroupInfo(_selectedDate);
                    }
                  })
            ],
          ),
        ),
        SelectScatter(),
        Expanded(child: ViewListResult(_listResult))
      ],
    ));
  }

  /// Получает данные
  _fetchGroupInfo(DateTime dateTime) {
    String uri = 'http://localhost:8080/info/get';
    var _header = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Accept-Charset': 'utf-8'
    };
    var _body = jsonEncode({
      'scatter': 11,
      'timePoint': dateTime.toIso8601String(),
      'retroHour': 24
    });
    http.post(uri, headers: _header, body: _body).then((value) {
      print(value.body);
      setState(() {
        _listResult.clear();
        _listResult.addAll(_mapping(value.body));
      });
    }).catchError((onError) {
      print('error: $onError');
      setState(() {
        _listResult.clear();
      });
    });
  }

  List<GroupInfo> _mapping(String json) {
    List<dynamic> obj = jsonDecode(json);
    var list = List<GroupInfo>();
    obj.forEach((item) {
      list.add(GroupInfo.fromJson(item));
    });
    return list;
  }

  /// Формат даты
  String _formatDate(DateTime dateTime) {
    return DateFormat('dd-MM-yyyy').format(dateTime);
  }

  /// Диалог выбора даты
  _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        locale: Localizations.localeOf(context),
        initialDate: _selectedDate,
        firstDate: DateTime(2019, 1),
        lastDate: DateTime(2020, 8));
    if (picked != null && picked != _selectedDate)
      setState(() {
        _selectedDate = picked;
      });
  }
}