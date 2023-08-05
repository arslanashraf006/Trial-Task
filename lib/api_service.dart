import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:task_app/weather_model.dart';
import 'package:http/http.dart' as http;

class ApiServices with ChangeNotifier {
  WeatherClass? _data;
  bool _isLoading=false;

  bool get isLoading => _isLoading;

  set isLoading(bool value) {
    _isLoading = value;
  }

  WeatherClass? get data => _data;

  set data(value) {
    _data = value;
  }

  String url = 'https://api.waqi.info/feed/Lahore/?token=4c161cc78151405d23e02d352f41b10bdf3df790';
  Future getWeatherData() async {
    var response = await http.get(Uri.parse(url),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          // 'Authorization': 'Token bfdf77e6a72ce81badfcc847aaf041255cd65928',
        }
    );
    try{
      if(response.statusCode == 200 || response.statusCode == 201) {
        _data=WeatherClass.fromJson(json.decode(response.body));
        _isLoading=true;
        notifyListeners();
      }
      _isLoading=false;
      notifyListeners();
    }catch(e){
      Fluttertoast.showToast(
        msg: e.toString(),
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.grey[600],
        textColor: Colors.white,
        fontSize: 16.0,
      );
    }
  }
}