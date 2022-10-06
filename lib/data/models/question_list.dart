class QuestionList {
  late List<Question>? questionList = [];

  QuestionList({this.questionList});

  QuestionList.fromJson(Map<String, dynamic> json) {
    if (json['questions'] != null) {
      questionList = <Question>[];
      json['questions'].forEach((v) {
        questionList!.add(Question.fromJson(v));
      });
    }
  }
}

class Question {
  String? question;
  Answers? answers;
  String? questionImageUrl;
  String? correctAnswer;
  int? score;

  Question({this.question, this.answers, this.questionImageUrl, this.correctAnswer, this.score});

  Question.fromJson(Map<String, dynamic> json) {
    question = json['question'];
    answers = json['answers'] != null ? Answers.fromJson(json['answers']) : null;
    questionImageUrl = json['questionImageUrl'] != null ? json['questionImageUrl'] : null;
    correctAnswer = json['correctAnswer'];
    score = json['score'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['question'] = question;
    if (answers != null) {
      data['answers'] = answers!.toJson();
    }
    data['questionImageUrl'] = questionImageUrl;
    data['correctAnswer'] = correctAnswer;
    data['score'] = score;
    return data;
  }
}

class Answers {
  String? a;
  String? b;
  String? c;
  String? d;

  Answers({this.a, this.b, this.c, this.d});

  Answers.fromJson(Map<String, dynamic> json) {
    a = json['A'];
    b = json['B'];
    c = json['C'];
    d = json['D'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['A'] = a;
    data['B'] = b;
    data['C'] = c;
    data['D'] = d;
    return data;
  }
}
