import 'package:equatable/equatable.dart';

class MessageUsRequest extends Equatable {
  final String title;
  final String message;

  const MessageUsRequest({required this.title, required this.message});

  @override
  List<Object?> get props => [title, message];

  Map<String, dynamic> toJson() => {"title": title, "message": message};
}
