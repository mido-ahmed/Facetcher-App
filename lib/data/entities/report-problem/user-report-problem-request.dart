import 'package:equatable/equatable.dart';

class ReportProblemRequest extends Equatable {
  final String title;
  final String message;

  const ReportProblemRequest({required this.title, required this.message});

  @override
  List<Object?> get props => throw UnimplementedError();

  Map<String, dynamic> toPostJson() => {"title": title, "message": message};
}