import 'package:equatable/equatable.dart';

class TicketUserModel extends Equatable {
  final String id;
  final String title;
  final String desc;
  final String date;
  final String type;
  final String status;

  const TicketUserModel({
    required this.id,
    required this.title,
    required this.desc,
    required this.date,
    required this.type,
    required this.status,
  });

  @override
  List<Object> get props => [id, title, desc, date, type, status];
}
