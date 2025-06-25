import 'dart:convert';

import 'package:api_integration/Model/get_number_facts_model/get_number_facts_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<GetNumberFactsModel> GetNumberFacts(int number)async{
  final response = await http.get(Uri.parse('http://numbersapi.com/$number?json'));
  final result = jsonDecode(response.body) as Map<String,dynamic>;
  final data= GetNumberFactsModel.fromJson(result);
  return data;
}