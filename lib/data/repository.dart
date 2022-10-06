import 'package:dartz/dartz.dart';
import 'package:flutter_app_template/data/models/question_list.dart';
import 'package:flutter_app_template/data/network_helper.dart';

class Repository {
  static Future<Either<String, QuestionList>> getQuestionList() async {
    var data = await NetworkHelper.getData();
    return data.fold((l) => Left(l), (r) => Right(QuestionList.fromJson(r)));
  }
}
