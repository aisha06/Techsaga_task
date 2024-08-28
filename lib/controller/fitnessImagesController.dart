import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:taskk/models/activitiesModel.dart';
import 'package:taskk/models/fitnessImageModel.dart';
// Replace with the path to your model file

class ApiService {
  final String _baseUrl = 'https://gymwise.in/api/v1/customer/gymList';

  Future<FitnesImages> fetchFitnesImages(
      double latitude, double longitude) async {
    final Uri url = Uri.parse(_baseUrl);
    print('deepak....$url');
    final Map<String, String> headers = {"Content-Type": "application/json"};
    final Map<String, dynamic> body = {
      "latitude": latitude,
      "longitude": longitude
    };

    final response = await http.post(
      url,
      headers: headers,
      body: json.encode(body),
    );
    print('deepak....${response.body}');

    if (response.statusCode == 200) {
      return fitnesImagesFromJson(response.body);
    } else {
      throw Exception('Failed to load fitness images');
    }
  }
}
