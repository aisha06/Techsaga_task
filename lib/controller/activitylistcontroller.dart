import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:taskk/models/activitiesModel.dart';
import 'package:taskk/models/activitylistModel.dart';
import 'package:taskk/models/fitnessImageModel.dart';
// Replace with the path to your model file

class ActivitiesService {
  final String _baseUrl =
      'https://gymwise.in/api/v1/customer/gymListByCategory';

  Future<ActivitiesListModel> activittielistSerice(
    int category_id,
  ) async {
    final Uri url = Uri.parse(_baseUrl);
    final Map<String, String> headers = {"Content-Type": "application/json"};
    final Map<String, dynamic> body = {
      "category_id": category_id,
    };

    final response = await http.post(
      url,
      headers: headers,
      body: json.encode(body),
    );

    if (response.statusCode == 200) {
      return activitiesListModelFromJson(response.body);
    } else {
      throw Exception('Failed to load fitness images');
    }
  }
}
