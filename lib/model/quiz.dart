import 'package:smart_quiz/model/question.dart';

class Quiz {
  final String id;
  final String title;
  final String categoryId;
  final int timeLimit;
  final List<Question> question;
  final DateTime? createdAt;
  final DateTime? updateAt;

  Quiz({
    required this.id,
    required this.title,
    required this.categoryId,
    required this.timeLimit,
    required this.question,
    required this.createdAt,
    required this.updateAt,
  });

  factory Quiz.fromMap(String id, Map<String, dynamic> map) {
    return Quiz(
      id: id,
      title: map['title'] ?? "",
      categoryId: map['categoryId'] ?? "",
      timeLimit: map['timeLimit'] ?? 0,
      question: ((map['question'] ?? []) as List)
          .map((e) => Question.fromMap(e))
          .toList()
          .toList(),
      createdAt: map['createdAt']?.toDate(),
      updateAt: map['updateAt']?.toDate(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'categoryId': categoryId,
      'timeLimit': timeLimit,
      'question': question.map((e) => e.toMap()).toList(),
      'createdAt': createdAt ?? DateTime.now(),
      'updateAt': updateAt ?? DateTime.now(),
    };
  }

  Quiz copyWith({
    String? title,
    String? categoryId,
    int? timeLimit,
    List<Question>? question,
  }) {
    return Quiz(
      id: id,
      title: title ?? this.title,
      categoryId: categoryId ?? this.categoryId,
      timeLimit: timeLimit ?? this.timeLimit,
      question: question ?? this.question,
      createdAt: createdAt,
      updateAt: DateTime.now(),
    );
  }
}
