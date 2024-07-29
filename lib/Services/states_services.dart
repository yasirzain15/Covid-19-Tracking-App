// ignore_for_file: unused_local_variable, unused_import

import 'dart:convert';

import 'package:covid_tracker/Models/world_states_model.dart';
import 'package:covid_tracker/Services/Utilities/app_url.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class StatesServices {
  Future<WorldStatesModels> fethWorldStatesRecords() async {
    final responce =
        await http.get(Uri.parse('https://disease.sh/v3/covid-19/all'));
    var data = jsonDecode(responce.body.toString());
    if (responce.statusCode == 200) {
      return WorldStatesModels.fromJson(data);
    } else {
      throw Exception('error');
    }
  }

  Future<List<dynamic>> countriesListApi() async {
    final responce =
        await http.get(Uri.parse('https://disease.sh/v3/covid-19/countries'));
    var data = jsonDecode(responce.body.toString());
    if (responce.statusCode == 200) {
      return data;
    } else {
      throw Exception('error');
    }
  }
}
