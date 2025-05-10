// Define model for Lesson
import 'package:quiz_analytic/Models/lesson_point.dart';

class Lesson {
  final int id;
  final String title;
  final String desc;
  final List<LessonPoint> points;
  final String? coverUrl;

  Lesson({
    required this.id,
    required this.title,
    required this.desc,
    required this.points,
    this.coverUrl,
  });

  factory Lesson.fromJson(Map<String, dynamic> json) {
    var pointsFromJson = json['points'] as List;
    List<LessonPoint> pointsList =
        pointsFromJson.map((point) => LessonPoint.fromJson(point)).toList();

    return Lesson(
      id: json['id'],
      title: json['title'],
      desc: json['desc'],
      points: pointsList,
      coverUrl: json['cover']?['url'],
    );
  }
}

