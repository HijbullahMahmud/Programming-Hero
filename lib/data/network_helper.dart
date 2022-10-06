import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:flutter_app_template/data/models/question_list.dart';
import 'package:flutter_app_template/utils/strings.dart';
import 'package:http/http.dart' as http;

class NetworkHelper {
  

  static Future<Either<String, dynamic>> getData() async {
    const String url = "https://herosapp.nyc3.digitaloceanspaces.com/quiz.json";
    try {
      final data = await http.get(Uri.parse(url));
      Either<String, dynamic> response = _manageResponse(data);
      return response;
    } catch (e) {
      return Left(e.toString());
    }
  }

  static Either<String, dynamic> _manageResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        return Right(json.decode(response.body));

      default:
        return const Left(Strings.somethingWentWrong);
    }
  }
}
