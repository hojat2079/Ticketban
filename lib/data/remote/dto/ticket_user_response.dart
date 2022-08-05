import 'package:equatable/equatable.dart';
import 'package:ticketban_mobile/domain/model/ticket_user.dart';

class TicketUserDto extends Equatable {
  final String id;
  final String title;
  final String desc;
  final String date;
  final String type;
  final String status;
  final String userId;

  const TicketUserDto({
    required this.id,
    required this.title,
    required this.desc,
    required this.date,
    required this.type,
    required this.status,
    required this.userId,
  });

  TicketUserDto.fromJson(Map<String, dynamic> json)
      : title = json['title'],
        desc = json['description'],
        status = json['status'],
        type = json['requestType'],
        date = json['date'],
        id = json['_id'],
        userId = json['user'];

  TicketUserModel toTicketUserModel() {
    return TicketUserModel(
      id: id,
      title: title,
      desc: desc,
      date: date,
      type: type,
      status: status,
    );
  }

  @override
  List<Object> get props => [id, title, desc, date, type, status, userId];
}
