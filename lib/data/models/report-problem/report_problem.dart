import 'package:equatable/equatable.dart';

class ReportProblem extends Equatable {
  late int id;
  late int userId;
  late String title;
  late String message;

  ReportProblem({
    required this.id,
    required this.userId,
    required this.title,
    required this.message,
  });

  ReportProblem.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['userId'];
    title = json['title'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['userId'] = userId;
    data['title'] = title;
    data['message'] = message;
    return data;
  }

  @override
  List<Object?> get props => throw UnimplementedError();
}
