import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_app_template/data/models/question_list.dart';
import 'package:flutter_app_template/data/repository.dart';
import 'package:flutter_app_template/data/storage_helper.dart';
import 'package:flutter_app_template/routes/routes.dart';
import 'package:get/get.dart';

import '../../utils/utils.dart';

class QuestionController extends GetxController {
  var isLoading = true.obs;
  final questionList = <Question>[].obs;
  final _currentQuestionIndex = 0.obs;
  final _currentQuestion = Question().obs;
  Question get currentQuestion => _currentQuestion.value;
  final isButtonClickable = true.obs;
  var aButtonBorder = BorderSide.none.obs;
  var bButtonBorder = BorderSide.none.obs;
  var cButtonBorder = BorderSide.none.obs;
  var dButtonBorder = BorderSide.none.obs;
  var totalScore = 0.obs;
  Timer? _timer;
  var progressIndicatorTime = 0.obs;

  @override
  void onInit() {
    _getQuestions();
    super.onInit();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _getQuestions() async {
    await Repository.getQuestionList().then((value) {
      value.fold((l) {
        isLoading(false);
        showErrorDialog(message: l);
      }, (r) {
        isLoading(false);
        questionList.value = r.questionList!;
        _currentQuestion.value = r.questionList![0];
        _startTimer(seconds: 10);
      });
    });
  }

  void _startTimer({required int seconds}) {
    if (_timer != null && _timer!.isActive) {
      _timer?.cancel();
      progressIndicatorTime.value = 0;
    }
    Duration duration = const Duration(seconds: 1);
    _timer = Timer.periodic(duration, ((timer) {
      if (seconds == 1) {
        _timer?.cancel();
        progressIndicatorTime.value = 0;
        _nextQuestion();
      } else {
        seconds--;
        progressIndicatorTime.value++;
      }
    }));
  }

  void _nextQuestion() {
    _currentQuestionIndex.value++;
    if (_currentQuestionIndex.value < questionList.length) {
      _currentQuestion.value = questionList[_currentQuestionIndex.value];
      _startTimer(seconds: 10);
    } else {
      //save score
      if (StorageHelper().getHighScore() < totalScore.value) {
        StorageHelper().saveHighScore(totalScore.value);
      }
      //no more questions
      Get.offAllNamed(Routes.homeScreen);
    }
    _resetButtonStyle();
  }

  String questionNumberText() {
    int currentNumber = _currentQuestionIndex.value + 1;
    int totalQuestions = questionList.length;
    return "$currentNumber/$totalQuestions";
  }

  void checkAnswer(String answer) {
    String correctAns = currentQuestion.correctAnswer!;
    _startTimer(seconds: 2);
    switch (answer) {
      case "A":
        if (correctAns == "A") {
          _markAsCorrectAns(selectedAns: answer, correctAns: correctAns);
        } else {
          //change button color red
          _markAsWrongAns(correctAns, answer);
        }
        break;
      case "B":
        if (correctAns == "B") {
          _markAsCorrectAns(selectedAns: answer, correctAns: correctAns);
        } else {
          //change button color red
          _markAsWrongAns(correctAns, answer);
        }
        break;
      case "C":
        if (correctAns == "C") {
          _markAsCorrectAns(selectedAns: answer, correctAns: correctAns);
        } else {
          //change button color red
          _markAsWrongAns(correctAns, answer);
        }
        break;
      case "D":
        if (correctAns == "D") {
          //change button style
          _markAsCorrectAns(selectedAns: answer, correctAns: correctAns);
        } else {
          //change button color red
          _markAsWrongAns(correctAns, answer);
        }
        break;
    }

    isButtonClickable(false);
  }

  void _markAsCorrectAns({required String selectedAns, required String correctAns}) {
    //add score to total score
    if (selectedAns == correctAns) {
      totalScore.value = totalScore.value + (currentQuestion.score ?? 0);
    }

    if (correctAns == "A") {
      aButtonBorder.value = const BorderSide(color: Colors.green, width: 3);
    } else if (correctAns == "B") {
      bButtonBorder.value = const BorderSide(color: Colors.green, width: 3);
    } else if (correctAns == "C") {
      cButtonBorder.value = const BorderSide(color: Colors.green, width: 3);
    } else if (correctAns == "D") {
      dButtonBorder.value = const BorderSide(color: Colors.green, width: 3);
    }
  }

  void _markAsWrongAns(String correctAns, String selectedAns) {
    if (selectedAns == "A") {
      aButtonBorder.value = const BorderSide(color: Colors.red, width: 3);
    } else if (selectedAns == "B") {
      bButtonBorder.value = const BorderSide(color: Colors.red, width: 3);
    } else if (selectedAns == "C") {
      cButtonBorder.value = const BorderSide(color: Colors.red, width: 3);
    } else if (selectedAns == "D") {
      dButtonBorder.value = const BorderSide(color: Colors.red, width: 3);
    }
    _markAsCorrectAns(selectedAns: selectedAns, correctAns: correctAns);
  }

  void _resetButtonStyle() {
    aButtonBorder.value = BorderSide.none;
    bButtonBorder.value = BorderSide.none;
    cButtonBorder.value = BorderSide.none;
    dButtonBorder.value = BorderSide.none;
    isButtonClickable(true);
  }
}
