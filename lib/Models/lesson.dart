class Lesson {
  final int id;
  final String title;
  final String desc;
  final String? coverUrl;

  Lesson({
    required this.id,
    required this.title,
    required this.desc,
    this.coverUrl,
  });

  factory Lesson.fromJson(Map<String, dynamic> json) {
    return Lesson(
      id: json['id'],
      title: json['title'],
      desc: json['desc'],
      coverUrl: json['cover']?['url'],
    );
  }
}
