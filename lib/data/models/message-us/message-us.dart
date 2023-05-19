import 'package:equatable/equatable.dart';

class MessageUs extends Equatable {
  late int id;
  late int userId;
  late String title;
  late String message;

  MessageUs({
    required this.id,
    required this.userId,
    required this.title,
    required this.message,
  });

  MessageUs.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? 0;
    userId = json['userId'] ?? 0;
    title = json['title'] ?? "";
    message = json['message'] ?? "";
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
  List<Object?> get props => [id];
}
