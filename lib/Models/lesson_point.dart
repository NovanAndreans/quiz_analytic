// Define model for Lesson Point
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