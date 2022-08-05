import 'package:equatable/equatable.dart';

class TicketRequest extends Equatable {
  final String title;
  final String desc;
  final String type;

  const TicketRequest({
    required this.title,
    required this.desc,
    required this.type,
  });

  @override
  List<Object> get props => [title, desc, type];

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'description': desc,
      'requestType': type,
    };
  }
}
