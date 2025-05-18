class Quiz {
  final int id;
  final String title;
  final String description;
  final LessonPoint lessonPoint;
  final List<Question> questions;
  final Cover cover;

  Quiz({
    required this.id,
    required this.title,
    required this.description,
    required this.lessonPoint,
    required this.questions,
    required this.cover,
  });

  factory Quiz.fromJson(Map<String, dynamic> json) {
    var questionsList = List<Question>.from(json['questions'].map((x) => Question.fromJson(x)));
    var cover = Cover.fromJson(json['cover']);
    var lessonPoint = LessonPoint.fromJson(json['lesson_point']);

    return Quiz(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      lessonPoint: lessonPoint,
      questions: questionsList,
      cover: cover,
    );
  }
}

class LessonPoint {
  final int id;
  final String title;
  final String content;

  LessonPoint({
    required this.id,
    required this.title,
    required this.content,
  });

  factory LessonPoint.fromJson(Map<String, dynamic> json) {
    return LessonPoint(
      id: json['id'],
      title: json['title'],
      content: json['content'],
    );
  }
}

class Question {
  final int id;
  final String question;
  final List<Option> options;

  Question({
    required this.id,
    required this.question,
    required this.options,
  });

  factory Question.fromJson(Map<String, dynamic> json) {
    var optionsList = List<Option>.from(json['options'].map((x) => Option.fromJson(x)));
    
    return Question(
      id: json['id'],
      question: json['question'],
      options: optionsList,
    );
  }
}

class Option {
  final int id;
  final String option;
  final bool isCorrect;

  Option({
    required this.id,
    required this.option,
    required this.isCorrect,
  });

  factory Option.fromJson(Map<String, dynamic> json) {
    return Option(
      id: json['id'],
      option: json['option'],
      isCorrect: json['is_correct'] == 1, // Assume 1 means correct
    );
  }
}

class Cover {
  final String url;

  Cover({
    required this.url,
  });

  factory Cover.fromJson(Map<String, dynamic> json) {
    return Cover(
      url: json['url'],
    );
  }
}
